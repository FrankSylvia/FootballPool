package com.fxs.util;

public class PoolPlayer implements IPerson {
	private int Id;
	private String name;
	private String moniker;
	private String email;
	private PoolAgent agent;
	
	
	
	public PoolPlayer (int Id, String moniker, String name, String email, int ag_id, String ag_moniker) {
		setId(Id);
		setMoniker(moniker);
		setName(name);
		setEmail(email);
		agent = new PoolAgent(ag_id,ag_moniker,name,email);
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
	 * @return the agent
	 */
	public PoolAgent getAgent() {
		return agent;
	}
	/**
	 * @return the agentId
	 */
	public int getAgentId() {
		return agent.getId();
	}

/**
	 * @return the agentMoniker
	 */
	public String getAgentMoniker() {
		return agent.getMoniker();
	}

	/**
	 * @param agent set the agent (id and moniker)
	 */
	public void setAgent(int agentId, String agentMoniker) {
		this.agent.setId(agentId);
		this.agent.setMoniker(agentMoniker);
	}
	/**
	 * @param agentId the agentId to set
	 */
	public void setAgentId(int agentId) {
		this.agent.setId(agentId);
	}
	/**
	 * @param agentId the agentMoniker to set
	 */
	public void setAgentMoniker(String agentMoniker) {
		this.agent.setMoniker(agentMoniker);
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
		line = String.valueOf(getId()) + "," + getMoniker() + "," + getName() + "," + getEmail() + "," + getMoniker() + "," + String.valueOf(getAgentId()); 
		return line;
	}
	
}