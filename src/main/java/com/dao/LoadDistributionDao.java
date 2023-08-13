package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.model.LoadDistribution;
import com.sun.net.httpserver.Authenticator.Result;


public class LoadDistributionDao {
	
	Connection con=null;
	PreparedStatement pstate=null;
	int i=0;
	ResultSet rs=null;
	Statement st=null;
	
	
	public int DistributeLoad(LoadDistribution ld)
	{
		System.out.println("Inside DistributeLoad method");
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("insert into load_distribution values (?,?,?,?,?,?,?,?,?,?,?,?)");
			pstate.setInt(1, ld.getFacultyId());
			System.out.println(ld.getFacultyId());
			
			pstate.setString(2, ld.getFacultyName());
			System.out.println(ld.getFacultyName());

			pstate.setString(3, ld.getDesignation());
			System.out.println(ld.getDesignation());

			pstate.setString(4, ld.getDivision());
			System.out.println(ld.getDivision());

			pstate.setString(5, ld.getCourseCode());
			System.out.println(ld.getCourseCode());

			pstate.setString(6, ld.getCourseAbbr());
			System.out.println(ld.getCourseAbbr());

			pstate.setInt(7, ld.getTheory());
			System.out.println(ld.getTheory());

			pstate.setInt(8, ld.getPractical());
			System.out.println(ld.getPractical());

			pstate.setString(9, ld.getPracticalBatch());
			System.out.println(ld.getPracticalBatch());

			pstate.setInt(10, ld.getTutorial());
			System.out.println(ld.getTutorial());

			pstate.setString(11, ld.getTutorialBatch());
			System.out.println(ld.getTutorialBatch());

			pstate.setInt(12, ld.getLoad());
			System.out.println(ld.getLoad());

			i=pstate.executeUpdate();
			System.out.println(i);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return i;
	}
	
	public ResultSet checkFacultyInTotalLoad(int facId)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("select *from total_load_distribution where fac_id=?");
			pstate.setInt(1, facId);
			rs=pstate.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	

	public int getTotalLoad(int facId)
	{
		con=DbConnection.getConnection();
		int totalLoad=0;
		try {
			pstate=con.prepareStatement("select * from load_distribution where faculty_id=?");
			pstate.setInt(1, facId);
			rs=pstate.executeQuery();
			while(rs.next())
			{
				totalLoad=totalLoad+rs.getInt(12);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return totalLoad;
	}
	
	public int insertTotalLoad(int facid,int totalLoad)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("insert into total_load_distribution values(?,?)");
			pstate.setInt(1, facid);
			pstate.setInt(2, totalLoad);
			
			i=pstate.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return i;
	}
	
	public int updateTotalLoad(int facId,int totalLoad)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("update total_load_distribution set total_load=? where fac_id=?");
			pstate.setInt(1, totalLoad);
			pstate.setInt(2, facId);
			
			i=pstate.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return i;
	}
	
	public ResultSet getLoadDistribution()
	{
		con=DbConnection.getConnection();
		try {
			st=con.createStatement();
			rs=st.executeQuery("select *from load_distribution");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	public int getTotalRowsForFaculty(int FacId)
	{
		int count=0;
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("select count(*) from load_distribution where faculty_id=?");
			pstate.setInt(1, FacId);
			rs=pstate.executeQuery();
			if(rs.next())
			{
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
	public boolean checkLoad(String divisionName,String coursecode,int theory,int practical,int tutorial)
	{
		System.out.println("Inside check Method");
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("select *from division_total_load where division_name=? and course_code=?");
			pstate.setString(1, divisionName);
			pstate.setString(2, coursecode);
			rs=pstate.executeQuery();
			if(rs.next())
			{
				System.out.println(rs.getInt(3)+rs.getInt(4)+rs.getInt(5));
				if(theory<=rs.getInt(3)&&practical<=rs.getInt(4)&&tutorial<=rs.getInt(5))
				{
					return true;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catpractical=ch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	public int updateDivTotalLoad(String divName,String courseCode,int theory,int practical,int tutorial)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("update division_total_load set theory=?,practical=?,tutorial=? where division_name=? and course_code=?");
			PreparedStatement ps=con.prepareStatement("select *from division_total_load where division_name=? and course_code=?");
			ps.setString(1, divName);
			ps.setString(2, courseCode);
			rs=ps.executeQuery();
			if(rs.next())
			{
				pstate.setInt(1, rs.getInt(3)-theory);
				pstate.setInt(2, rs.getInt(4)-practical);
				pstate.setInt(3, rs.getInt(5)-tutorial);
				pstate.setString(4, divName);
				pstate.setString(5, courseCode);
				i=pstate.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	public boolean checkDuplicateLoad(LoadDistribution ld)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("select *from load_distribution where division=? and course_code=? ");
			pstate.setString(1, ld.getDivision());
			pstate.setString(2, ld.getCourseCode());
			rs=pstate.executeQuery();
			while(rs.next())
			{
				System.out.println(rs.getString(9)+" "+ld.getPracticalBatch());
				if(!rs.getString(9).equals("-") && !rs.getString(11).equals("-"))
				{
					if(rs.getString(9).equals(ld.getPracticalBatch()) || rs.getString(11).equals(ld.getTutorialBatch()))
					{
						System.out.println("true");
						return true;
					}
				}
				
			} 	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public ResultSet getFacultyById(int id)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("select *from load_distribution where faculty_id=?");
			pstate.setInt(1, id);
			
			rs=pstate.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	
	public ResultSet getFacultyTotalLoad(int facultyId)
	{
		System.out.println("fac_id "+facultyId);
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("select *from total_load_distribution where fac_id=?");
			pstate.setInt(1, facultyId);
			rs=pstate.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
}
