package com.matrubhoomi.business;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.matrubhoomi.cargo.BranchMasterCargo;
import com.matrubhoomi.singleton.Configuration;

public class BranchMasterDAO {
	
	public int insert(BranchMasterCargo cargo)
	{
		PreparedStatement pst = null;
		Connection con = null;
		int count = 0;
		try
		{
			con = Configuration.getInstance().getConnection();
			pst = con.prepareStatement("insert into branch " +
					"(branch_id, branch_code, branch_name,branch_address,branch_city,branch_state,branch_country ,branch_contact_person," +
					"branch_contact_person_mobile,branch_phone_no,branch_main_branch_name ,branch_status) values (?,?,?,?,?,?,?,?,?,?,?,?)");
			pst.setInt(1,cargo.getBranchId());
			pst.setString(2,cargo.getBranchCode());
			pst.setString(3,cargo.getBranchName());
			pst.setString(4,cargo.getBranchAddress());
			pst.setString(5,cargo.getBranchCity());
			pst.setString(6,cargo.getBranchState());
			pst.setString(7,cargo.getBranchCountry());
			pst.setString(8,cargo.getBranchContactPer());
			pst.setLong(9,cargo.getBranchMoNo());
			pst.setLong(10,cargo.getBranchPhno());
			pst.setString(11,cargo.getBranchMain());
			pst.setString(12,cargo.getBranchStatus());
			
			count = pst.executeUpdate();
			
			
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
		return count;
	}

}

