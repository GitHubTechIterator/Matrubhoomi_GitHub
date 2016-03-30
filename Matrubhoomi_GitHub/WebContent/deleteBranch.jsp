<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@include file="connection.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<title>Product Delete</title>
</head>
<body>
<%

try
{
	try
	{
		
		con.setAutoCommit(false);
	}
	catch(Exception e)
	{
		con.close();
		e.printStackTrace();
	}	
	
	
	String values[] = request.getParameterValues("chkbx");	
	String  inString = "";
	
 for(int i=0;i<values.length;i++)
 {
	 if(i == 0)
	 {
		 inString = values[i];
	 }
	 else{
		 inString = inString + "," + values[i]; 
	 }
	 System.out.println(inString);
 } 

 	//String Query = "delete from products where product_id in ("+inString+")";
 	String Query = "delete from branch where branch_id in ("+inString+")";
	pstmt = con.prepareStatement(Query);
 	int a = pstmt.executeUpdate();
	con.commit();
	System.out.println("Data Deleted Successfully");
	
	response.sendRedirect("BranchMasterData.jsp");
}catch(Exception e){
	
	con.rollback();
	e.printStackTrace();
}
finally
{
	con.close();
	pstmt = null;
	rs = null;
}
 %>
</body>
</html>