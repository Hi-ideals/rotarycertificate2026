<%@ page import="com.hiideals.form.DownloadCertificate" %>


<div style="display:flex;align-items:center;justify-content:center;" class="mblnumber fieldcontain ${hasErrors(bean: downloadCertificateInstance, field: 'phoneNo', 'error')} ">
	
	<g:textField name="phoneNo" class="form-control" style="border:2px solid black;width:250px;" placeholder="Enter Mobile Number" maxlength="10" value="${downloadCertificateInstance?.phoneNo}" />

</div>
<div class="note" style="font-weight:bold;text-transform:uppercase;color:green;text-align:center;">
<p>&nbsp;&nbsp;Only Registered Participants can Download Certificate By Entering Registered Mobile Number</p>
</div>






