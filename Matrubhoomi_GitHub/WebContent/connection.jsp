<%@page import="java.sql.*"%>

<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try
	{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		con = DriverManager.getConnection("jdbc:mysql://localhost/matrubhoomi","admin","admin");
		System.out.println("^^^^^ Connection ^^^^^^ "+con);
		
	}
	catch(Exception e)
	{
		con.close();
		e.printStackTrace();
	}
%>