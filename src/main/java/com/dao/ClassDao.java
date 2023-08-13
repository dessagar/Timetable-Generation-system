package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.model.Class;

public class ClassDao {
	Connection con=null;
	PreparedStatement pstate=null;
	int i=0;
	ResultSet rs=null;
	Statement st=null;
	
	public int create_Class(Class c)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("insert into class_master values(?,?,?,?,?)");
			pstate.setInt(1, c.getClassId());
			pstate.setString(2, c.getClassName());
			pstate.setString(3, c.getTyeOfClass());
			pstate.setInt(4, c.getBuildingId());
			pstate.setInt(5, c.getFloor());
			System.out.println(c.getFloor());
			
			i=pstate.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	public ResultSet getClassDetails()
	{
		con=DbConnection.getConnection();
		try {
			st=con.createStatement();
			rs=st.executeQuery("select *from class_master");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

	public ResultSet getClassDetailsById(int classId)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("select *from class_master where class_id=?");
			pstate.setInt(1, classId);
			rs=pstate.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public int deleteClass(int classId)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("delete from class_master where class_id=?");
			pstate.setInt(1,classId);
			
			i=pstate.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return i;
	}
	
	public int updateClass(int class_id,String className,String classType,int buildingId,int floorNo)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("update class_master set CLASSROOM_NAME=?,CLASS_TYPE=?,BUILDING_ID=?,CLASS_FLOOR=? where CLASS_ID=?");
			pstate.setString(1,className);
			pstate.setString(2, classType);
			pstate.setInt(3, buildingId);
			pstate.setInt(4, floorNo);
			pstate.setInt(5, class_id);
			
			i=pstate.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;

	}
	
	public ResultSet getClassNames()
	{
		con=DbConnection.getConnection();
		try {
			st=con.createStatement();
			rs=st.executeQuery("select classroom_name from class_master");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
}
