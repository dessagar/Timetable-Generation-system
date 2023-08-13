package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.TimeTableGenerationDao;
import com.model.TimeTableGenerationn;

/**
 * Servlet implementation class TimeTableGenerationController
 */
@WebServlet("/TimeTableGenerationController")
public class TimeTableGenerationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TimeTableGenerationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session=null;
		String division=request.getParameter("Division_name");
		String offered_courses=request.getParameter("offered_courses");
		String head=request.getParameter("head");
		String day=request.getParameter("day");
		String fromtime=request.getParameter("fromtime");
		String totime=request.getParameter("totime");
		String faculty=request.getParameter("faculty"); 
		String practical_batch=request.getParameter("practical_batch"); 
		String tutorial_batch=request.getParameter("tutorial_batch"); 
		String classroom=request.getParameter("classroom");
		
		TimeTableGenerationn ttg=new TimeTableGenerationn(division, offered_courses, head, day, fromtime, totime, faculty,practical_batch,tutorial_batch,classroom);
		TimeTableGenerationDao tgd=new TimeTableGenerationDao();
		if(head.equals("Break")) 
		{
			int i=tgd.insert(ttg);
			if(i>0)
			{
//				i=tgd.update(day,fromtime,totime);
				
				session=request.getSession();
				session.setAttribute("success_msg", "true");
				response.sendRedirect("TimeTableGeneration.jsp");
			}
		}
		else
		{
			System.out.println("outcome "+tgd.checkLoadTimetable(ttg));
			if(tgd.checkLoadTimetable(ttg))
			{
				System.out.println("ello in after true check load in servlet");
				boolean status=tgd.check(ttg);
				//boolean status=true;
				if(status)
				{
					int i=tgd.insert(ttg);
					if(i>0)
					{
//						i=tgd.update(day,fromtime,totime);
						
						session=request.getSession();
						session.setAttribute("success_msg", "true");
						response.sendRedirect("TimeTableGeneration.jsp");
					}
					
				}
				else
				{
						session=request.getSession();
						session.setAttribute("error_msg", "true");
						response.sendRedirect("TimeTableGeneration.jsp");

				}

			}
			else
			{
				session=request.getSession();
				session.setAttribute("error_msg", "true");
				response.sendRedirect("TimeTableGeneration.jsp");
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
