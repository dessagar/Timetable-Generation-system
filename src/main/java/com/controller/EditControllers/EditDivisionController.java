package com.controller.EditControllers;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DivisionDao;

/**
 * Servlet implementation class EditDivisionController
 */
@WebServlet("/EditDivisionController")
public class EditDivisionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditDivisionController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session=request.getSession();
		DivisionDao dd=new DivisionDao();
		int flag=0;
		
		int divisiodId=Integer.parseInt(request.getParameter("division_id"));
		String divisionName=request.getParameter("division_name");
		/*
		 * ResultSet rs=dd.getDivisionDetails(); try { while(rs.next()) {
		 * if(divisionName.equals(rs.getString(2))) { flag=1;
		 * session.setAttribute("Duplicate_division", "true");
		 * response.sendRedirect("DivisionDetails.jsp"); } } } catch (SQLException e) {
		 * // TODO Auto-generated catch block e.printStackTrace(); } catch (IOException
		 * e) { // TODO Auto-generated catch block e.printStackTrace(); }
		 */
		
		
		if(flag==0)
		{
		int pracbatches=Integer.parseInt(request.getParameter("pracbatches"));
		int tutbatches=Integer.parseInt(request.getParameter("tutbatches"));
		
		String year=request.getParameter("year");
		int yearInt=0;
		if(year.equals("First Year"))
		{
			yearInt=1;
		}
		if(year.equals("Second Year"))
		{
			yearInt=2;
		}
		if(year.equals("Third Year"))
		{
			yearInt=3;
		}

		
		
		int i=dd.updateDivision(divisionName,yearInt,pracbatches,tutbatches,divisiodId);
		
		if(i>0)
		{
		
			
			session.setAttribute("update-msg", "true");
			
			response.sendRedirect("DivisionDetails.jsp");
		}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
