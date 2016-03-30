<!doctype html>
<html lang="en-US">

<%

HttpSession hs = request.getSession();
String user = (String)hs.getAttribute("username");
String pass = (String)hs.getAttribute("password");

 if(user == null && pass == null)
{
	hs.invalidate();
	response.sendRedirect("login.jsp");
}
 

%>

<head>
  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html">
  <title>Matrubhoomi - Branch Master</title>
  <link rel="stylesheet" type="text/css" media="all" href="css/styles.css">
  <link rel="stylesheet" type="text/css" media="all" href="css/switchery.min.css">
  <script type="text/javascript" src="Js/switchery.min.js"></script>
  <script type="text/javascript">
//adding validation
  function allnumeric(branchId,branchPhNo,branchMoNo)  
  { 
     var numbers = /^[0-9]+$/;  

     if(branchId.value.match(numbers))
     {
         if(branchPhNo.value.match(numbers))
         {
    		if(branchMoNo.value.match(numbers))
    	     {
    			return true;
    	     }
    	     else
    	     {
    	    	 alert('Branch Mobile No must be numeric');  
    	    	 branchMoNo.focus();  
    	         return false; 
    	     }
         }
         else
         {
        	 alert('Branch Phone No must be numeric');  
        	 branchPhNo.focus();  
             return false; 
         }
     }
     else
     {
    	 alert('Branch Id must be numeric');  
         branchId.focus();  
         return false; 
     }
  
  } 
//adding validation
//$( document ).ready(function() {
	//loadpage('test1.jsp');
//});
function loadpage11(){
	//alert("hi");
	try{
	//$("#Pageload").html("");
	//$('#MainData').html(" <div align='center'><br><img src='images/loading7.gif' width='100' height='100' alt='loading7'/></div>");
	try{

	var pname=document.getElementById('pagename').value;
	var bid=document.getElementById('branchId').value;
	var bcode=document.getElementById('branchCode').value;
	var bname=document.getElementById('branchName').value;
	var bmain=document.getElementById('branchMain').value;
	var badd=document.getElementById('branchAddress').value;
	var bphno=document.getElementById('branchPhno').value;
	var bcon=document.getElementById('branchCountry').value;
	var bstate=document.getElementById('branchState').value;
	var bcity=document.getElementById('branchCity').value;
	var bconper=document.getElementById('branchContactPer').value;
	var bmno=document.getElementById('branchMoNo').value;
	var bstatus=document.getElementById('branchStatus').value;	
	}catch (e) {
		alert("eeee::"+e);
		// TODO: handle exception
	}
	//alert(pname+""+bid+""+bcode+""+bname+""+bmain+""+badd+""+bphno+""+bcon+""+bstate+""+bcity+""+bconper+""+bmno+""+bstatus);
	$.ajax({
	url:'ControllerServlet',
	type:'POST',
	data:{
		pagename:pname,
		branchId:bid,
		branchCode:bcode,
			branchName:bname,
				branchMain:bmain,
					branchAddress:badd,
						branchPhno:bphno,
							branchCountry:bcon,
								branchState:bstate,
									branchCity:bcity,
										branchContactPer:bconper,
											branchMoNo:bmno,
												branchStatus:bstatus,
		vdate:new Date()
	},
	success:ResponsHome11,
	error:ResponseHomeError11
			
});
	}catch (e) {
		alert("xxx"+e);
	}
}

function ResponsHome11(strTest){
	try{
		//alert(strTest);
	$("#Pageload").html(strTest);
	}catch (e) {
	alert(e);	
	}
}
function ResponseHomeError11(text){
	
}

</script>
</head>

