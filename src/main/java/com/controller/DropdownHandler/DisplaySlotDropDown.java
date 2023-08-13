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
import com.dao.SlotDao;

/**
 * Servlet implementation class DisplaySlotripDown
 */
@WebServlet("/DisplaySlotDropDown")
public class DisplaySlotDropDown extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplaySlotDropDown() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("hello in Offered slot servlet");
		ResultSet rs=null;
		String day=request.getParameter("day");
		
		 String tag="<select  class='form1-select' style='font-size: 17px' id='validationCustom04' name='offered_slots1' required> <option selected disabled value=''>Choose...</option>";
		 

		 
		 System.out.println("day : "+day);
		 
//		 OfferedCourseDao ocdao=new OfferedCourseDao();
//		 rs=ocdao.getOfferedCourseForDivision(division);
		 
		 SlotDao sd=new SlotDao();
		rs=sd.getSlotDetailsById(day);
		 
		 
		 
		 
		 try {
			while(rs.next())
			{
				System.out.println(rs.getString(2)+" - "+rs.getString(3));
					tag=tag+"<option  style='font-size: 17px'>"+rs.getString(2)+"</option>"; 

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
