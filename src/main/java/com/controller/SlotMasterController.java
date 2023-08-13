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

import com.dao.SlotDao;
import com.model.Slot;

/**
 * Servlet implementation class SlotMasterController
 */
@WebServlet("/SlotMasterController")
public class SlotMasterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SlotMasterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int flag=0;
		HttpSession session=request.getSession();
		String day=request.getParameter("day");
		String fromtime=request.getParameter("fromtime");
		String totime=request.getParameter("totime");
		
		SlotDao sdao=new SlotDao();
		ResultSet rs=sdao.checkSlot(day,fromtime,totime);
		try {
			if(rs.next())
			{
					flag=1;
					session.setAttribute("error", "true");
					response.sendRedirect("SlotMaster.jsp");
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
			Slot s=new Slot(day, fromtime, totime);
			int i=sdao.createSlot(s);
			if(i>0)
			{
				session.setAttribute("slot-success", "true");
				response.sendRedirect("SlotMaster.jsp");
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
