package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.model.Slot;

public class SlotDao {
	
	Connection con=null;
	PreparedStatement pstate=null;
	int i=0;
	ResultSet rs=null;
	Statement st=null;
	
	public ResultSet checkSlot(String day,String fromtime,String totime)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("select *from slot_master where day=? and fromtime=? and totime=?");
			pstate.setString(1, day);
			pstate.setString(2, fromtime);
			pstate.setString(3, totime);
			rs=pstate.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	public int createSlot(Slot s)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("insert into slot_master values(?,?,?)");
			pstate.setString(1,s.getDay());
			pstate.setString(2, s.getFromtime());
			pstate.setString(3, s.getTotime());

			i=pstate.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	public ResultSet getAllSlots()
	{
		con=DbConnection.getConnection();
		try {
			st=con.createStatement();
			rs=st.executeQuery("select *from slot_master");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	public ResultSet getSlotDetailsById(String day)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("select *from slot_master where day=?");
			pstate.setString(1, day);
			rs=pstate.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	
	/*
	 * public ResultSet getSlotDetailsByTotime(String day,String fromtime) {
	 * con=DbConnection.getConnection(); System.out.println(fromtime); System.out.
	 * println("select TOTIME from slot_master where day=? and TOTIME>+fromtime");
	 * try { pstate=con.
	 * prepareStatement("select TOTIME from slot_master where DAY=? and TOTIME> "
	 * +fromtime); pstate.setString(1,day); rs=pstate.executeQuery();
	 * 
	 * } catch (SQLException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); }
	 * 
	 * return rs; }
	 */
	 
	
	public int updateSlot(String day,String fromTime,String toTime,String day1 ,String old_from_time,String old_to_time)
	{
		con=DbConnection.getConnection();
		System.out.println(day1+"\t"+old_from_time+"\t"+toTime);
		try {
			pstate=con.prepareStatement("update slot_master set day=?,fromtime=?,totime=? where day=? and fromtime=? and totime=?");
			pstate.setString(1,day);
			pstate.setString(2,fromTime);
			pstate.setString(3,toTime);
			pstate.setString(4, day1);
			pstate.setString(5, old_from_time);
			pstate.setString(6, old_to_time);

			
			i=pstate.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	public int deleteSlot(String day,String fromTime,String toTIme)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("delete from slot_master where day=? and fromtime=? and totime=?");
			pstate.setString(1,day);
			pstate.setString(2,fromTime);
			pstate.setString(3, toTIme);
			
			i=pstate.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return i;
		
	}
	
	public int getTotalSlotsForDay(String day)
	{
		int count = 0;
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("select count(*) from slot_master where day=?");
			pstate.setString(1, day);
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
}
