<%-- 
    Document   : header
    Created on : Dec 19, 2008, 1:36:55 AM
    Author     : eswar@vaannila.com
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<%

HttpSession hs = request.getSession();
String user = (String)hs.getAttribute("username");
String pass = (String)hs.getAttribute("password");
String fname = (String)hs.getAttribute("fname");
String mname = (String)hs.getAttribute("mname");
String lname = (String)hs.getAttribute("lname");

 if(user == null && pass == null)
{
	hs.invalidate();
	response.sendRedirect("login.jsp");
}
 

%>
    <head>

    </head>
    <body >
       <!-- <div align="center" style="font-weight:bold">TV shows</div> -->
       <table>
       <tr>
       <td style=""><img alt="" src="images/logo.jpg" height="170px" width="170px"></td><td align="center"><img alt="" src="images/matrubhoomi.jpg"></td>
       </tr>
       </table>
       
    </body>
</html>
