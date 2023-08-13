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

import com.dao.SlotDao;
import com.dao.TimeTableGenerationDao;

/**
 * Servlet implementation class EditSlotCOntroller
 */
@WebServlet("/EditSlotControllers")
public class EditSlotControllers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditSlotControllers() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int flag=0;
		String day=request.getParameter("day");
		String fromTime=request.getParameter("fromtime");
		String toTime=request.getParameter("totime");
		
		String day1=request.getParameter("day1");
		String oldfromtime=request.getParameter("oldslotfromtime");
		String oldtotime=request.getParameter("oldslottotime");


		
		
		
		SlotDao sd=new SlotDao();
		ResultSet rs=sd.checkSlot(day,fromTime,toTime);
		try {
			if(rs.next())
			{
					flag=1;
					HttpSession session=request.getSession();
					session.setAttribute("error", "true");
					response.sendRedirect("SlotDetails.jsp");
			}
			else
			{
				
				int i=sd.updateSlot(day, fromTime, toTime, day1,oldfromtime,oldtotime);
				if(i>0)
				{
					
					HttpSession session=request.getSession();
					session.setAttribute("success", "true");
					response.sendRedirect("SlotDetails.jsp");
				}
			}
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
