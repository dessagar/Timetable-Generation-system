package com.controller.DeleteControllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.dao.BuildingDao;

/**
 * Servlet implementation class DeleteBuilding
 */
@WebServlet("/DeleteBuilding")
public class DeleteBuilding extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBuilding() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int buidingId= Integer.parseInt(request.getParameter("buildingId"));
		System.out.println(buidingId);
		
		BuildingDao bd=new BuildingDao();
		int i=bd.buildingDelete(buidingId);
		
		if(i>0)
		{
			HttpSession session=request.getSession();
			session.setAttribute("delete-success","true");
			response.sendRedirect("BuildingDetails.jsp");
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
