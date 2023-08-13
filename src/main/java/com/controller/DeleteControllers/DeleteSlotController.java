package com.controller.DeleteControllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SlotDao;

/**
 * Servlet implementation class DeleteSlotController
 */
@WebServlet("/DeleteSlotController")
public class DeleteSlotController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteSlotController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String day=request.getParameter("slotDay");
		String fromTime=request.getParameter("slotfromtime");
		String toTIme=request.getParameter("slottotime");
		
		SlotDao sd=new SlotDao();
		int i=sd.deleteSlot(day,fromTime,toTIme);
		
		if(i>0)
		{
			HttpSession session=request.getSession();
			session.setAttribute("DeleteSuccess-msg","true");
			response.sendRedirect("SlotDetails.jsp");
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
