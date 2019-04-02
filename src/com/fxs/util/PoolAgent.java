/**
 * 
 */
package com.fxs.util;

/**
 * @author FrankAdmin
 *
 */
public class PoolAgent implements Person {
	private int Id;

	private String name;
	private String moniker;
	private String email;

	/**
	 * 
	 */
	public PoolAgent() {
		// TODO Auto-generated constructor stub
		setId(0);
	}
	/**
	 * 
	 */
	public PoolAgent(int Id, String moniker, String name, String email) {
		// TODO Auto-generated constructor stub
		setId(Id);
		setMoniker(moniker);
		setName(name);
		setEmail(email);
	}

	/* (non-Javadoc)
	 * @see fxs.Person#setName(java.lang.String)
	 */
	@Override
	public void setName(String name) {
		// TODO Auto-generated method stub
		this.name = name;
	}
	/* (non-Javadoc)
	 * @see fxs.Person#setEmail(java.lang.String)
	 */
	@Override
	public void setEmail(String email) {
		// TODO Auto-generated method stub
		this.email = email;

	}

	/* (non-Javadoc)
	 * @see fxs.Person#setMoniker(java.lang.String)
	 */
	@Override
	public void setMoniker(String moniker) {
		// TODO Auto-generated method stub
		this.moniker = moniker;

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

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @return the moniker
	 */
	public String getMoniker() {
		return moniker;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

}
