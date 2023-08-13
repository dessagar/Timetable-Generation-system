package com.model;

public class Slot {
	public String day;
	public String fromtime;
	public String totime;
	public Slot(String day, String fromtime, String totime) {
		super();
		this.day = day;
		this.fromtime = fromtime;
		this.totime = totime;
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
	
	

}