<body>
  <div id="wrapper" style="font-family: arial,sans-serif;">
  
  <h1 align="center" style="color: white; font-weight: bold; font-family: arial,sans-serif; background-color: #d14836; font-size: 20px;">Branch Master</h1>
   

    <form name="validate">
         <label>
      <input type="hidden" name="pagename" id="pagename" value="BranchMaster.jsp">
    </label>
  <div class="col-4">
    <label>
      Branch ID
      <input placeholder="Branch ID" id="branchId" name="branchId" tabindex="1">
    </label>
  </div>
  <div class="col-4">
    <label>
      Branch Code
      <input placeholder="Branch Code" id="branchCode" name="branchCode" tabindex="2">
    </label>
  </div>
  <div class="col-4">
    <label>
      Branch Name
      <input placeholder="Branch Name" id="branchName" name="branchName" tabindex="3">
     </label>
  </div>
  <div class="col-4">
    <label>
      Main Branch
     <!-- <input placeholder="Main Branch Name" id="branchMain" name="branchMain" tabindex="4">-->
      <select  name="branchMain" id="branchMain" tabindex="4">
			<option selected="selected" value="Select">Select Main Branch</option>
			<option value="MH309">BOISAR -(MH309)</option>
			<option value="MH302">BORIVALI -(MH302)</option>
			<option value="MH304">CHIPLUN -(MH304)</option>
			<option value="MH310">KOLHAPUR -(MH310)</option>
			<option value="MH306">KUDAL -(MH306)</option>
			<option value="MH305">MANDANGAD -(MH305)</option>
			<option value="MH307">MAPUSA -(MH307)</option>
			<option value="MH311">PEN -(MH311)</option>
			<option value="MH308">PUNE -(MH308)</option>
			<option value="MH301">THANE -(MH301)</option>
			<option value="Self">Self</option>
		</select>
      
    </label>
  </div>
  <div class="col-2">
    <label>
      Address
      <input placeholder="Address" id="branchAddress" name="branchAddress" tabindex="5">
    </label>
  </div>
  <div class="col-2">
    <label>
      Phone Number
      <input placeholder="Phone Number" id="branchPhno" name="branchPhno" tabindex="6">
    </label>
  </div>

 <div class="col-3">
    <label>
      Country
      <input placeholder="Country" id="branchCountry" name="branchCountry" disabled="disabled" value="India" tabindex="7">
    </label>
  </div>

   <div class="col-3">
    <label>
      State
     
      
      <select  id="branchState" name="branchState" style="font-family:'Helvetica Neue', Arial, sans-serif" tabindex="8">
			<option selected="selected" value="Select">Select State</option>
			<option value="Maharashtra">Maharashtra</option>
			<option value="Gujrat">Gujrat</option>

		</select>
      
      
    </label>
  </div>

   <div class="col-3">
    <label>
      City
      <input placeholder="City" id="branchCity" name="branchCity" tabindex="9">
    </label>
  </div>

 <div class="col-3">
    <label>
      Contact Person
      <input placeholder="Contact Person" id="branchContactPer" name="branchContactPer" tabindex="10">
    </label>
  </div>

   <div class="col-3">
    <label>
      Mobile No
      <input placeholder="Mobile No" id="branchMoNo" name="branchMoNo" tabindex="11" onblur="allnumeric(document.validate.branchId,document.validate.branchPhno,document.validate.branchMoNo);">
    </label>
  </div>

   <div class="col-3">
    <label>
      Status
      <!--<input placeholder="Status" id="branchStatus" name="branchStatus" tabindex="12">
      
      --><select  id="branchStatus" name="branchStatus" style="font-family:'Helvetica Neue', Arial, sans-serif" tabindex="12">
      
      		<option  value="Active">Active</option>
			<option value="Inactive">Inactive</option>
		
	 </select>
      
    </label>
  </div>

 <!-- <div class="col-3">
    <label>
      Availability
      <select tabindex="5">
        <option>5-15 hrs per week</option>
        <option>15-30 hrs per week</option>
        <option>30-40 hrs per week</option>
      </select>
    </label>
  </div>
  
  <div class="col-4">
    <label>
      Skills
      <input placeholder="List a few of your primary skills" id="skills" name="skills" tabindex="6">
    </label>
  </div>
  <div class="col-4">
    <label>
      Yrs Experience
      <input placeholder="How many years of experience?" id="experience" name="experience" tabindex="7">
    </label>
  </div>
  <div class="col-4">
    <label>Contact References?</label>
    <center style="position:relative; margin-bottom:8px;"><input type="checkbox" class="js-switch"></center>
  </div>
  <div class="col-4 switch">
    <label>E-mail Updates?</label>
    <center style="position:relative;margin-bottom:8px;"><input type="checkbox" class="js-switch"></center>
  </div>
  -->
  <div class="col-submit">
    <button  type="button" class="submitbtn" onclick="loadpage11()">Submit Form</button>
  </div>
    </form>
  
  </div>
<script type="text/javascript">
var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));

elems.forEach(function(html) {
  var switchery = new Switchery(html);
});
</script>

</body>
</html>