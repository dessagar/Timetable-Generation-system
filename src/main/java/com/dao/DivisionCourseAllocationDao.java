package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.model.DivisionCourseAllocation;

public class DivisionCourseAllocationDao {
	Connection con = null;
	PreparedStatement pstate = null;
	int i = 0;
	ResultSet rs = null;
	Statement st = null;

	public int insertAllotedCourses(DivisionCourseAllocation dca) {
		con = DbConnection.getConnection();

		System.out.println("size" + dca.getAllotedCourseCodes().size());
		for (int j = 0; j < dca.getAllotedCourseCodes().size(); j++) {
			try {
				pstate = con.prepareStatement("insert into division_course_allocation values(?,?,?,?)");
				pstate.setString(1, dca.getTerm());
				pstate.setString(2, dca.getDivision());
				pstate.setString(3, dca.getAllotedCourseCodes().get(j));
				pstate.setString(4, dca.getAllotedCourseNames().get(j));

				i = pstate.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return i;
	}

	public ResultSet getNoOfPractTuts(String divName) {
		con = DbConnection.getConnection();
		try {
			pstate = con.prepareStatement(
					"select no_of_pract_batches, no_of_tut_batches from division_master where division_name=?");
			pstate.setString(1, divName);
			rs = pstate.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

	public int insertDivisionLoad(String division_name, String course_name, int theory, int practicals, int tutorials) {
		con = DbConnection.getConnection();
		try {
			pstate = con.prepareStatement("insert into division_total_load values(?,?,?,?,?)");
			pstate.setString(1, division_name);
			pstate.setString(2, course_name);
			pstate.setInt(3, theory);
			pstate.setInt(4, practicals);
			pstate.setInt(5, tutorials);
			i = pstate.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;

	}

	public ResultSet getDivisionCourseAllocationDetails() {
		con = DbConnection.getConnection();
		try {
			st = con.createStatement();
			rs = st.executeQuery("select *from division_course_allocation");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

	public ResultSet getDivisionCoruseAllocationDetailsByTerm(String termYear) {
		con = DbConnection.getConnection();

		try {
			pstate = con.prepareStatement("select * from division_course_allocation where TERM=?");
			pstate.setString(1, termYear);
			rs = pstate.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;

	}

	public int getTotalRowsForDivision(String division) {

		int count = 0;
		con = DbConnection.getConnection();
		try {
			pstate = con.prepareStatement("select count(*) from division_course_allocation where 	DIVISION=?");
			pstate.setString(1, division);
			rs = pstate.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

	public ResultSet getCourseDetailsByDivision(String division) {

		con = DbConnection.getConnection();
		try {
			pstate = con.prepareStatement("select * from division_course_allocation where DIVISION=?");
			pstate.setString(1, division);
			rs = pstate.executeQuery();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

}
