package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.model.Course;

public class CourseDao {
	
	Connection con=null;
	PreparedStatement pstate=null;
	int i=0;
	ResultSet rs=null;
	Statement st=null;

	public int createCourse(Course cou)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("insert into course_master values(?,?,?,?,?,?,?)");
			pstate.setString(1, cou.getCourse_code());
			pstate.setString(2, cou.getCourse_name());
			pstate.setString(3, cou.getCourse_abbr());
			pstate.setInt(4, cou.getYear());
			pstate.setInt(5, cou.getNo_of_theory());
			pstate.setInt(6, cou.getNo_of_pract());
			pstate.setInt(7, cou.getNo_of_tuts());
			
			i=pstate.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return i;
	}
	public ResultSet getCourseName()
	{
		con=DbConnection.getConnection();
		try {
			st=con.createStatement();
			rs=st.executeQuery("select course_code ,course_name from course_master");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public ResultSet getCourseCode(String courseName)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("select course_code from course_master where course_name=?");
			pstate.setString(1, courseName);
			rs=pstate.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	public ResultSet getCourseDetails()
	{
		con=DbConnection.getConnection();
		try {
			st=con.createStatement();
			rs=st.executeQuery("select *from course_master");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	public ResultSet getCourseDetailsById(String courseId)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("select * from course_master where course_code=?");
			pstate.setString(1, courseId);
			rs=pstate.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	public int deleteCourse(String courseCode)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("delete from course_master where course_code=?");
			
			pstate.setString(1, courseCode);
			
			i=pstate.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	public int updateCourse(String courseCode,String courseName,String courseAbbr,int yearInt,int noOfTheory,int noOfPractical,int noOfTutorials,String courseId)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("update course_master set course_code=? ,course_name=?, course_abbreviation=?,year=? ,no_of_theory=?, no_of_practicals=?, no_of_tutorials=? where course_code=?");
			pstate.setString(1, courseCode);
			pstate.setString(2, courseName);
			pstate.setString(3, courseAbbr);
			pstate.setInt(4, yearInt);
			pstate.setInt(5, noOfTheory);
			pstate.setInt(6, noOfPractical);
			pstate.setInt(7,noOfTutorials);
			pstate.setString(8, courseId);
			
			i=pstate.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return i;
	}
	
	public ResultSet getCourseDetailsByCourseName(String course)
	{
		con=DbConnection.getConnection();
		
		try {
			pstate=con.prepareStatement("select *from course_master where course_name=?");
			pstate.setString(1, course);
			rs=pstate.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	public ResultSet getCourseAbbrByCourseCode(String courseCode)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("select course_abbreviation from course_master where course_code=?");
			pstate.setString(1, courseCode);
			rs=pstate.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	
	public String getCourseAbbrByName(String courseName)
	{
		String courseAbbr=null;
		con=DbConnection.getConnection();
		System.out.println("course name in getCourseAbbrByName is  "+courseName);
		try {
			pstate=con.prepareStatement("select course_abbreviation from course_master where course_name=?");
			pstate.setString(1, courseName);
			rs=pstate.executeQuery();
			if(rs.next())
			{
				courseAbbr=rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return courseAbbr;
	}
	

}
