package com.controller;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DivisionCourseAllocationDao;

/**
 * Servlet implementation class DivisionCourseAllocationDetailsController
 */
@WebServlet("/DivisionCourseAllocationDetailsController")
public class DivisionCourseAllocationDetailsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DivisionCourseAllocationDetailsController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		String term = request.getParameter("term");
		String year = request.getParameter("year");

		String termYear = term.concat(year);
		System.out.println(termYear);

		DivisionCourseAllocationDao dcad = new DivisionCourseAllocationDao();

		ResultSet rs = dcad.getDivisionCoruseAllocationDetailsByTerm(termYear);

		try {

			if (rs.next()) {
				HttpSession sesssion = request.getSession();
				sesssion.setAttribute("Res", "true");
				sesssion.setAttribute("Result", rs);

				response.sendRedirect("DivisionCourseAllocationDetails.jsp");

			} else {
				HttpSession sesssion = request.getSession();
				sesssion.setAttribute("status-fail", "true");
				response.sendRedirect("DivisionCourseAllocationDetails.jsp");
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
