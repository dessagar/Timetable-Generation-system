package com.model;

public class Class {
	
	public int classId;
	public String className;
	public String tyeOfClass;
	public int buildingId;
	public int floor;
	public Class(int classId, String className, String tyeOfClass, int buildingId, int floor) {
		super();
		this.classId = classId;
		this.className = className;
		this.tyeOfClass = tyeOfClass;
		this.buildingId = buildingId;
		this.floor = floor;
	}
	public int getClassId() {
		return classId;
	}
	public void setClassId(int classId) {
		this.classId = classId;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getTyeOfClass() {
		return tyeOfClass;
	}
	public void setTyeOfClass(String tyeOfClass) {
		this.tyeOfClass = tyeOfClass;
	}
	public int getBuildingId() {
		return buildingId;
	}
	public void setBuildingId(int buildingId) {
		this.buildingId = buildingId;
	}
	public int getFloor() {
		return floor;
	}
	public void setFloor(int floor) {
		this.floor = floor;
	}
	
	
	
	

}
