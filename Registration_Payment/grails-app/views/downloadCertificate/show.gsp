<!DOCTYPE html>
<html>
<head>

<meta name="layout" content="main">
<title>Certificate</title>

<script>

function downloadCertificate(){

var canvas=document.createElement("canvas");

var mmToPx=3.7795275591;

// Landscape A4
var a4Width = 297 * mmToPx;
var a4Height = 210 * mmToPx;

canvas.width = a4Width;
canvas.height = a4Height;

var ctx=canvas.getContext("2d");

var img=new Image();

img.onload=function(){

    // Maintain aspect ratio (same logic as first script)
    var imageAspectRatio = img.width / img.height;
    var canvasAspectRatio = a4Width / a4Height;

    var renderableWidth, renderableHeight, xStart, yStart;

    if (imageAspectRatio < canvasAspectRatio) {
        renderableHeight = a4Height;
        renderableWidth = img.width * (renderableHeight / img.height);
        xStart = (a4Width - renderableWidth) / 2;
        yStart = 0;
    } 
    else if (imageAspectRatio > canvasAspectRatio) {
        renderableWidth = a4Width;
        renderableHeight = img.height * (renderableWidth / img.width);
        xStart = 0;
        yStart = (a4Height - renderableHeight) / 2;
    } 
    else {
        renderableWidth = a4Width;
        renderableHeight = a4Height;
        xStart = 0;
        yStart = 0;
    }

    // Draw properly scaled image
    ctx.drawImage(img, xStart, yStart, renderableWidth, renderableHeight);

    // ===== TEXT =====
    ctx.fillStyle="#000000";
    ctx.font="bold 18px Arial";

    var name="Rtn. ${downloadCertificateInstance?.internationalCertificate?.firstName?.toUpperCase()}";
    var nameWidth=ctx.measureText(name).width;

    ctx.fillText(name,(canvas.width-nameWidth)/2 - 20,160*mmToPx);


    ctx.font="bold 12px Arial";
    var regNo="${downloadCertificateInstance?.internationalCertificate?.regNo}";
    ctx.fillText(regNo,(canvas.width-nameWidth)/2 + 65,150*mmToPx);

    ctx.fillStyle="#b78942";
    ctx.font="bold 20px Arial";

    var club="${downloadCertificateInstance?.internationalCertificate?.club}";
    var clubWidth=ctx.measureText(club).width;

    ctx.fillText(club, (canvas.width - clubWidth)/2 - 20, 165*mmToPx);

    // ===== DOWNLOAD =====
    var link=document.createElement("a");
    link.href=canvas.toDataURL("image/png");
    link.download="certificate.png";

    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);

};

img.onerror=function(){
    console.log("Background image not loading");
};

img.src="/Pragati/images/pragati2.png";

}

window.onload=function(){
setTimeout(function(){
downloadCertificate();
},800);
}

</script>

</head>

<body>

<div style="text-align:center;margin-top:120px;">

<h1 style="color:green">Generating your certificate...</h1>
<p>Your download will start automatically.</p>

</div>

</body>
</html>