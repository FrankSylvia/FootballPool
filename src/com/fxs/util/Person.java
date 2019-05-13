package com.fxs.util;

public class Person implements IPerson {
	private int Id;
	private String name;
	private String moniker;
	private String email;
	
	public Person (int Id, String moniker, String name, String email) {
		// TODO Auto-generated constructor stub
		setId(Id);
		setMoniker(moniker);
		setName(name);
		setEmail(email);
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the moniker
	 */
	public String getMoniker() {
		return moniker;
	}

	/**
	 * @param moniker the moniker to set
	 */
	public void setMoniker(String moniker) {
		this.moniker = moniker;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return the id
	 */
	public int getId() {
		return Id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		Id = id;
	}

	public String dump() {
		String line = "";
		line = String.valueOf(getId()) + "," + getMoniker() + "," + getName() + "," + getEmail(); 
		return line;
	}
}
