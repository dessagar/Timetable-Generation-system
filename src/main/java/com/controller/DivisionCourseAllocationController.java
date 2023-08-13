package com.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CourseDao;
import com.dao.DivisionCourseAllocationDao;
import com.dao.OfferedCourseDao;
import com.model.DivisionCourseAllocation;

/**
 * Servlet implementation class DivisionCourseAllocationController
 */
@WebServlet("/DivisionCourseAllocationController")
public class DivisionCourseAllocationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DivisionCourseAllocationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		DivisionCourseAllocationDao dcad=new DivisionCourseAllocationDao();

		int flag=0;
		
		String t = request.getParameter("term");
		String year = request.getParameter("year");

		String term = t + year;
		 String division=request.getParameter("division");

		String[] allotedCourseNames=request.getParameterValues("course");
		
		ResultSet rs2=dcad.getDivisionCourseAllocationDetails();
		try {
			while(rs2.next())
			{
				for(int i=0;i<allotedCourseNames.length;i++)
				{
				
				if(term.equals(rs2.getString(1))&&division.equals(rs2.getString(2))&&allotedCourseNames[i].equals(rs2.getString(4)))
				{
					flag=1;
					session.setAttribute("Duplicate_courseAllocation", "true");
					response.sendRedirect("DivisionCourseAllocation.jsp");
				
				}
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
			
		
		ArrayList<String> allotedCourseCodes=new ArrayList<String>();
		
		
		OfferedCourseDao ocdao=new OfferedCourseDao();
		System.out.println(allotedCourseNames.length);
		try { 
		for(int i=0;i<allotedCourseNames.length;i++) 
		{ 
			System.out.println(allotedCourseNames[i]);
			ResultSet rs=ocdao.getCourseCode(allotedCourseNames[i]);
			if(rs.next())
			{ 
				allotedCourseCodes.add(rs.getString(1)); 
			}

		} 
		}catch(Exception e) 
		{ 
			e.printStackTrace(); 
		}
		
		List<String> allotedCourseNameList=Arrays.asList(allotedCourseNames);
		DivisionCourseAllocation dca=new DivisionCourseAllocation(term, division, allotedCourseNameList, allotedCourseCodes);
		
		
		

		int i=dcad.insertAllotedCourses(dca);
		if(i>0)
		{
			session.setAttribute("allotedCourse-Success", "true");
			response.sendRedirect("DivisionCourseAllocation.jsp");
		}

		int no_of_practicals=0;
		int no_of_tuts=0;
		
		
		CourseDao cdao=new CourseDao();
		ResultSet rs=dcad.getNoOfPractTuts(division);
		try {
			if(rs.next())
			{
				no_of_practicals=rs.getInt(1);
				no_of_tuts=rs.getInt(2);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			for(i=0;i<allotedCourseCodes.size();i++)
			{
				ResultSet rs1=cdao.getCourseDetailsById(allotedCourseCodes.get(i));
				if(rs1.next())
				{
					int k=dcad.insertDivisionLoad(division,rs1.getString(1),rs1.getInt(5),no_of_practicals*rs1.getInt(6),no_of_tuts*rs1.getInt(7));
					if(k>0)
					{
						System.out.println("division load inserted succesfully");
					}
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
