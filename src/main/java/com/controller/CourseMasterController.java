package com.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CourseDao;
import com.model.Course;

/**
 * Servlet implementation class CourseMasterController
 */
@WebServlet("/CourseMasterController")
public class CourseMasterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public  boolean isValid(String course_code)
	{
		Pattern p = Pattern.compile("^[A-Z]{2}[0-9]{4}$");
		Matcher m = p.matcher(course_code);
		return (m.find() && m.group().equals(course_code));
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseMasterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int flag=0;
		CourseDao cdao=new CourseDao();
		HttpSession session=request.getSession();
		
		String course_code=request.getParameter("course_code");
		if(isValid(course_code))
		{
			String course_name=request.getParameter("course_name");
			
			ResultSet rs=cdao.getCourseDetails();
			try {
				while(rs.next())
				{
					if(course_code.equals(rs.getString(1)))
					{
						flag=1;
						session.setAttribute("Duplicate_courseCode", "true");
						response.sendRedirect("CourseMaster.jsp");
					}
					if(course_name.equals(rs.getString(2)))
					{
						flag=1;
						session.setAttribute("Duplicate_CourseName", "true");
						response.sendRedirect("CourseMaster.jsp");
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
				
			
			String course_abbr=request.getParameter("course_abbr");
			String year=request.getParameter("year");
			int yearInt=0;
			if(year.equals("First Year"))
			{
				yearInt=1;
			}
			if(year.equals("Second Year"))
			{
				yearInt=3;
			}
			if(year.equals("Third Year"))
			{
				yearInt=3;
			}
			int no_of_theory=Integer.parseInt(request.getParameter("no_of_theory"));
			int no_of_prac=Integer.parseInt(request.getParameter("no_of_pract"));
			int no_of_tuts=Integer.parseInt(request.getParameter("no_of_tuts"));
			
			Course cou=new Course(course_code, course_name, course_abbr, yearInt, no_of_theory, no_of_prac, no_of_tuts);
			int j=cdao.createCourse(cou);
			if(j>0)
			{
				session.setAttribute("course-success", "true");
				response.sendRedirect("CourseMaster.jsp");
			}
			
			}	
		}
		else
		{
			session.setAttribute("CourseCodeMisMatch", "true");
			response.sendRedirect("CourseMaster.jsp");
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
