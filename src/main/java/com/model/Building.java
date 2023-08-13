package com.model;

public class Building {

	public int building_id;
	public String building_name;
	public int no_of_floors;
	public Building(int building_id, String building_name, int no_of_floors) {
		super();
		this.building_id = building_id;
		this.building_name = building_name;
		this.no_of_floors = no_of_floors;
	}
	public int getBuilding_id() {
		return building_id;
	}
	public void setBuilding_id(int building_id) {
		this.building_id = building_id;
	}
	public String getBuilding_name() {
		return building_name;
	}
	public void setBuilding_name(String building_name) {
		this.building_name = building_name;
	}
	public int getNo_of_floors() {
		return no_of_floors;
	}
	public void setNo_of_floors(int no_of_floors) {
		this.no_of_floors = no_of_floors;
	}
	
	

}
