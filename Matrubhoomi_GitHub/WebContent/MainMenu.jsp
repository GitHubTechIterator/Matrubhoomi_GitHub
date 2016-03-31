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
<style>
  .accordion-toggle {cursor: pointer; padding-left: 20px;    background: #d14836 none no-repeat 3px 50%;
    color: #fff;
    cursor: pointer;
    display: block;
    font-weight: bold;
    padding: 2px 2px 2px 17px;
    width:168px;
    }
  .accordion-content {display: none; background: #fff;}
  .accordion-content.default {display: none;}
  
  #menu{
      background: #fff;
    border-top: 2px solid #fff;
    color: #d14836;
    display: block;
    padding: 2px 2px 2px 10px;
    cursor: pointer;
  }
    </style>
<!--<script src="Js/jquery.min_1.js"></script>-->
<script src="js_1/jquery.min.js"></script>
<!--<script src="Js/collapsible-menu.js"></script>-->

<script type="text/javascript">
$(document).ready(function($) {
    $('#accordion').find('.accordion-toggle').click(function(){
      //Expand or collapse this panel
      $(this).next().slideToggle('medium');
      //Hide the other panels
      $(".accordion-content").not($(this).next()).slideUp('medium');

    });
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
<div id="accordion">

  <div class="accordion-toggle">
<!--  <div style="background-image: url('images/expand.gif');background-color:white;width: 10px;-->
<!--    height: 10px;">-->
<!--    </div>-->Masters
    </div>
  <div class="accordion-content default">
  <ul>
    				<li style="list-style: none;"><a style="" id="menu" onclick="">State Master</a></li>
   					 <li style="list-style: none;"><a id="menu" onclick="loadpage('BranchMasterData.jsp');">Branch Master</a></li>
                    <li style="list-style: none;"><a id="menu" onclick="">Agent Master</a></li>
                   <li style="list-style: none;"> <a id="menu"  onclick="">User Master</a></li>
                    <li style="list-style: none;"><a id="menu"  onclick="">Relationship Master</a></li>
                   <li style="list-style: none;"> <a id="menu" onclick="">Plan Master</a></li>
                   <li style="list-style: none;"> <a id="menu" onclick="">Account Master</a></li>
                   <li style="list-style: none;"> <a  id="menu" onclick="">Change Password</a></li>
                   
                    </ul>                    
                    
  </div>
  <h4 class="accordion-toggle">Transactions</h4>
  <div class="accordion-content">
    <ul>                    
                </ul>
  </div>
  <h4 class="accordion-toggle">Advances</h4>
  <div class="accordion-content">
<ul>
                    
                </ul>
                
  </div>
  <h4 class="accordion-toggle">Inflation</h4>
  <div class="accordion-content">
<ul>
                    
                </ul>
                
  </div>
  <h4 class="accordion-toggle">Reports</h4>
  <div class="accordion-content">
<ul>
                    
                </ul>
                
  </div>
  <h4 class="accordion-toggle">Management Reports</h4>
  <div class="accordion-content">
<ul >
                    
                </ul>               
  </div>
  <h4 class="accordion-toggle">Utilities</h4>
  <div class="accordion-content">
<ul>
                    
                </ul>               
  </div>
  <div><a class="accordion-toggle" href="logout.jsp">Sign Out</a></div>
</div>

<!--<ul class="collapsible-menu" data-collapsible-menu="slide">
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
        --></div>
        
<div id="Pageload"></div>


<div><jsp:directive.include file="footer.jsp" /></div>



</div>
</div>	
</div>

</body>
</html>