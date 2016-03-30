<!doctype html>
<html lang="en">

<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Matrubhoomi - Home</title>
<link href="css/collapsible-menu.css" type="text/css" rel="stylesheet">
<style>
a { text-decoration:none}
#header {
   background-color:#f6f6f6;
    text-align:center;
    padding:5px;
}
#nav {
    line-height:30px;
    float:left;
    padding:10px; 
}
#Pageload {
   /* float:left;*/
        margin-left: 230px;
}
</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="Js/collapsible-menu.js"></script>

<script type="text/javascript">

$( document ).ready(function() {
	//loadpage('test1.jsp');
});
function loadpage(url){
	//alert("hi");
	try{
	//$("#Pageload").html("");
	//$('#MainData').html(" <div align='center'><br><img src='images/loading7.gif' width='100' height='100' alt='loading7'/></div>");	
	$.ajax({
	url:url,
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
<body  style="width:1200px;margin:auto;">

<div  id="maindiv">
<div id="subdiv" >
<div>
<div id="header">
<jsp:directive.include file="header.jsp" />

<p align="right" style="color: black; font-weight: bold; font-family: arial,sans-serif; background-color: #f6f6f6; font-size: 20px;">
Welcome <%=fname + " " + mname + " " + lname%>
</p>
</div>

<br/>
<br/>
<br/>
<div id="nav" style="font-family: arial,sans-serif;">
<ul class="collapsible-menu" data-collapsible-menu="slide">
            <li>
                <a class="collapsed" >Masters</a>
                <ul style="padding-top: 10px;padding-bottom: 10px;">
                	<li><a style="cursor: pointer;" onclick="">State Master</a></li>
                    <li><a style="cursor: pointer;" onclick="loadpage('BranchMasterData.jsp');">Branch Master</a></li>
                    <li><a style="cursor: pointer;" onclick="">Agent Master</a></li>
                    <li><a style="cursor: pointer;" onclick="">User Master</a></li>
                    <li><a style="cursor: pointer;" onclick="">Relationship Master</a></li>
                    <li><a style="cursor: pointer;" onclick="">Plan Master</a></li>
                    <li><a style="cursor: pointer;" onclick="">Account Master</a></li>
                    <li><a style="cursor: pointer;" onclick="">Change Password</a></li>
                </ul>
            </li>
           <li class="footer"></li>
            <li>
                <a class="collapsed">Transactions</a>
                <ul  style="padding-top: 10px;padding-bottom: 10px;">
                    
                </ul>
            </li>
            <li class="footer"></li>
            <li>
                <a class="collapsed">Advances</a>
                <ul  style="padding-top: 10px;padding-bottom: 10px;">
                    
                </ul>
            </li>
            <li class="footer"></li>
            <li>
                <a class="collapsed">Inflation</a>
                <ul  style="padding-top: 10px;padding-bottom: 10px;">
                    
                </ul>
            </li>
            <li class="footer"></li>
            <li>
                <a class="collapsed">Reports</a>
                <ul  style="padding-top: 10px;padding-bottom: 10px;">
                    
                </ul>
            </li>
            <li class="footer"></li>
            <li>
                <a class="collapsed">Management Reports</a>
                <ul  style="padding-top: 10px;padding-bottom: 10px;">
                    
                </ul>
            </li>
            <li class="footer"></li>
            <li>
                <a class="collapsed">Utilities</a>
                <ul  style="padding-top: 10px;padding-bottom: 10px;">
                    
                </ul>
            </li>
             <li class="footer"></li>
            <li>

            </li>
        </ul>
                        <a class="signout" href="logout.jsp">Sign Out</a>
        </div>
        
<div id="Pageload"></div>


<div><jsp:directive.include file="footer.jsp" /></div>



</div>
</div>	
</div>

</body>
</html>