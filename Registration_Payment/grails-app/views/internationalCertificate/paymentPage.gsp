<!DOCTYPE HTML>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>

</head>
<body style="margin:0;">

 <div>
 <img src="${resource(dir: 'images', file: 'header_.png')}" class="img-fluid" alt="Responsive Image" style="border-radius:3px;width:100%;"  />
</div>

<div class="m-5">
</div>

<div class="container mt-5">

    <!-- TABLE -->
    <div class="text-center mt-4">
                <h2>Total Amount to be Paid</h2>
                <h3>₹${certificate?.totalAmount}</h3>
    </div>

    <!-- BUTTON -->
    <div class="text-center mt-4">
        <button id="payBtn" class="btn btn-primary px-4 py-2" style="font-size:18px;font-weight:bold;">
            Make Payment Now
        </button>
    </div>

</div>



<script>

var options = {

    key: "rzp_test_SSFrRUHAGJuo9S",

    amount: "${certificate?.totalAmount?.toInteger() * 100}",

    currency: "INR",

    name: "Rotary Seminar",

    description: "Registration Fee",

    order_id: "${certificate.orderId}",

    handler: function (response){

        window.location.href =
        "/rotary/internationalCertificate/paymentSuccess?id=${certificate.id}"
        + "&paymentId=" + response.razorpay_payment_id
        + "&orderId=" + response.razorpay_order_id;

    },

    theme: {
        color: "#3399cc"
    }

};

var rzp = new Razorpay(options);

document.getElementById('payBtn').onclick = function(e){

    rzp.open();

    e.preventDefault();

}

</script>



</body>
</html>









