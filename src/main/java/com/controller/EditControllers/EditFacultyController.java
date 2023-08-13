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

import com.dao.FacultyDao;

/**
 * Servlet implementation class EditFacultyController
 */
@WebServlet("/EditFacultyController")
public class EditFacultyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditFacultyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session=request.getSession();
		FacultyDao fd=new FacultyDao();
		int flag=0;
		
		String faculty_name=request.getParameter("faculty_name");
		ResultSet rs1=fd.getFacultyDetails();
		try {
			while(rs1.next())
			{
				if(faculty_name.equals(rs1.getString(2)))
				{
					flag=1;
					session.setAttribute("duplicate_faculty", "true");
					response.sendRedirect("FacultyDetails.jsp");
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		if(flag==0)
		{
		String faculty_abbr=request.getParameter("faculty_abbr");
		String faculty_email=request.getParameter("faculty_email");
		String faculty_designation=request.getParameter("faculty_designation");
		String faculty_type=request.getParameter("faculty_type");
		
		int faculty_id=Integer.parseInt(request.getParameter("faculty_id"));
		
		int i=fd.update_faculty(faculty_name,faculty_abbr,faculty_email,faculty_designation,faculty_type,faculty_id);
		
		if(i>0)
		{
			
			session.setAttribute("update-msg", "true");
			
			response.sendRedirect("FacultyDetails.jsp");
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
