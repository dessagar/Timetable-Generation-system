package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.model.OfferedCourses;

public class OfferedCourseDao {
	
	Connection con=null;
	PreparedStatement pstate=null;
	int i=0;
	ResultSet rs=null;
	Statement st=null;
	
	public int insertOfferedCourses(OfferedCourses ocs)
	{
		con=DbConnection.getConnection();
		for(int j=0;j<ocs.getCourseCodes().size();j++)
		{
			try {
				pstate=con.prepareStatement("insert into offered_courses values(?,?,?)");
				pstate.setString(1, ocs.getTerm());
				pstate.setString(2, ocs.getCourseCodes().get(j));
				pstate.setString(3, ocs.getCourseNameList().get(j));
				i=pstate.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return i;
	}
	
	public ResultSet getCourseCode(String courseName)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("select course_code from offered_courses where course_name=?");
			pstate.setString(1, courseName);
			rs=pstate.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	public ResultSet getOfferedCoursesName(String term)
	{
		System.out.println("term="+term);
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("select course_code,course_name from offered_courses where term=?");
			pstate.setString(1, term);
			rs=pstate.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
		
	}
	
	public ResultSet getOfferedCourseForDivision(String division)
	{
		con=DbConnection.getConnection();
		
		try {
			pstate=con.prepareStatement("select *from division_course_allocation where division=?");
			pstate.setString(1, division);
			rs=pstate.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	public ResultSet getCourseDetailsByTermYear(String termYear)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("select * from offered_courses where term=?");
			pstate.setString(1, termYear);
			
			rs=pstate.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	public ResultSet getOfferedCoursesDetails()
	{
		con=DbConnection.getConnection();
		try {
			st=con.createStatement();
			rs=st.executeQuery("select *from offered_courses");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
}
