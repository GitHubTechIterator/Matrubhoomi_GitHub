<!doctype html>
<html lang="en-US">
<head>
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
  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html">
  <title>Matrubhoomi - Branch Master</title>
  <meta name="author" content="Jake Rocheleau">
  <link rel="shortcut icon" href="http://static.tmimgcdn.com/img/favicon.ico">
  <link rel="icon" href="http://static.tmimgcdn.com/img/favicon.ico">
  <link rel="stylesheet" type="text/css" media="all" href="css/styles.css">
  <link rel="stylesheet" type="text/css" media="all" href="css/switchery.min.css">
  <script type="text/javascript" src="Js/switchery.min.js"></script>
  <%@include file="connection.jsp" %>
  <script type="text/javascript">

//$( document ).ready(function() {
	//loadpagechk('test1.jsp');
//});
function loadpagechk(url){
	//alert("hi");
	try{
	//$("#Pageload").html("");
	//$('#MainData').html(" <div align='center'><br><img src='images/loading7.gif' width='100' height='100' alt='loading7'/></div>");
	
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
	
	$.ajax({
	url:'updateBranch.jsp',
	data:{
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
	success:ResponsHome,
	error:ResponseHomeError
			
});
	}catch (e) {
		alert(""+e);
	}
}

function ResponsHome(strTest){
	try{
		//alert(strTest);
	$("#Pageload").html(strTest);
	}catch (e) {
	alert(e);	
	}
}
function ResponseHomeError(text){
	
}

</script>
</head>

<body>

  <div id="wrapper">
  
  <h1 align="center" style="color: #fff; font-weight: bold; font-family: arial,sans-serif; background-color: #d14836; font-size: 20px;">Branch Master</h1>
  
  <form action="updateBranch.jsp" method="post">
  <%

int Srno = 0;
try
{
	
	
	String values[] = request.getParameterValues("chkbx");
	String pID = values[0];
	String Query = "";
	
	Query = "Select branch_id,branch_code,branch_name,branch_address,branch_city,branch_state,branch_country,branch_contact_person,branch_contact_person_mobile,branch_phone_no,branch_main_branch_name,branch_status from branch where branch_id = "+pID;
	pstmt = con.prepareStatement(Query);
	rs = pstmt.executeQuery();
	
	if(rs.next())
	{

	%>
  <div class="col-4">
    <label>
      Branch ID
      <input placeholder="What is the branch id ?" id="branchId" name="branchId" tabindex="1" value="<%=rs.getString(1) %>">
    </label>
  </div>
  <div class="col-4">
    <label>
      Branch Code
      <input placeholder="What is the branch code ?" id="branchCode" name="branchCode" tabindex="2" value="<%=rs.getString(2) %>">
    </label>
  </div>
  <div class="col-4">
    <label>
      Branch Name
      <input placeholder="Branch Name" id="branchName" name="branchName" value="<%=rs.getString(3) %>" tabindex="3">
      
     </label>
  </div>
  <div class="col-4">
    <label>
      Main Branch
      <!--<input placeholder="What is the main branch name ?" id="branchMain" name="branchMain" tabindex="4" value="<%=rs.getString(11)%>">
    
    --><select  name="branchMain" id="branchMain" tabindex="4">
      <%if("".equalsIgnoreCase(rs.getString(11))){ %>
      		<option selected="selected" value="">Select Main Branch</option>
			<%}else{%>
			<option value="">Select Main Branch</option>
			<%}%>
       		<%if("MH309".equalsIgnoreCase(rs.getString(11))){%>
			<option selected="selected" value="MH309">BOISAR -(MH309)</option>
			<%}else{%>
			<option  value="MH309">BOISAR -(MH309)</option>
			<%}%>
      		<%if("MH302".equalsIgnoreCase(rs.getString(11))){%>
			<option selected="selected" value="MH302">BORIVALI -(MH302)</option>
			<%}else{%>
			<option  value="MH302">BORIVALI -(MH302)</option>
			<%}%>
			<% if("MH304".equalsIgnoreCase(rs.getString(11))){%>
			<option selected="selected" value="MH304">CHIPLUN -(MH304)</option>
			<%}else{%>
			<option  value="MH304">CHIPLUN -(MH304)</option>
			<%}%>
			<%if("MH310".equalsIgnoreCase(rs.getString(11))){%>
			<option selected="selected" value="MH310">KOLHAPUR -(MH310)</option>
			<%}else{%>
			<option  value="MH310">KOLHAPUR -(MH310)</option>
			<%}%>
			<%if("MH306".equalsIgnoreCase(rs.getString(11))){%>
			<option selected="selected" value="MH306">KUDAL -(MH306)</option>
			<%}else{%>
			<option  value="MH306">KUDAL -(MH306)</option>
			<%}%>
			<% if("MH305".equalsIgnoreCase(rs.getString(11))){%>
			<option selected="selected" value="MH305">MANDANGAD -(MH305)</option>
			<%}else{%>
			<option  value="MH305">MANDANGAD -(MH305)</option>
			<%}%>
			<% if("MH307".equalsIgnoreCase(rs.getString(11))){%>
			<option selected="selected" value="MH307">MAPUSA -(MH307)</option>
			<%}else{%>
			<option  value="MH307">MAPUSA -(MH307)</option>
			<%}%>
			<% if("MH311".equalsIgnoreCase(rs.getString(11))){%>
			<option selected="selected" value="MH311">PEN -(MH311)</option>
			<%}else{%>
			<option  value="MH311">PEN -(MH311)</option>
			<%}%>
			<% if("MH308".equalsIgnoreCase(rs.getString(11))){%>
			<option selected="selected" value="MH308">PUNE -(MH308)</option>
			<%}else{%>
			<option  value="MH308">PUNE -(MH308)</option>
			<%}%>
			<% if("MH301".equalsIgnoreCase(rs.getString(11))){%>
			<option selected="selected" value="MH301">THANE -(MH301)</option>
			<%}else{%>
			<option  value="MH301">THANE -(MH301)</option>
			<%}%>
			<% if("Self".equalsIgnoreCase(rs.getString(11))){%>
			<option selected="selected" value="Self">Self</option>
			<%}else{%>
			<option value="Self">Self</option>
			<%}%>
			
		</select>
    
    </label>
  </div>
  <div class="col-2">
    <label>
      Address
      <input placeholder="What is the Branch Address?" id="branchAddress" name="branchAddress" tabindex="5" value="<%=rs.getString(4)%>">
    </label>
  </div>
  <div class="col-2">
    <label>
      Phone Number
      <input placeholder="What is the Phone Number of  Respective Branch?" id="branchPhno" name="branchPhno" tabindex="6" value="<%=rs.getString(10)%>">
    </label>
  </div>

 <div class="col-3">
    <label>
      Country
      <input placeholder="What is the name of the Country?" id="branchCountry" name="branchCountry" tabindex="7" disabled="disabled" value="<%=rs.getString(7)%>">
    </label>
  </div>

   <div class="col-3">
    <label>
      State
      
    
    <select  id="branchState" name="branchState" style="font-family:'Helvetica Neue', Arial, sans-serif" tabindex="8">
      
      		<%if("".equalsIgnoreCase(rs.getString(6))){ %>
      		<option selected="selected" value="">Select State</option>
			<%}else{%>
			<option  value="">Select State</option>
			<%}%>
      
      		<%if("Maharashtra".equalsIgnoreCase(rs.getString(6))){ %>
      		<option selected="selected" value="Maharashtra">Maharashtra</option>
			<%}else{%>
			<option  value="Maharashtra">Maharashtra</option>
			<%}%>
			
			<%if("Gujrat".equalsIgnoreCase(rs.getString(6))){ %>
      		<option selected="selected" value="Gujrat">Gujrat</option>
			<%}else{%>
			<option  value="Gujrat">Gujrat</option>
			<%}%>
		
	 </select>
    
    </label>
  </div>

   <div class="col-3">
    <label>
      City
      <input placeholder="What is the name of the City?" id="branchCity" name="branchCity" tabindex="9" value="<%=rs.getString(5)%>">
    </label>
  </div>

 <div class="col-3">
    <label>
      Contact Person
      <input placeholder="What is the name of the Contact Person ?" id="branchContactPer" name="branchContactPer" tabindex="10" value="<%=rs.getString(8)%>">
    </label>
  </div>

   <div class="col-3">
    <label>
      Mobile No
      <input placeholder="What is the Mobile No?" id="branchMoNo" name="branchMoNo" tabindex="11" value="<%=rs.getString(9)%>">
    </label>
  </div>

   <div class="col-3">
    <label>
      Status
      
   			
   			<select  id="branchStatus" name="branchStatus" style="font-family:'Helvetica Neue', Arial, sans-serif" tabindex="12">
      
      		<%if("Active".equalsIgnoreCase(rs.getString(12))){ %>
      		<option selected="selected" value="Active">Active</option>
			<%}else{%>
			<option  value="Active">Active</option>
			<%}%>
			
			<%if("Inactive".equalsIgnoreCase(rs.getString(12))){ %>
      		<option selected="selected" value="Inactive">Inactive</option>
			<%}else{%>
			<option  value="Inactive">Inactive</option>
			<%}%>
		
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
    <button  type="button" class="submitbtn" onclick="loadpagechk()">Submit Form</button>
  </div>
  <%
	}
	pstmt = null;
	rs = null;
	}catch(Exception e){
	e.printStackTrace();
}
	%>
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