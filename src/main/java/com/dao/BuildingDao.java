package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.model.Building;

public class BuildingDao {
	
	Connection con=null;
	PreparedStatement pstate=null;
	int i=0;
	ResultSet rs=null;
	Statement st=null;
	
	public int create_Building(Building bd)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("insert into building_master values (?,?,?)");
			pstate.setInt(1, bd.getBuilding_id());
			pstate.setString(2, bd.getBuilding_name());
			pstate.setInt(3, bd.getNo_of_floors());
			i=pstate.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	public ResultSet getBuildingName()
	{
		con=DbConnection.getConnection();
		try {
			st=con.createStatement();
			rs=st.executeQuery("select building_name from building_master");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	public ResultSet getBuildingDetails()
	{
		con=DbConnection.getConnection();
		try {
			st=con.createStatement();
			rs=st.executeQuery("select *from building_master");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	public ResultSet getBuildingFloors(String str)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("select building_floors from building_master where building_name=?");
			pstate.setString(1, str);
			rs=pstate.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
		
	}
	
	public ResultSet getBuildingId(String str)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("select building_id from building_master where building_name=?");
			pstate.setString(1, str);
			rs=pstate.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
		
	}
	public ResultSet getBuildingNameById(int buildingId)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("select building_name from building_master where building_id=? ");
			pstate.setInt(1, buildingId);
			rs=pstate.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	
	
	public ResultSet getBuildingDetailsById(int buildingId)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("select *from building_master where building_id=?");
			pstate.setInt(1, buildingId);
			rs=pstate.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

	public int buldingUpdate(String buildingName,int buildingFloor,int buildingId)
	{
		con=DbConnection.getConnection();
		
		try {
			
			pstate=con.prepareStatement("update building_master set building_name=? ,building_floors=? where building_id=? ");
			pstate.setString(1, buildingName);
			pstate.setInt(2, buildingFloor);
			pstate.setInt(3, buildingId);
			
			i=pstate.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
		
	}
	
	public int buildingDelete(int buildingId)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("delete from class_master where building_id=?");
			pstate.setInt(1, buildingId);
			i=pstate.executeUpdate();

			pstate=con.prepareStatement("delete from building_master where building_id=?");
			pstate.setInt(1, buildingId);
			
			i=pstate.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
}
