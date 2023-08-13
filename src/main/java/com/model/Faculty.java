package com.model;

//import java.util.ArrayList;

public class Faculty {
	
	public int facultyId;
	public String facultyName;
	public String facultyAbbr;
	public String facultyEmail;
	public String facultyDesignation;
	public String facultyType;
//	public ArrayList<String> facultyCourseCodes;
	public Faculty(int facultyId, String facultyName, String facultyAbbr, String facultyEmail,
			String facultyDesignation, String facultyType) {
		super();
		this.facultyId = facultyId;
		this.facultyName = facultyName;
		this.facultyAbbr = facultyAbbr;
		this.facultyEmail = facultyEmail;
		this.facultyDesignation = facultyDesignation;
		this.facultyType = facultyType;
	}
	public int getFacultyId() {
		return facultyId;
	}
	public void setFacultyId(int facultyId) {
		this.facultyId = facultyId;
	}
	public String getFacultyName() {
		return facultyName;
	}
	public void setFacultyName(String facultyName) {
		this.facultyName = facultyName;
	}
	public String getFacultyAbbr() {
		return facultyAbbr;
	}
	public void setFacultyAbbr(String facultyAbbr) {
		this.facultyAbbr = facultyAbbr;
	}
	public String getFacultyEmail() {
		return facultyEmail;
	}
	public void setFacultyEmail(String facultyEmail) {
		this.facultyEmail = facultyEmail;
	}
	public String getFacultyDesignation() {
		return facultyDesignation;
	}
	public void setFacultyDesignation(String facultyDesignation) {
		this.facultyDesignation = facultyDesignation;
	}
	public String getFacultyType() {
		return facultyType;
	}
	public void setFacultyType(String facultyType) {
		this.facultyType = facultyType;
	}
	
	
	}
