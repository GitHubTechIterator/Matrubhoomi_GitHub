package com.matrubhoomi.business;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.matrubhoomi.cargo.BranchMasterCargo;
import com.matrubhoomi.cargo.LoginCargo;
import com.matrubhoomi.singleton.Configuration;

public class LoginDAO {

	public String validateUser(LoginCargo cargo)
	{
		PreparedStatement pst = null;
		Connection con = null;
		
		String fname,mname,lname;
		String concatStr = "";
		
		try
		{
			con = Configuration.getInstance().getConnection();
			pst = con.prepareStatement("select first_name,middle_name,last_name from login where binary username = ? and binary password = ?");
			
			pst.setString(1,cargo.getUsername());
			pst.setString(2,cargo.getPassword());
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.next())
			{
				fname = rs.getString("first_name");
				mname = rs.getString("middle_name");
				lname = rs.getString("last_name");
				
				concatStr = fname+","+mname+","+lname;
			}else
			{
				concatStr = "";
			}
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				if(pst != null)
				{
					pst.close();
				}	
				
				if(con != null)
				{
					//con = null;
					con.close();
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
		}
		
		return concatStr;
	}
	
}
