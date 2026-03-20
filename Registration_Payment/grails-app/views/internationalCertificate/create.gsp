<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'certificate.label', default: 'Certificate')}" />
		<title>PELS / SELS / Dist Assembly @ Bidar</title>
	  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	
	<style>
	.center-div {
    display: flex;
    justify-content: center;
  }
  @media (max-width: 768px) {
    footer {
        position: fixed;
        bottom: 0px;
        width: 100%;
        color:black;
    }
}
	</style>
	</head>
	<body>


 <div class="center-div">
 <img src="images/header_.png" class="img-fluid" alt="Responsive Image" style="border-radius:3px;width:100%;"  />
</div>

   <div class="text-center m-3">
    <p style="color:black;font-size:18px;margin-top: 50px;">Welcome to <span style="font-weight:bold;"> PELS / SELS / Dist Assembly @ Bidar</span> organized by <span style="font-weight:bold;">Rotary Clubs Of Kalyan Zone Bidar</span><span style="font-weight:bold;"></span></p>
  </div>

  <div class="container card shadow-lg p-3 mb-5 bg-body-tertiary rounded" style="border:2px solid blue;margin-top:50px;border-radius: 10px;">
    <h4 style="display: flex;align-items: center;justify-content: center;color: #00008B;">FILL THE BELOW DETAILS TO REGISTER & DOWNLOAD THE e-Pass</h4><br/>
     <!-- Example split danger button -->
	
	<div class="nav" role="navigation">
		</div>
		<div id="create-certificate" class="content scaffold-create" role="main">
<g:hasErrors bean="${certificateInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${certificateInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			
			<g:form url="[resource:downloadCertificateInstance, action:'save']" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons" style="text-align:center; margin-top:20px;">

			<button type="submit" class="btn btn-primary"
			style="font-size:22px;font-weight:bold;padding:12px 30px;border-radius:6px;border:2px solid black;">
 						        Pay & Register </button>

			</fieldset>
			</g:form>
		</div>
		
		</div>
			<div style="margin-bottom: 250px;">

</div>

<div class="container">
  
  <footer class="py-3 my-4 nav justify-content-center border-top" style="margin-bottom:0px;">
   
    <h6 class="developed" >Developed-By: <a href="https://hiideals.com/" target="blank" >Hi-Ideals</a></h6>
  </footer>
 
</div>


 <script>
    function validateInput() {
      var input = document.getElementById("numberInput").value;
      var errorText = document.getElementById("errorText");

      // Remove non-digit characters
      var cleanInput = input.replace(/\D/g, "");

      // Update the input field with the cleaned value
      document.getElementById("numberInput").value = cleanInput;

      // Display error message if the input is empty or exceeds 10 numbers
      if (cleanInput.length === 0) {
        errorText.textContent = "";
      } else if (cleanInput.length > 10) {
        errorText.textContent = "Maximum 10 numbers allowed.";
      } else {
        errorText.textContent = "";
      }
    }
  </script>



<script>
function updateClubs() {
    var zone = document.getElementById("zone").value;
    var clubsSelect = document.getElementById("clubs");

    clubsSelect.innerHTML = '<option value="">Select</option>';

    var clubsOptions = {
        "SIMHAPURI": [
            "RC Nellore","RC Nellore South","RC Nellore Shakthi","RC Kavali","RC Venkatagiri","RC Nellore Avenue"
        ],
        "KALYAN": [
            "RC Bidar","RC Bidar Fort","RC Bidar New Century","RC Bidar Queens","RC Bidar Silverstar",
            "RC Bhalki Fort","RC Bhalki Manjra","RC Humanabad Elite","RC Basavakalyan"
        ],
        "COASTAL": [
            "RC Gudur","RC Gudur West","RC Naidupeta","RC Sullurpeta","RC Kota"
        ],
        "PINAKINI": [
            "RC Proddatur","RC Proddatur Mid Town","RC Jammalamadugu","RC Rayachoty",
            "RC Annamaiah Rajampeta","RC Kadapa","RC Madhavaram"
        ],
        "MAHANANDI": [
            "RC Nandyal","RC Nandyal Mid Town","RC Navanandi","RC Allagadda Satabdhi",
            "RC Banaganepalli","RC Koyalakuntla"
        ],
        "TUNGABHADRA": [
            "RC Adoni","RC Dhone","RC Bethamcherla","RC Greater Kurnool",
            "RC Kurnool New City","RC Yemmiganur"
        ],
        "SATYASAI": [
            "RC Anantapur","RC Anantapur Central","RC Guntakal","RC Tadipatri",
            "RC Kadiri","RC Dharmavaram Mid Town","RC Madakasira","RC Hindupur"
        ],
        "VIJAYANAGARA": [
            "RC Hospet","RC Vijayanagara Heritage","RC Koppal","RC Hampi Pearls",
            "RC Bellary","RC Bellary Contonment","RC Gangavathi Central","RC Sandur"
        ],
        "CHINMULADRI": [
            "RC Hiryur","RC Challakere","RC Holalkere","RC Chitradurga",
            "RC Chitradurga Fort","RC Chinmuladri"
        ],
        "DAVANAGERE": [
            "RC Davanagere","RC Davanagere South","RC Davanagere Mid Town",
            "RC Davanagere Vidyanagar","RC Chickjajur"
        ],
        "NRUPATUNGA": [
            "RC Gulbarga","RC Gulbarga North","RC Gulbarga Mid Town",
            "RC Gulbarga Suncity","RC Gulbarga South","RC Gulbarga Sakhi"
        ],
        "MAHALAXMI": [
            "RC Diamond Devadurga","RC Raichur","RC Raichur Central",
            "RC Raichur Cotton City","RC Raichur East","RC Raichur Krishnathunge",
            "RC Raichur Shakthinagar","RC Sindhanoor"
        ]
    };

    if (zone in clubsOptions) {
        clubsOptions[zone].forEach(function(club) {
            var option = document.createElement("option");
            option.value = club;
            option.text = club;
            clubsSelect.appendChild(option);
        });
    }
}
</script>


<script>
document.addEventListener("DOMContentLoaded", function () {

    const memberType = document.querySelector('select[name="memberType"]');
    const spouseDiv = document.querySelector('select[name="spouse"]').closest('.form-group');

    function toggleFields() {
        if (memberType.value === "innerwheel") {
            spouseDiv.style.display = "none";
        } else {
            spouseDiv.style.display = "block";
        }
    }

    // Run on change
    memberType.addEventListener("change", toggleFields);

    // Run on page load (important for edit case)
    toggleFields();
});
</script>

<script>
function handleMemberTypeChange() {
    var memberType = document.getElementById("memberType").value;
    var zoneDropdown = document.getElementById("zone");

    var allOptions = zoneDropdown.querySelectorAll("option");

    if (memberType === "rotariankalyan") {

        // Show only KALYAN
        allOptions.forEach(function(opt) {
            if (opt.value === "KALYAN" || opt.value === "") {
                opt.style.display = "block";
            } else {
                opt.style.display = "none";
            }
        });

        zoneDropdown.value = "KALYAN";
        
        updateClubs(); // auto load clubs


    } else {

        // Show all zones again
        allOptions.forEach(function(opt) {
            opt.style.display = "block";
        });

        zoneDropdown.value = "";
        document.getElementById("clubs").innerHTML = '<option selected>Select</option>';
    }
}
</script>

	</body>
</html>