package com.model;

public class Division {
	
	public int division_id;
	public String division_name;
	public int year;
	public int no_of_practicals;
	public int no_of_tutorials;
	
	
	public Division(int division_id, String division_name, int year, int no_of_practicals, int no_of_tutorials) {
		super();
		this.division_id = division_id;
		this.division_name = division_name;
		this.year=year;
		this.no_of_practicals = no_of_practicals;
		this.no_of_tutorials = no_of_tutorials;
	}


	public int getDivision_id() {
		return division_id;
	}


	public void setDivision_id(int division_id) {
		this.division_id = division_id;
	}


	public String getDivision_name() {
		return division_name;
	}


	public void setDivision_name(String division_name) {
		this.division_name = division_name;
	}


	public int getYear() {
		return year;
	}


	public void setYear(int year) {
		this.year = year;
	}


	public int getNo_of_practicals() {
		return no_of_practicals;
	}


	public void setNo_of_practicals(int no_of_practicals) {
		this.no_of_practicals = no_of_practicals;
	}


	public int getNo_of_tutorials() {
		return no_of_tutorials;
	}


	public void setNo_of_tutorials(int no_of_tutorials) {
		this.no_of_tutorials = no_of_tutorials;
	}
	
	

}
