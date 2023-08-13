package com.controller.DropdownHandler;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.BuildingDao;

/**
 * Servlet implementation class ClassMasterDropdown
 */
@WebServlet("/ClassMasterDropdown")
public class ClassMasterDropdown extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassMasterDropdown() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			System.out.println("hello in servlet");
			ResultSet rs=null;
			int floor_no=0;
			String buildingName=request.getParameter("building");
			
			 String tag="<select  class='form1-select' style='font-size: 17px' id='validationCustom04' name='floorNo' required> <option selected disabled value=''>Choose...</option>";
			 
			
			System.out.println("hello...servlet 2"+buildingName);
			BuildingDao bdao=new BuildingDao();
			rs=bdao.getBuildingFloors(buildingName);
			if(rs.next())
			{
				floor_no=rs.getInt(1);
			}
			System.out.println("floor no"+floor_no);
			int j=1;
			while(j<=floor_no)
			{
				tag=tag+"<option value='"+j+"' style='font-size: 17px'>"+j+"</option>"; 
				/* tag=tag+"<option>"+i+"</option>"; */
				j++;
			}
			tag=tag+"</select>";
			response.getWriter().println(tag);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
