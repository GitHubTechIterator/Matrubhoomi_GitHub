<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.matrubhoomi.singleton.Configuration" %>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />

<script type="text/javascript" src="js_1/jquery.min.js"></script>
<script type="text/javascript" src="js_1/ddsmoothmenu.js"></script>
<script type="text/javascript">

//$( document ).ready(function() {
	//loadpage('test1.jsp');
//});
function loadpage12(){
	//alert("hiadsd");
	try{

	$.ajax({
	url:'BranchMaster.jsp',
	data:{
		vdate:new Date()
	},
	success:ResponsHome,
	error:ResponseHomeError
			
});
	}catch (e) {
		alert(""+e);
	}
}

function ResponsHome12(strTest){
	try{
		//alert(strTest);
	$("#Pageload").html(strTest);
	}catch (e) {
	alert(e);	
	}
}
function ResponseHomeError12(text){
	
}

</script>
<script type="text/javascript">

ddsmoothmenu.init({
	mainmenuid: "top_nav", //menu DIV id
	orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu', //class added to menu's outer DIV
	//customtheme: ["#1c5a80", "#18374a"],
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
})

function deleteFun()
{
	var count = $("#count").val();
	count =  count+1;
	//alert(count);
	var k=0;
	for(var j=0; j<count; j++)
	{	
		if($("#chkbx"+j).attr('checked'))
		{
			k++;
		}
	}
	var data = [];
	$(":checked").each(function() {
	  data.push($(this).val());
	});
	//alert(data);
	if(k>0)
	{
		
		//document.f1.action="deleteBranch.jsp";
		//document.f1.submit();
		loadpage3('deleteBranch.jsp',data);
	}else{
		alert("No Branch Selected !!!!!!");
	}
	
}
function loadpage3(url,strarray){
	//alert("hi");
	try{
	//$("#Pageload").html("");
	//$('#MainData').html(" <div align='center'><br><img src='images/loading7.gif' width='100' height='100' alt='loading7'/></div>");	
	$.ajax({
	url:url,
	data:{
		chkbx:strarray,
		vdate:new Date()
	},
	success:ResponsHome3,
	error:ResponseHomeError3
			
});
	}catch (e) {
		alert(""+e);
	}
}

function ResponsHome3(strTest){
	try{
		//alert(strTest);
	$("#Pageload").html(strTest);
	}catch (e) {
	alert(e);	
	}
}
function ResponseHomeError3(text){
	
}
function editFun()
{
	var count = $("#count").val();
	count =  count+1;
	var k=0;
	for(var j=0; j<count; j++)
	{
		if($("#chkbx"+j).attr('checked'))
		{
			k++;
		}
	}
	if(k>0)
	{
		if(k>1)
		{
			alert("Select only one Branch for Edit !!!!");
		}
		else{
			var data = [];
			$(":checked").each(function() {
			  data.push($(this).val());
			});

			loadpage3('editBranch.jsp',data);
		// document.f1.action="editBranch.jsp";
		// document.f1.submit();
		}
	}else{
		alert("No Branch Selected !!!!!!");
	}
	
}

</script>
<script type="text/javascript">
function loadpage1(url){
	//alert("hi");
	try{
	//$("#Pageload").html("");
	//$('#MainData').html(" <div align='center'><br><img src='images/loading7.gif' width='100' height='100' alt='loading7'/></div>");
	var getval=document.getElementById('searchCri').value;
	//alert(getval); 	
	$.ajax({
	url:url,
	data:{
		searchCri:getval,
		vdate:new Date()
	},
	success:ResponsHome1,
	error:ResponseHomeError1
			
});
	}catch (e) {
		alert(""+e);
	}
}

function ResponsHome1(strTest){
	try{
		//alert(strTest);
	$("#Pageload").html(strTest);
	}catch (e) {
	alert(e);	
	}
}
function ResponseHomeError1(text){
	
}
</script>
<title>Branch Master Data</title>

</head>
<body>

<form action="BranchMasterData.jsp" method="post">

<table>
<tr>
<td>
<span style="font-family: arial,sans-serif;">Branch Name :</span>
</td>
<td>
<input type="text" name="searchCri" id="searchCri">
</td>
<td>
<input type="checkbox" id="isinactive" name="isinactive"  ><span style="font-family: arial,sans-serif;">Include Inactive</span>
<input type="button" value="Search" style="color: #fff; font-family: arial,sans-serif; background-color: #4285f4; font-size: 15px;cursor: pointer;" onclick="loadpage1('BranchMasterData.jsp');"></input></td>

