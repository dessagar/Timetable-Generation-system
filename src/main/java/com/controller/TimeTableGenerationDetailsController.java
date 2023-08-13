package com.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.TimeTableGenerationDao;

/**
 * Servlet implementation class TimeTableGenerationDetailsController
 */
@WebServlet("/TimeTableGenerationDetailsController")
public class TimeTableGenerationDetailsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TimeTableGenerationDetailsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		String div=request.getParameter("division");
		TimeTableGenerationDao ttgd=new TimeTableGenerationDao();
		ResultSet rs=ttgd.getTimeTable(div);
		try {
			if(rs.next())
			{
				session.setAttribute("div",div);
				session.setAttribute("res", "true");
				response.sendRedirect("TimeTableGenerationDetails.jsp");
			}
			else
			{
				session.setAttribute("status-fail", "true");
				response.sendRedirect("TimeTableGenerationDetails.jsp");

			}
		} catch (SQLException e) {
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
