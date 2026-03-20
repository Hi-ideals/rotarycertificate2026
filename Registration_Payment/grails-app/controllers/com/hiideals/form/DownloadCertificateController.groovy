package com.hiideals.form

import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
@Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])

class DownloadCertificateController {

    static allowedMethods = [save: "POST"]

    def create() {
        respond new DownloadCertificate(params)
    }

    def errorPage() {}

    // ADD THIS METHOD
    def show(Long id) {

        def downloadCertificateInstance = DownloadCertificate.get(id)

        if(!downloadCertificateInstance){
            redirect action:"errorPage"
            return
        }

        [downloadCertificateInstance: downloadCertificateInstance]
    }

    @Transactional
def save(DownloadCertificate downloadCertificateInstance) {

    if (downloadCertificateInstance == null) {
        redirect action:"errorPage"
        return
    }

    def phnNo = InternationalCertificate.createCriteria().list {
        eq("phoneNo", params.phoneNo)
        eq("paymentStatus", true)
        order("id", "desc")   // latest record
        maxResults(1)
    }?.getAt(0)

    if (!phnNo) {
        flash.message = "No paid registration found for this mobile number"
        redirect action:"errorPage"
        return
    }

    downloadCertificateInstance.downloadDate = new Date()
    downloadCertificateInstance.internationalCertificate = phnNo

    downloadCertificateInstance.save(flush:true)

    redirect(action:"show", id: downloadCertificateInstance.id)
}

@Transactional
def directDownload() {

    def certificate = InternationalCertificate.get(params.id)

    if (!certificate || !certificate.paymentStatus) {
        redirect action: "errorPage"
        return
    }

    def downloadCertificateInstance = new DownloadCertificate()
    downloadCertificateInstance.downloadDate = new Date()
    downloadCertificateInstance.internationalCertificate = certificate
    downloadCertificateInstance.save(flush: true)

    redirect(action: "show", id: downloadCertificateInstance.id)
}


}