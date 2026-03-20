package com.hiideals.form

import static org.springframework.http.HttpStatus.*

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import com.razorpay.RazorpayClient
import com.razorpay.Order
import org.json.JSONObject

@Transactional(readOnly = true)
@Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
class InternationalCertificateController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond InternationalCertificate.list(params), model:[internationalCertificateInstanceCount: InternationalCertificate.count()]
    }

    def show(InternationalCertificate internationalCertificateInstance) {
        respond internationalCertificateInstance
    }

    def create() {
        respond new InternationalCertificate(params)
    }

   def thankyou() {
    def certificate = InternationalCertificate.get(params.id)
    [certificate: certificate]
}

    def report() {
        def formdet = InternationalCertificate.findById(params.id)
        [formdet:formdet]
    }

    @Secured(["ROLE_ADMIN"])
    def adminindex() {
        def formdet = InternationalCertificate.findAll()
        [formdet: formdet]
    }

    @Transactional
def save(InternationalCertificate internationalCertificateInstance) {

    if (internationalCertificateInstance == null) {
        notFound()
        return
    }

    if (internationalCertificateInstance.hasErrors()) {
        respond internationalCertificateInstance.errors, view: 'create'
        return
    }

    // Get form values
    def memberType = params.memberType
    def spouse = params.spouse
    def childrenCount = params.int('childrenCount') ?: 0
    def coupons = params.int('coupons') ?: 0

    //  PRICE CALCULATION
    int totalAmount = 0

    // Member type
    if (memberType == "rotarian") {
        totalAmount += 1500
    } 
	else if (memberType == "rotariankalyan") {
		totalAmount += 1000
	}
	else if (memberType == "innerwheel") {
		totalAmount += 500
	}

    // Spouse
    if (spouse == "yes") {
		if (memberType == "rotariankalyan") {
			totalAmount += 500
		} else {
			totalAmount += 1000
		}
    }

    // Children
    totalAmount += (childrenCount * 500)

    // Coupons
    totalAmount += (coupons * 500)

    // Generate Registration Number
    def registrationNumber = generateRegistrationNumber()
    internationalCertificateInstance.regNo = registrationNumber

    internationalCertificateInstance.paymentStatus = false
    internationalCertificateInstance.totalAmount = totalAmount

    internationalCertificateInstance.save(flush:true)

    // Razorpay
    RazorpayClient razorpay = new RazorpayClient("rzp_test_SSFrRUHAGJuo9S", "ELbBZkOIP1w3WaE5xhc6Ilft")

    JSONObject options = new JSONObject()

    // Razorpay expects amount in PAISA
    options.put("amount", totalAmount * 100)
    options.put("currency", "INR")
    options.put("receipt", "order_" + internationalCertificateInstance.id)

    Order order = razorpay.orders.create(options)

    internationalCertificateInstance.orderId = order.get("id")
    internationalCertificateInstance.save(flush:true)

    redirect(action:"paymentPage", params:[id:internationalCertificateInstance.id])
}

    def paymentPage() {

        def certificate = InternationalCertificate.get(params.id)

        [certificate:certificate]
    }

   @Transactional
def paymentSuccess() {

    def certificate = InternationalCertificate.get(params.id)

    if(certificate){
        certificate.paymentId = params.paymentId
        certificate.paymentStatus = true
        certificate.save(flush:true)
    }

	redirect(url: "https://chat.whatsapp.com/BGrYWchWOMhLkQRCpK2NSZ?mode=gi_t")
}

    def edit(InternationalCertificate internationalCertificateInstance) {
        respond internationalCertificateInstance
    }

    @Transactional
    def update(InternationalCertificate internationalCertificateInstance) {

        if (internationalCertificateInstance == null) {
            notFound()
            return
        }

        if (internationalCertificateInstance.hasErrors()) {
            respond internationalCertificateInstance.errors, view:'edit'
            return
        }

        internationalCertificateInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = "Updated Successfully"
                redirect internationalCertificateInstance
            }
            '*'{ respond internationalCertificateInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(InternationalCertificate internationalCertificateInstance) {

        if (internationalCertificateInstance == null) {
            notFound()
            return
        }

        internationalCertificateInstance.delete flush:true

        redirect action:"index"
    }

    protected void notFound() {
        redirect action:"index"
    }

    private String generateRegistrationNumber() {

        def fixedDatePart = "25082026"
        def prefix = "PRAG"

        def certificates = InternationalCertificate.findAllByRegNoLike("${prefix}${fixedDatePart}%")

        def nextNumber = 1

        if (!certificates.isEmpty()) {

            def latestCert = certificates.sort { a, b -> b.regNo <=> a.regNo }.first()

            def lastNumberPart = latestCert.regNo.replaceAll("${prefix}${fixedDatePart}", "")

            if (lastNumberPart.isInteger()) {
                nextNumber = lastNumberPart.toInteger() + 1
            }
        }

        return "${prefix}${fixedDatePart}${String.format('%03d', nextNumber)}"
    }

}