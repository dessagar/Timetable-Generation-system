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

import com.dao.CourseDao;
import com.dao.FacultyDao;
import com.dao.LoadDistributionDao;
import com.model.LoadDistribution;

/**
 * Servlet implementation class LoadDistributionController
 */
@WebServlet("/LoadDistributionController")
public class LoadDistributionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadDistributionController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		ResultSet rs=null;
		StringBuilder sb=new StringBuilder();
		StringBuilder sb2=new StringBuilder();
		
		int facId=Integer.parseInt(request.getParameter("faculty_id"));
		
		
		String facultyDesignation=null;
		
		
		
		FacultyDao fdao=new FacultyDao();
		facultyDesignation=fdao.getFacultyDesigByName(facId);
		
			
		
		
		String facultyName=fdao.getFacultyNameById(facId);
		//System.out.println(facultyDesignation+faculty_id);
		
		String divisionName=request.getParameter("division_name");
		String courseCode=request.getParameter("offered_course").substring(0, 6);
		String courseAbbr=null;
		
		CourseDao cdao=new CourseDao();
		rs=cdao.getCourseAbbrByCourseCode(courseCode);
		try {
			if(rs.next())
			{
				courseAbbr=rs.getString(1);
				System.out.println("courseAbbr : "+courseAbbr);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String theory=request.getParameter("theory");
		int practical=Integer.parseInt(request.getParameter("practical_hours"));
		int tutorial=Integer.parseInt(request.getParameter("tutorial_hours"));
		int th=0;
		rs=cdao.getCourseDetailsById(courseCode);
		try {
			if(rs.next())
			{
				if(theory.equals("Yes"))
				{
					th=rs.getInt(5);
					System.out.println("theory : "+th);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String A_Batch=request.getParameter("a");
		String B_Batch=request.getParameter("b");
		String C_Batch=request.getParameter("c");
		System.out.println(A_Batch+""+B_Batch+""+C_Batch);
		
		int practicalCount=0;
		if(A_Batch!=null && A_Batch.equals("on"))
		{
			sb.append("A Batch");
			practicalCount++;
		}
		if(B_Batch!=null && B_Batch.equals("on"))
		{
			sb.append(" B Batch");
			practicalCount++;
		}
		if(C_Batch!=null && C_Batch.equals("on"))
		{
			sb.append(" C Batch");
			practicalCount++;
		}
		if(A_Batch==null && B_Batch==null && C_Batch==null)
		{
			sb.append("-");
		}
		
		System.out.println(practicalCount);
		System.out.println("batches : "+sb);
		
		String t1=request.getParameter("t1");
		String t2=request.getParameter("t2");
		String t3=request.getParameter("t3");
		
		int tutorialCount=0;
		if(t1!=null && t1.equals("on"))
		{
			sb2.append("T1 Batch");
			tutorialCount++;
		}
		if(t2!=null && t2.equals("on"))
		{
			sb2.append(" T2 Batch");
			tutorialCount++;
		}
		if(t3!=null && t3.equals("on"))
		{
			sb2.append(" T3 Batch");
			tutorialCount++;
		}
		if(t1==null && t2==null && t3==null)
		{
			sb2.append("-");
		}
		System.out.println(tutorialCount);
		System.out.println("batches : "+sb2);
		
		String practicalBatches=sb.toString();
		String tutorialBatches=sb2.toString();
		
		LoadDistributionDao lddao=new LoadDistributionDao();

		
		boolean isValid=lddao.checkLoad(divisionName, courseCode, th, practical*practicalCount, tutorial*tutorialCount);
		System.out.println(isValid);
		if(isValid)
		{
			
			System.out.println("Inside true validate");
			
			int load=(practical*practicalCount)+th+(tutorial*tutorialCount);
			
	
			LoadDistribution ld=new LoadDistribution(facId,facultyName, facultyDesignation, divisionName, courseCode, courseAbbr, th, practical, practicalBatches, tutorial,tutorialBatches, load);
			boolean isDuplicate= lddao.checkDuplicateLoad(ld);
			if(isDuplicate)
			{
				session.setAttribute("duplicateLoad-error", "true");
				response.sendRedirect("LoadDistribution.jsp");
			}
			else
			{
				int i=lddao.DistributeLoad(ld);
				if(i>0)
				{
					System.out.println("Inside 1st if");
					lddao.updateDivTotalLoad(divisionName,courseCode,th,practical*practicalCount,tutorial*tutorialCount);
					ResultSet rs2=lddao.checkFacultyInTotalLoad(facId);
					try {
						if(rs2.next())
						{
							System.out.println("Inside 2nd if");
							int totalLoad=lddao.getTotalLoad(facId);
							int k=lddao.updateTotalLoad(facId, totalLoad);
							if(k>0)
							{
								System.out.println("total load updated successsfully");
							}
						}
						else
						{
							int totalLoad=lddao.getTotalLoad(facId);
							int k=lddao.insertTotalLoad(facId, totalLoad);
							if(k>0)
							{
								System.out.println("inserted total load in total_load_distribution");
							}
							
						}
					}catch(Exception e)
					{
						e.printStackTrace();
					}
					session.setAttribute("loadDistribute-success", "true");
					response.sendRedirect("LoadDistribution.jsp");
				}
				
			}
			
			
			
			
			
			}
		else
		{
			session.setAttribute("loadDistribute-error", "true");
			response.sendRedirect("LoadDistribution.jsp");
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
