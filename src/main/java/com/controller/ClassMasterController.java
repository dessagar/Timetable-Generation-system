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

import com.dao.BuildingDao;
import com.dao.ClassDao;
import com.model.Class;

/**
 * Servlet implementation class class_masterController
 */
@WebServlet("/ClassMasterController")
public class ClassMasterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassMasterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//		try {
	//			System.out.println("hello in servlet");
	//			ResultSet rs=null;
	//			int floor_no=0;
	//			String buildingName=request.getParameter("building");
	//			
	//			 String tag="<select  class='form-select' style='font-size: 17px' id='validationCustom04' name='floorNo' required> <option selected disabled value=''>Choose...</option>";
	//			 
	//			
	//			System.out.println("hello...servlet 2"+buildingName);
	//			BuildingDao bdao=new BuildingDao();
	//			rs=bdao.getBuildingFloors(buildingName);
	//			if(rs.next())
	//			{
	//				floor_no=rs.getInt(1);
	//			}
	//			System.out.println("floor no"+floor_no);
	//			int j=1;
	//			while(j<=floor_no)
	//			{
	//				tag=tag+"<option style='font-size: 17px'>"+j+"</option>"; 
	//				/* tag=tag+"<option>"+i+"</option>"; */
	//				j++;
	//			}
	//			tag=tag+"</select>";
	//			response.getWriter().println(tag);
	//		} catch (SQLException e) {
	//			// TODO Auto-generated catch block
	//			e.printStackTrace();
	//		} catch (IOException e) {
	//			// TODO Auto-generated catch block
	//			e.printStackTrace();
	//		}
	//		
		int i;
		int classId=0;
		ArrayList<Integer> list=new ArrayList<Integer>();
		for(i=1;i<5000;i++)
		{
			list.add(new Integer(i));
		}
		Collections.shuffle(list);
		for(i=100;i<2000;i++)
		{
			classId=list.get(i);
		}
		
		HttpSession session=request.getSession();
		int flag=0;
		ClassDao cdao=new ClassDao();

		String className=request.getParameter("class_name");

		ResultSet rs1=cdao.getClassDetails();
		try {
			while(rs1.next())
			{
				if(className.equals(rs1.getString(2)))
				{
					flag=1;
					session.setAttribute("Duplicate_class", "true");
					response.sendRedirect("ClassMaster.jsp");
				}
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		if(flag==0)
		{
			
		
		String typeOfClass=request.getParameter("type");
		String buildingName=request.getParameter("buildingName");
		
		
		int floor=Integer.parseInt(request.getParameter("floorNo"));
		int buildingId=0;
		BuildingDao bdao=new BuildingDao();
		ResultSet rs=bdao.getBuildingId(buildingName);
		try {
			if(rs.next())
			{
				buildingId=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Class c=new Class(classId,className, typeOfClass, buildingId, floor);
		int k=cdao.create_Class(c);
		if(k>0)
		{
			session.setAttribute("class-success", "true");
			response.sendRedirect("ClassMaster.jsp");
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
