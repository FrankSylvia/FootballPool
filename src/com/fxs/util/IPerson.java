/**
 * 
 */
package com.fxs.util;

/**
 * @author FrankAdmin
 *
 */
public interface IPerson {
	
	static final String self = "self";
	
	void setId(int Id);
	void setName(String name);
	void setEmail(String email);
	void setMoniker(String moniker);
	String dump();
	
}
