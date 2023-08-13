package com.controller.DropdownHandler;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DivisionDao;

/**
 * Servlet implementation class TutorialBatchesCheckbox
 */
@WebServlet("/TutorialBatchesCheckbox")
public class TutorialBatchesCheckbox extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TutorialBatchesCheckbox() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("hello in servlet");
		ResultSet rs=null;
		String division=request.getParameter("division");
		String tag="<div  class='col-md-6'<label for='validationCustom04'  style='font-size: 17px' class='form-label'  style='font-size: 17px'>Tutorial Batches</label><BR><BR>";
		
		DivisionDao ddao=new DivisionDao();
		rs=ddao.getDivisionDetailsByDivisionName(division);
		
		try {
			if(rs.next())
			{
				if(rs.getInt(5)==1)
				{
					tag=tag+"<div>'<label style='font-size: 17px'> <input type='checkbox' style='zoom:1.5;' />	Tut-1 Batch</label><br><br>";
				}
				else if(rs.getInt(5)==2)
				{
					tag=tag+"<div>'<label style='font-size: 17px'> <input type='checkbox' style='zoom:1.5;' />	Tut-1 Batch</label><br><br><div>'<label style='font-size: 17px'> <input type='checkbox' style='zoom:1.5;' /> Tut-2 Batch</label><br><br>";
				}
				else if(rs.getInt(5)==3)
				{
					tag=tag+"<div>'<label style='font-size: 17px'> <input type='checkbox' style='zoom:1.5;' />	Tut-1 Batch</label><br><br><div>'<label style='font-size: 17px'> <input type='checkbox' style='zoom:1.5;' /> Tut-2 Batch</label><br><br><div>'<label style='font-size: 17px'> <input type='checkbox' style='zoom:1.5;' />	Tut-3 Batch</label><br><br>";
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 tag=tag+"</div>";
		 response.getWriter().println(tag);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
