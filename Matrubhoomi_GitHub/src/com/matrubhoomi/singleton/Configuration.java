package com.matrubhoomi.singleton;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;

public class Configuration {

	public static Configuration instance;
	
	public static Configuration getInstance()
	{
		if(instance != null)
		{
			instance = new Configuration();
		}
		return instance;
	}
	
	public static Connection getConnection()
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection("jdbc:mysql://localhost/matrubhoomi","root","root");
			System.out.println("^^^^^ Connection ^^^^^^ "+con);
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return con;
	}
	
}
