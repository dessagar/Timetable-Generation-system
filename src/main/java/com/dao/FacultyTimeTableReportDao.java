package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FacultyTimeTableReportDao {
	
	PreparedStatement pstat=null;
	Connection con=null;
	ResultSet rs=null;
	int i=0;
	
	public ResultSet getFacultyTimeTableByDay(String faculty, String day ,String[] slot,int counter)
	{
		int temp=0;
		ResultSet rs1;
		ResultSet rs2;
		ResultSet rs3;
		System.out.println("hello in getTimetable by day "+day);
		con=DbConnection.getConnection();
		System.out.println("ft "+slot[counter].substring(0, 5)+"\ntt "+slot[counter].substring(6));
		try {
			String nftt=slot[counter].substring(0,5);
			String nttt=slot[counter].substring(6);
			pstat=con.prepareStatement("select *from timetable_generation where faculty=? and day=? and fromtime=? and totime=?");
			pstat.setString(1, faculty);
			pstat.setString(2, day);
			pstat.setString(3, nftt);
			pstat.setString(4, nttt);
			rs=pstat.executeQuery();
			
			if(!rs.isBeforeFirst())
			{
				
				System.out.println("rs is null");
				String nft=slot[counter].substring(0,5);
				if(counter<11)
				{
					temp=counter+1;
				}
				
				String ntt=slot[temp].substring(6);
				String nslot=nft+"-"+ntt;
				
				System.out.println("new slot "+nslot);
				
				
					pstat=con.prepareStatement("select *from timetable_generation where faculty=? and day=? and fromtime=? and totime=?");
					pstat.setString(1, faculty);
					pstat.setString(2, day);
					pstat.setString(3, nft);
					pstat.setString(4, ntt);
					rs1=pstat.executeQuery();
					
					if(!rs1.isBeforeFirst())
					{
						System.out.println("rs is null for 2 hour");
						
						
					}
					else
					{
						System.out.println("rs is not null for 2 hours");
						return rs1;
					}
				
			}
			else
			{
				System.out.println("rs is not null");
				return rs;
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
//		try {
//			if(rs==null)
//			{
//				String nft=slot[counter].substring(0,5);
//				if(counter<11)
//				{
//					temp=counter+1;
//				}
//				
//				String ntt=slot[temp].substring(6);
//				String nslot=nft+"-"+ntt;
//				
//				System.out.println("new slot "+nslot);
//				
//				
//					pstat=con.prepareStatement("select *from timetable_generation where division=? and day=? and fromtime=? and totime=?");
//					pstat.setString(1, div);
//					pstat.setString(2, day);
//					pstat.setString(3, nft);
//					pstat.setString(4, ntt);
//					rs=pstat.executeQuery();
//					if(rs!=null)
//					{
//						System.out.println("rs is not null for 2 hour");
//						return rs;
//					}
//				
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//	
//		
		return rs;
	}
	
	public ResultSet getDuplicateRow(String div,String ft,String tt,String day)
	{
		System.out.println("hello hello");
		con=DbConnection.getConnection();
		try {
			pstat=con.prepareStatement("select *from timetable_generation where division=? and fromtime=? and totime=? and day=?");
			pstat.setString(1, div);
			pstat.setString(2, ft);
			pstat.setString(3, tt);
			pstat.setString(4, day);
			rs=pstat.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return rs;
				
	}


}
