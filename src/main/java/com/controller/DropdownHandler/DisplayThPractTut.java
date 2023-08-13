package com.controller.DropdownHandler;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.CourseDao;
import com.dao.DivisionDao;

/**
 * Servlet implementation class DisplayThPractTut
 */
@WebServlet("/DisplayThPractTut")
public class DisplayThPractTut extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayThPractTut() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("hello in servlet");
		ResultSet rs=null;
		String course=request.getParameter("course");
		
		 String tag="<div  class='col-md-12' style='margin-top: 40px;'>";
		 
		 System.out.println("Course : "+course);
		 System.out.println("Course substring : "+course.substring(9));
		 
		 CourseDao cdao=new CourseDao();
		 rs=cdao.getCourseDetailsByCourseName(course.substring(9));
		 try {
			if(rs.next())
			 {
					tag=tag+"<div class='d-inline-block' ><h4 style='font-size: 17px'>Theory Hours :<input type='hidden' id='thHr' value='"+rs.getInt(5)+"'> "+rs.getInt(5)+"</h4></div><div class='d-inline-block' ><h4 style='font-size: 17px;  '>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Practical Hours : <input type='hidden' id='prHr' value='"+rs.getInt(6)+"'>"+rs.getInt(6)+"</h4></div> <div class='d-inline-block' ><h4 style='font-size: 17px; '>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Tutorial Hours :<input type='hidden' id='tutHr' value='"+rs.getInt(7)+"'>"+rs.getInt(7)+"</h4></div>"; 
			 }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 
		 tag=tag+"</div>";
		 response.getWriter().println(tag);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
