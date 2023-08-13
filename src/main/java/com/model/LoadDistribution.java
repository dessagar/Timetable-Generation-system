package com.model;

public class LoadDistribution {
	
	public int facultyId;
	public String facultyName;
	public String designation;
	public String division;
	public String courseCode;
	public String courseAbbr;
	public int theory;
	public int practical;
	public String practicalBatch;
	public int tutorial;
	public String tutorialBatch;
	public int load;
	public LoadDistribution(int facultyId, String facultyName, String designation, String division, String courseCode,
			String courseAbbr, int theory, int practical, String practicalBatch, int tutorial, String tutorialBatch,
			int load) {
		super();
		this.facultyId = facultyId;
		this.facultyName = facultyName;
		this.designation = designation;
		this.division = division;
		this.courseCode = courseCode;
		this.courseAbbr = courseAbbr;
		this.theory = theory;
		this.practical = practical;
		this.practicalBatch = practicalBatch;
		this.tutorial = tutorial;
		this.tutorialBatch = tutorialBatch;
		this.load = load;
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
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getCourseCode() {
		return courseCode;
	}
	public void setCourseCode(String courseCode) {
		this.courseCode = courseCode;
	}
	public String getCourseAbbr() {
		return courseAbbr;
	}
	public void setCourseAbbr(String courseAbbr) {
		this.courseAbbr = courseAbbr;
	}
	public int getTheory() {
		return theory;
	}
	public void setTheory(int theory) {
		this.theory = theory;
	}
	public int getPractical() {
		return practical;
	}
	public void setPractical(int practical) {
		this.practical = practical;
	}
	public String getPracticalBatch() {
		return practicalBatch;
	}
	public void setPracticalBatch(String practicalBatch) {
		this.practicalBatch = practicalBatch;
	}
	public int getTutorial() {
		return tutorial;
	}
	public void setTutorial(int tutorial) {
		this.tutorial = tutorial;
	}
	public String getTutorialBatch() {
		return tutorialBatch;
	}
	public void setTutorialBatch(String tutorialBatch) {
		this.tutorialBatch = tutorialBatch;
	}
	public int getLoad() {
		return load;
	}
	public void setLoad(int load) {
		this.load = load;
	}
	
	
}
