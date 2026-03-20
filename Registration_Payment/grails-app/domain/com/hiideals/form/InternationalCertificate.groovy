package com.hiideals.form

class InternationalCertificate {

    String firstName
    String lastName
    String phoneNo
    String regNo
    String clubMembershipNo
    String districtCode
	String memberType
	String spouse
	String childrenCount
	String coupons
    String zone
    String club
	String totalAmount


    String paymentId
    String orderId
    Boolean paymentStatus = false

    static constraints = {

        firstName nullable:true
        lastName nullable:true
        phoneNo nullable:true
        regNo nullable:true
        clubMembershipNo nullable:true
        districtCode nullable:true
		memberType nullable:true
		spouse nullable:true
		childrenCount nullable:true
		coupons nullable:true
        zone nullable:true
        club nullable:true
		totalAmount nullable:true
	

        paymentId nullable:true
        orderId nullable:true
        paymentStatus nullable:true
    }
}