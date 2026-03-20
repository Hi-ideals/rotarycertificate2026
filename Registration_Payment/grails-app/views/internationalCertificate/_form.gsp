<%@ page import="com.hiideals.form.InternationalCertificate" %>

<div class="row m-4">

    <div class="form-group col-md-4">
        <label style="font-size: 20px;" for="lastName">Title</label><br/>
        <select class="form-select" name="lastName" value="${internationalCertificateInstance?.lastName}" style="border:1px solid black;" aria-label="Default select example">
            <option selected>Select</option>
            <option value="Rtn.">Rtn.</option>
             <option value="Ann.">Ann.</option>
        </select>
    </div>

    <div class="form-group col-md-4">
        <label style="font-size: 20px;" for="firstName">Full Name (used in certificate)</label>
        <input type="text" class="form-control" maxlength="30" name="firstName" value="${internationalCertificateInstance?.firstName}" style="border:1px solid black;" id="firstName" placeholder="Full name" required />
    </div>
 <div class="form-group col-md-4">
        <label>Member Type</label>
    <select class="form-select" name="memberType" id="memberType" style="border:1px solid black;" required onchange="handleMemberTypeChange()">
    <option value="">Select</option>
    <option value="rotarian">Rotarian</option>
    <option value="rotariankalyan">Rotarian Kalyan Zone</option>
    <option value="innerwheel">Inner Wheel</option>
    </select>
    </div>
    <div class="form-group col-md-4">
        <label>Include Spouse?</label>
        <select class="form-select" name="spouse"  value="${internationalCertificateInstance?.spouse}" style="border:1px solid black;" >
            <option value="no">No</option>
            <option value="yes">Yes</option>
        </select>
    </div>
     <div class="form-group col-md-4">
        <label>Number of Children</label>
        <select class="form-select" name="childrenCount"  value="${internationalCertificateInstance?.childrenCount}" style="border:1px solid black;"  >
            <option value="0">0</option>
            <option value="1">1 </option>
            <option value="2">2 </option>
            <option value="3">3 </option>
            <option value="4">4 </option>
            <option value="5">5 </option>
        </select>
        <small>₹500 per child age over 7 years</small>
    </div>
    <div class="form-group col-md-4">
        <label>Extra Coupons</label>
        <select class="form-select" name="coupons"  value="${internationalCertificateInstance?.coupons}" style="border:1px solid black;"  >
            <option value="0">0</option>
            <option value="1">1 </option>
            <option value="2">2 </option>
            <option value="3">3 </option>
            <option value="4">4 </option>
            <option value="5">5 </option>
        </select>
        <small>for Drivers, Assistants etc..</small>
    </div>
    
    <div class="form-group col-md-4">
        <label style="font-size: 20px;" for="clubMembershipNo">Club Membership Number:(optional)</label>
        <input type="text" class="form-control" name="clubMembershipNo" value="${internationalCertificateInstance?.clubMembershipNo}" style="border:1px solid black;" id="clubMembershipNo" maxlength="10" placeholder="Club Membership Number"  />
    </div>

    <div class="form-group col-md-4">
        <label style="font-size: 20px;" for="districtCode">District:</label><br/>
        <select class="form-select" name="districtCode" required value="${internationalCertificateInstance?.districtCode}" style="border:1px solid black;" aria-label="Default select example" required>
            <option selected value="">Select</option>
            <option  value="3160">3160</option>
            <option  value="316">316</option>
        </select>
    </div>

    <div class="form-group col-md-4">
        <label style="font-size: 20px;" for="zone">Zone:</label><br/>
     <select class="form-select" name="zone" id="zone" style="border:1px solid black;" 
      onchange="updateClubs()" required>
    <option value="">Select</option>
    <option value="SIMHAPURI">SIMHAPURI</option>
    <option value="KALYAN">KALYAN</option>
    <option value="COASTAL">COASTAL</option>
    <option value="PINAKINI">PINAKINI</option>
    <option value="MAHANANDI">MAHANANDI</option>
    <option value="TUNGABHADRA">TUNGABHADRA</option>
    <option value="SATYASAI">SATYASAI</option>
    <option value="VIJAYANAGARA">VIJAYANAGARA</option>
    <option value="CHINMULADRI">CHINMULADRI</option>
    <option value="DAVANAGERE">DAVANAGERE</option>
    <option value="MAHALAXMI">MAHALAXMI</option>
    <option value="NRUPATUNGA">NRUPATUNGA</option>
</select>
    </div>

    <div class="form-group col-md-4">
        <label style="font-size: 20px;" for="club">Club:</label><br/>
        <select class="form-select" name="club" value="${internationalCertificateInstance?.club}" id="clubs" style="border:1px solid black;" aria-label="Default select example" required>
            <option value="">Select</option>
            <!-- Clubs will be populated here based on the selected zone -->
        </select>
    </div>

    <div class="form-group col-md-4">
        <label style="font-size: 20px;" for="phoneNo">WhatsApp Mobile Number:</label>
        <input type="text" class="form-control" name="phoneNo" value="${internationalCertificateInstance?.phoneNo}" id="phoneNo" style="border:1px solid black;" maxlength="10" placeholder="WhatsApp Mobile Number" required />
    </div>
</div>

