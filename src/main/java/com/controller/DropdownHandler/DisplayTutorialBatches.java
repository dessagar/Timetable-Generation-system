package com.controller.DropdownHandler;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.TimeTableGenerationDao;

/**
 * Servlet implementation class DisplayTutorialBatches
 */
@WebServlet("/DisplayTutorialBatches")
public class DisplayTutorialBatches extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayTutorialBatches() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("Welcome to TutorialBatchesDropdown");

	
		String division = request.getParameter("division");
		String course = request.getParameter("course");
		String faculty = request.getParameter("faculty");
		String head = request.getParameter("head");

		String tag1, tag2;

		System.out.println(division + "\t" + course + "\t" + faculty);
		String tag = "<select class='form-select' id='tutbatch' name='tutbatch' required style='font-size: 17px'> <option selected disabled value=''>Choose...</option><option style='font-size:17px;'>None</option>";

		if (head.equals("Tutorial")) {

			TimeTableGenerationDao ttg = new TimeTableGenerationDao();
			ResultSet rs = ttg.displayTutorialBatches(division, course, faculty);

			try {
				while (rs.next()) {

					/*
					 * String tutorial_batches = rs.getString(9);
					 */					/*
					 * String batch1=batches.substring(0,7); String batch2=batch1.substring(7,10);
					 */

					String tutorial_batches = rs.getString(11);
					
					if (tutorial_batches.equals("T1 Batch T2 Batch")
							|| (tutorial_batches.equals("T1 Batch T2 Batch T3 Batch"))) {

						/*
						 * String T1 = "T1 Batch"; String T2 = "T2 Batch";
						 */

						tag1 = "<option style='font-size: 17px'>T1 Batch</option>";
						tag2 = "<option style='font-size: 17px'>T2 Batch</option>";
						tag = tag1 + tag2;

					} else {
						
						System.out.println("going in else block");
						tag = tag + "<option style='font-size: 17px'>" + rs.getString(11) + "</option>";

					}

				}
			} catch (SQLException e) { // TODO Auto-generated catch block
				e.printStackTrace();
			}
			tag = tag + "</select>";
			response.getWriter().println(tag);

		} else {
			String tag3="<option selected disabled value= '' style='font-size: 17px'>Tutorial Batches</option>";

			tag = tag +tag3 ;
			
			;

			tag = tag + "</select>";
			response.getWriter().println(tag);

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
