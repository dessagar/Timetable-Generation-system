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
import com.model.Building;

/**
 * Servlet implementation class building_masterController
 */
@WebServlet("/BuildingMasterController")

public class BuildingMasterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuildingMasterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		BuildingDao bdao=new BuildingDao();
		int flag=0;
		HttpSession session=request.getSession();
		
		
		String building_name=request.getParameter("building_name");
		ResultSet rs=bdao.getBuildingDetails();
		try {
			while(rs.next())
			{
				if(building_name.equals(rs.getString(2)))
				{
					flag=1;
					session.setAttribute("Duplicate_Building", "true");
					response.sendRedirect("BuildingMaster.jsp");
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
			
		
		int no_of_floors=Integer.parseInt(request.getParameter("no_of_floors"));
		
		int building_id=0;
		int i;
		ArrayList<Integer> list=new ArrayList<Integer>();
		for(i=1;i<5000;i++)
		{
			list.add(new Integer(i));
		}
		Collections.shuffle(list);
		for(i=1;i<2000;i++)
		{
			building_id=list.get(i);
		}
		
		Building bd=new Building(building_id, building_name, no_of_floors);
		BuildingDao budao=new BuildingDao();
		int j=budao.create_Building(bd);
		if(j>0)
		{
			String msg="Building Registered Successfully...!";
			session.setAttribute("building-success", "true");		
			session.setAttribute("success_msg", msg);
			response.sendRedirect("BuildingMaster.jsp");
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
