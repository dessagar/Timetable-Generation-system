package com.model;

public class Course {
	public String course_code;
	public String course_name;
	public String course_abbr;
	public int year;
	public int no_of_theory;
	public int no_of_pract;
	public int no_of_tuts;
	public Course(String course_code, String course_name, String course_abbr, int year, int no_of_theory,
			int no_of_pract, int no_of_tuts) {
		super();
		this.course_code = course_code;
		this.course_name = course_name;
		this.course_abbr = course_abbr;
		this.year = year;
		this.no_of_theory = no_of_theory;
		this.no_of_pract = no_of_pract;
		this.no_of_tuts = no_of_tuts;
	}
	public String getCourse_code() {
		return course_code;
	}
	public void setCourse_code(String course_code) {
		this.course_code = course_code;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public String getCourse_abbr() {
		return course_abbr;
	}
	public void setCourse_abbr(String course_abbr) {
		this.course_abbr = course_abbr;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getNo_of_theory() {
		return no_of_theory;
	}
	public void setNo_of_theory(int no_of_theory) {
		this.no_of_theory = no_of_theory;
	}
	public int getNo_of_pract() {
		return no_of_pract;
	}
	public void setNo_of_pract(int no_of_pract) {
		this.no_of_pract = no_of_pract;
	}
	public int getNo_of_tuts() {
		return no_of_tuts;
	}
	public void setNo_of_tuts(int no_of_tuts) {
		this.no_of_tuts = no_of_tuts;
	}
	
	

}
