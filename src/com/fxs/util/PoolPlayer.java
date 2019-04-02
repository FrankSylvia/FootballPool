package com.fxs.util;

public class PoolPlayer implements Person {
	private int Id;
	private String name;
	private PoolAgent agentId;
	private String moniker;
	private String email;
	
	
	
	public PoolPlayer (int Id, String moniker, String name, String email, int pa) {
		setId(Id);
		setMoniker(moniker);
		setName(name);
		setEmail(email);
	}
	
	public PoolPlayer (int Id, String moniker, String name, String email) {
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
	 * @return the agentId
	 */
	public PoolAgent getAgentId() {
		return agentId;
	}

	/**
	 * @param agentId the agentId to set
	 */
	public void setAgentId(PoolAgent agentId) {
		this.agentId = agentId;
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

	
}
