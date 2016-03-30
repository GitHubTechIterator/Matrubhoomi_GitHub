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
<title>Insert title here</title>
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
	
	String Query = "";
	

	int branchId = Integer.parseInt(request.getParameter("branchId"));
	String branchCode = request.getParameter("branchCode");
	String branchName = request.getParameter("branchName");
	String branchMain = request.getParameter("branchMain");
	String branchAddress = request.getParameter("branchAddress");
	long branchPhno = Long.parseLong(request.getParameter("branchPhno"));
	String branchCountry = request.getParameter("branchCountry");
	String branchState = request.getParameter("branchState");
	String branchCity = request.getParameter("branchCity");
	String branchContactPer = request.getParameter("branchContactPer");
	long branchMoNo = Long.parseLong(request.getParameter("branchMoNo"));
	String branchStatus = request.getParameter("branchStatus");
	
	
	Query = "update branch set branch_code = ?,branch_name = ?,branch_address = ?,branch_city = ?,branch_state = ?,branch_country = ?,branch_contact_person = ?,branch_contact_person_mobile = ?,branch_phone_no = ?,branch_main_branch_name = ?,branch_status = ? where branch_id = "+branchId;
	pstmt = con.prepareStatement(Query);
	pstmt.setString(1, branchCode);
	pstmt.setString(2, branchName);
	pstmt.setString(3, branchAddress);
	pstmt.setString(4, branchCity);
	pstmt.setString(5, branchState);
	pstmt.setString(6, branchCountry);
	pstmt.setString(7, branchContactPer);
	pstmt.setLong(8, branchMoNo);
	pstmt.setLong(9, branchPhno);
	pstmt.setString(10, branchMain);
	pstmt.setString(11, branchStatus);
	
	int a = pstmt.executeUpdate();
	con.commit();
	System.out.println("Data Updated Successfully");
	
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