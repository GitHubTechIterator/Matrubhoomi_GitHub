package com.matrubhoomi.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.matrubhoomi.business.BranchMasterDAO;
import com.matrubhoomi.business.LoginDAO;
import com.matrubhoomi.cargo.BranchMasterCargo;
import com.matrubhoomi.cargo.LoginCargo;

/**
 * Servlet implementation class ControllerServlet
 */
public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String pageName = request.getParameter("pagename");
		
		if(pageName.equalsIgnoreCase("BranchMaster.jsp"))
		{
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
		
		BranchMasterCargo cargo = new BranchMasterCargo();
		cargo.setBranchId(branchId);
		cargo.setBranchCode(branchCode);
		cargo.setBranchName(branchName);
		cargo.setBranchMain(branchMain);
		cargo.setBranchAddress(branchAddress);
		cargo.setBranchPhno(branchPhno);
		cargo.setBranchCountry(branchCountry);
		cargo.setBranchState(branchState);
		cargo.setBranchCity(branchCity);
		cargo.setBranchContactPer(branchContactPer);
		cargo.setBranchMoNo(branchMoNo);
		cargo.setBranchStatus(branchStatus);
		
		BranchMasterDAO branchdao = new BranchMasterDAO();
		int count = branchdao.insert(cargo);
		if(count > 0)
		{
			response.sendRedirect("BranchMasterData.jsp");
		}
	}
		 if(pageName.equalsIgnoreCase("login.jsp"))
		{
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			LoginCargo cargo = new LoginCargo();
			cargo.setUsername(username);
			cargo.setPassword(password);
			
			LoginDAO logindao = new LoginDAO();
			String fullStr = logindao.validateUser(cargo);
			
			if(!"".equals(fullStr))
			{
			String fullStrArr[] = fullStr.split(",");
			String fname = fullStrArr[0];
			String mname = fullStrArr[1];
			String lname = fullStrArr[2];
			
			
				HttpSession hs = request.getSession();
				hs.setAttribute("username", username);
				hs.setAttribute("password", password);
				hs.setAttribute("fname", fname);
				hs.setAttribute("mname", mname);
				hs.setAttribute("lname", lname);
				response.sendRedirect("MainMenu.jsp");
			}
			else
			{
				response.sendRedirect("login.jsp");	
			}
			
			}
		
		
		
	}

}
