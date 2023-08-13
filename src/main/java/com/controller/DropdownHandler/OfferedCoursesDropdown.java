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
 * Servlet implementation class OfferedCoursesDropdown
 */
@WebServlet("/OfferedCoursesDropdown")
public class OfferedCoursesDropdown extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OfferedCoursesDropdown() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("hello in Offered Course servlet");
		ResultSet rs=null;
		String division=request.getParameter("division");
		
		 String tag="<select  class='form1-select' style='font-size: 17px' id='validationCustom04' name='offered_courses' required> <option selected disabled value=''>Choose...</option><option style='font-size:17px;'>None</option>";
		 
		 System.out.println("division : "+division);
		 
		 OfferedCourseDao ocdao=new OfferedCourseDao();
		 rs=ocdao.getOfferedCourseForDivision(division);
		 
		 
		 
		 try {
			while(rs.next())
			{
				System.out.println(rs.getString(3)+" - "+rs.getString(4));
					tag=tag+"<option  style='font-size: 17px'>"+rs.getString(3)+" - "+rs.getString(4)+"</option>"; 
			 }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 tag=tag+"</select>";
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
