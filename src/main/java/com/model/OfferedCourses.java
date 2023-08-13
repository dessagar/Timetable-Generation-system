package com.model;

import java.util.ArrayList;
import java.util.List;

public class OfferedCourses {
	
	public String term;
	public ArrayList<String> courseCodes;
	public List<String> courseNameList;
	public OfferedCourses(String term, ArrayList<String> courseCodes, List<String> courseNameList) {
		super();
		this.term = term;
		this.courseCodes = courseCodes;
		this.courseNameList = courseNameList;
	}
	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	public ArrayList<String> getCourseCodes() {
		return courseCodes;
	}
	public void setCourseCodes(ArrayList<String> courseCodes) {
		this.courseCodes = courseCodes;
	}
	public List<String> getCourseNameList() {
		return courseNameList;
	}
	public void setCourseNameList(List<String> courseNameList) {
		this.courseNameList = courseNameList;
	}
	
	
}
