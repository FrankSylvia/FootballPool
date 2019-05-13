package com.fxs.util;

/**
 * @author FrankAdmin
 *
 */

public interface IRoles {

	static final String self = "self";
	
	void setId(int Id);
	void setDisplayName(String displayname);
	void setPowerLevel(int powerlevel);

	int getId();
	String getDisplayName();
	int setPowerLevel();

	void addMember(int Id, int powerlevel);
	void removeMember(int Id);
	
	String dump();
	
}
