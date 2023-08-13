package com.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CourseDao;
import com.dao.FacultyDao;
import com.model.Faculty;

/**
 * Servlet implementation class FacultyMasterController
 */
@WebServlet("/FacultyMasterController")
public class FacultyMasterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FacultyMasterController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		FacultyDao fdao=new FacultyDao();
		int flag=0;
		
		String facultyName=request.getParameter("faculty_name");
		
		ResultSet rs1=fdao.getFacultyDetails();
		try {
			while(rs1.next())
			{
				if(facultyName.equals(rs1.getString(2)))
				{
					flag=1;
					session.setAttribute("duplicate_faculty", "true");
					response.sendRedirect("FacultyMaster.jsp");
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(flag==0) {
		
		String facultyAbbr=request.getParameter("faculty_abbr");
		String facultyEmail=request.getParameter("faculty_email");
		String facultyDesignation=request.getParameter("faculty_designation");
		String facultyType=request.getParameter("faculty_type");
		/*
		 * String[] courseName=request.getParameterValues("course");
		 */		
		/*
		 * ArrayList<String> facultyCourseCodes=new ArrayList<String>();
		 */		/*
		 * ResultSet rs=null; CourseDao cdao=new CourseDao(); try { for(int
		 * i=0;i<courseName.length;i++) { rs=cdao.getCourseCode(courseName[i]);
		 * if(rs.next()) { facultyCourseCodes.add(rs.getString(1)); }
		 * 
		 * } }catch(Exception e) { e.printStackTrace(); }
		 */
		int facultyId=0;
		int i;
		ArrayList<Integer> list=new ArrayList<Integer>();
		for(i=1;i<5000;i++)
		{
			list.add(new Integer(i));
		}
		Collections.shuffle(list);
		for(i=1;i<2000;i++)
		{
			facultyId=list.get(i);
		}
		
//		Faculty fc=new Faculty(facultyId, facultyName, facultyAbbr, facultyCourseCodes);
		Faculty fc=new Faculty(facultyId, facultyName, facultyAbbr, facultyEmail, facultyDesignation, facultyType);
		int j=fdao.createFaculty(fc);
		if(j>0)
		{
			session.setAttribute("faculty-success", "true");
			response.sendRedirect("FacultyMaster.jsp");
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
