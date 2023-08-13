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

import com.dao.DivisionDao;
import com.model.Division;

/**
 * Servlet implementation class division_masterController
 */
@WebServlet("/DivisionMasterController")
public class DivisionMasterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DivisionMasterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		int flag=0;
		DivisionDao ddao=new DivisionDao();
		
		String division_name=request.getParameter("division_name");
		ResultSet rs=ddao.getDivisionDetails();
		try {
			while(rs.next())
			{
				if(division_name.equals(rs.getString(2)))
				{
					flag=1;
					session.setAttribute("Duplicate_division", "true");
					response.sendRedirect("DivisionMaster.jsp");
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
			
		
		int no_of_pract=Integer.parseInt(request.getParameter("pracbatches"));
		int no_of_tuts=Integer.parseInt(request.getParameter("tutbatches"));
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
		
		int division_id=0;
		int i;
		ArrayList<Integer> list=new ArrayList<Integer>();
		for(i=1;i<5000;i++)
		{
			list.add(new Integer(i));
		}
		Collections.shuffle(list);
		for(i=1000;i<2000;i++)
		{
			division_id=list.get(i);
		}
		
		Division d=new Division(division_id, division_name,yearInt, no_of_pract, no_of_tuts);
		int j=ddao.create_division(d);
		if(j>0)
		{
			session.setAttribute("division-success", "true");
			response.sendRedirect("DivisionMaster.jsp");
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
