package com.model;

import java.util.List;

public class DivisionCourseAllocation {
	
	public String term;
	public String division;
	public List<String> allotedCourseNames;
	public List<String> allotedCourseCodes;
	public DivisionCourseAllocation(String term, String division, List<String> allotedCourseNames,
			List<String> allotedCourseCodes) {
		super();
		this.term = term;
		this.division = division;
		this.allotedCourseNames = allotedCourseNames;
		this.allotedCourseCodes = allotedCourseCodes;
	}
	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public List<String> getAllotedCourseNames() {
		return allotedCourseNames;
	}
	public void setAllotedCourseNames(List<String> allotedCourseNames) {
		this.allotedCourseNames = allotedCourseNames;
	}
	public List<String> getAllotedCourseCodes() {
		return allotedCourseCodes;
	}
	public void setAllotedCourseCodes(List<String> allotedCourseCodes) {
		this.allotedCourseCodes = allotedCourseCodes;
	}
	
	

}
