package com.controller.DropdownHandler;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.TimeTableGenerationDao;

/**
 * Servlet implementation class DisplayFacultyDropDown
 */
@WebServlet("/DisplayFacultyDropDown")
public class DisplayFacultyDropDown extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayFacultyDropDown() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String tag="<select class='form-select' id='validationCustom04' name='faculty' required style='font-size: 17px'> <option selected disabled value=''>Choose...</option><option style='font-size:17px;'>None</option>";
		
		String division=request.getParameter("division");
		String course=request.getParameter("course");
		String head=request.getParameter("head");
		
		System.out.println(division+""+course+""+head);
		
		TimeTableGenerationDao ttg=new TimeTableGenerationDao();
		ResultSet rs=ttg.displayFaculty(division, course, head);
		
		try {
			while(rs.next())
			{
				tag=tag+"<option style='font-size: 17px'>"+rs.getString(2)+"</option>"; 
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
