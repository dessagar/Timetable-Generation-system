package com.controller.EditControllers;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ClassDao;

/**
 * Servlet implementation class EditClassController
 */
@WebServlet("/EditClassController")
public class EditClassController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditClassController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session=request.getSession();
		int flag=0;
		ClassDao cd=new ClassDao();
		
		int class_id=Integer.parseInt(request.getParameter("class_id"));
		String className=request.getParameter("class_name");
		
		ResultSet rs1=cd.getClassDetails();
		try {
			while(rs1.next())
			{
				if(className.equals(rs1.getString(2)))
				{
					flag=1;
					session.setAttribute("Duplicate_class", "true");
					response.sendRedirect("ClassDetails.jsp");
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
			
		
		String classType=request.getParameter("type");
		int buildingId=Integer.parseInt(request.getParameter("building_id"));
		int floorNo=Integer.parseInt(request.getParameter("floorNo"));
		String buildingName=request.getParameter("buildingName");
		
		int i=cd.updateClass(class_id,className,classType,buildingId,floorNo);
		
		if(i>0)
		{
			session.setAttribute("update-msg", "true");
			
			response.sendRedirect("ClassDetails.jsp");
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
