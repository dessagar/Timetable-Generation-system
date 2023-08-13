package com.controller.DropdownHandler;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.OfferedCourseDao;

/**
 * Servlet implementation class GetCourse
 */
@WebServlet("/GetCourse")
public class GetCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetCourse() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String term=request.getParameter("term");
		System.out.println("term in servlet="+term);
	//	String tag=" <label for='validationCustom04' class='form-label' style='font-size: 17px' >Course Name</label><br><select class='selectpicker form-label' style='font-size: 17px;' id='course' name='course' multiple data-live-search='true'>";
		String tag="";
		OfferedCourseDao ocd=new OfferedCourseDao();
       	ResultSet rs=ocd.getOfferedCoursesName(term);
       	
       	try {
			while(rs.next())
			{
				tag=tag+"<option style='font-size: 17px' value='"+rs.getString(2)+"'>"+rs.getString(1)+rs.getString(2)+"</option>";
				//tag=tag+"<option style='font-size: 17px'>"+rs.getString(2)+"</option>"; 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// tag=tag+"</select>"; 
    	System.out.println(tag);
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
