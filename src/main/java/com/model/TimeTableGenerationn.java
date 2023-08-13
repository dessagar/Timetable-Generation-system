package com.model;

public class TimeTableGenerationn {
	
	private String division;
	private String offered_courses;
	private String head;
	private String day;
	private String fromtime;
	private String totime;
	private String faculty;
	private String practical_batch;
	private String tutorial_batch;
	private String classroom;
	public TimeTableGenerationn(String division, String offered_courses, String head, String day, String fromtime,
			String totime, String faculty, String practical_batch, String tutorial_batch, String classroom) {
		super();
		this.division = division;
		this.offered_courses = offered_courses;
		this.head = head;
		this.day = day;
		this.fromtime = fromtime;
		this.totime = totime;
		this.faculty = faculty;
		this.practical_batch = practical_batch;
		this.tutorial_batch = tutorial_batch;
		this.classroom = classroom;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getOffered_courses() {
		return offered_courses;
	}
	public void setOffered_courses(String offered_courses) {
		this.offered_courses = offered_courses;
	}
	public String getHead() {
		return head;
	}
	public void setHead(String head) {
		this.head = head;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getFromtime() {
		return fromtime;
	}
	public void setFromtime(String fromtime) {
		this.fromtime = fromtime;
	}
	public String getTotime() {
		return totime;
	}
	public void setTotime(String totime) {
		this.totime = totime;
	}
	public String getFaculty() {
		return faculty;
	}
	public void setFaculty(String faculty) {
		this.faculty = faculty;
	}
	public String getPractical_batch() {
		return practical_batch;
	}
	public void setPractical_batch(String practical_batch) {
		this.practical_batch = practical_batch;
	}
	public String getTutorial_batch() {
		return tutorial_batch;
	}
	public void setTutorial_batch(String tutorial_batch) {
		this.tutorial_batch = tutorial_batch;
	}
	public String getClassroom() {
		return classroom;
	}
	public void setClassroom(String classroom) {
		this.classroom = classroom;
	}
	
	
	
}