<td>
<input type="button" value="Add" style="color: #fff;font-family: arial,sans-serif; background-color: #4285f4; font-size: 15px;cursor: pointer;" onclick="loadpage12()"></input>
</td>
</tr>
</table>

</form>

<form action="" method="post" name="f1">

<%

int Srno = 0;
%>

<Table  align="center" width="100%">
		<Tr><Th align="center" colspan="13" style="color: white; font-weight: bold; font-family: arial,sans-serif; background-color:#d14836; font-size: 20px;">Branch List</Th></Tr>
		<Tr style="color: black; font-weight: bold; font-family: arial,sans-serif; background-color: #f6f6f6;"><Th></Th><Th>Branch ID</Th><Th>Branch Name</Th><th>Branch Code</th><!--<Th>Address</Th>--><Th>City</Th><Th>State</Th><!--<Th>Country</Th><Th>Contact Person</Th><Th>Mobile</Th><Th>Phone No</Th>--><Th>Main Branch</Th><Th>Status</Th></Tr>
		
<% 

int i = 0;
		int branchId;
		String branchCode;
		String branchName;
		String branchAddress;
		String branchCity;
		String branchState;
		String branchCountry;
		String branchContactPer;
		Long branchConPerMo;
		Long branchPhNo;
		String branchMain;
		String branchStatus;
		String brName = "";
		String searchCri = request.getParameter("searchCri");
		String isactive=request.getParameter("isinactive");
		System.out.println(isactive);
		
		if(searchCri != null && searchCri.trim().length() > 0)
		{
			brName = searchCri;
		}
		
		
Connection con = Configuration.getInstance().getConnection();
Statement st = con.createStatement();
String sql = "";
if("".equals(brName))
{
	sql = "select * from branch where branch_status='Active'";
}
else
{
	sql = "select * from branch where branch_name = '"+brName+"'";
	}
	
ResultSet rs = st.executeQuery(sql);

while(rs.next())
{
	branchId = rs.getInt("branch_id");
	branchCode = rs.getString("branch_code");
	branchName = rs.getString("branch_name");
	branchAddress = rs.getString("branch_address");
	branchCity = rs.getString("branch_city");
	branchState = rs.getString("branch_state");
	branchCountry = rs.getString("branch_country");
	branchContactPer = rs.getString("branch_contact_person");
	branchConPerMo = rs.getLong("branch_contact_person_mobile");
	branchPhNo = rs.getLong("branch_phone_no");
	branchMain = rs.getString("branch_main_branch_name");
	branchStatus = rs.getString("branch_status");
	
	%>
				<Tr class="label" style="background-color: #f6f6f6; font-family: arial,sans-serif;">
				<!--<TD class = "classNo"><%=++Srno %></TD>
				--><Td align="center"><input type="checkbox" name = "chkbx" id="chkbx<%=i%>" value = "<%=branchId%>"></input></Td>
				<Td><%=branchId%></Td>
				
				<Td><%=branchName%></Td>
				
				<Td><%=branchCode%></Td>
				<!--<Td><%=branchAddress%></Td>
				-->
				<Td><%=branchCity%></Td>
				<Td><%=branchState%></Td>
				<!--<Td><%=branchCountry%></Td>
				<Td><%=branchContactPer%></Td>
				<Td><%=branchConPerMo%></Td>
				<Td><%=branchPhNo%></Td>
				--><Td><%=branchMain%></Td>
				<Td><%=branchStatus%></Td>
				</Tr>
		<%i++;	} %>
		<input type="hidden" name = "count" id = "count" value ="<%=i%>"></input>
		<Tr align="center" colspan="13" style="color: #fff; font-weight: bold; font-family: arial,sans-serif; background-color: #f6f6f6; font-size: 20px;">
		<Td colspan="13" align="center"><input type = "button" value="Delete" style="color: #fff; font-family: arial,sans-serif; background-color: #4285f4; font-size: 15px;" onclick="deleteFun();"></input>
		<input type = "button" value="Edit" style="color: #fff; font-family: arial,sans-serif; background-color: #4285f4; font-size: 15px;" onclick="editFun();"></input></Td>
		</Tr>
		</Table>
		</form>

</body>
</html>

