/**
 * 
 */
package com.fxs.util;

/**
 * @author FrankAdmin
 *
 */


import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;




public class PoolAccess {

	protected String dbUrl;
	protected String dbClass;
	
	/**
	 * 
	 */
	public PoolAccess() {
		// TODO Auto-generated constructor stub

		dbUrl = "jdbc:mysql://localhost:3306/mypooldb";
		dbClass = "com.mysql.jdbc.Driver";

	}

	
	/**
	 * @param args
	 */
	public ArrayList<PoolPlayer> getPlayerList() {
		// TODO Auto-generated method stub
		
		String query = ""; 
		ArrayList<PoolPlayer> list = new ArrayList<PoolPlayer>();
		    	
		query = "SELECT pers.id as ID, pers.moniker as MONIKER, pers.name as NAME, pers.email as EMAIL, plyr.id as PLID FROM (SELECT player.moniker, player.id FROM player) as plyr, person pers WHERE pers.id = plyr.moniker;";		

		System.out.println("query=" + query);
		try {
			
			Class.forName(dbClass);
			Connection con = (Connection) DriverManager.getConnection (dbUrl,"root","rogozhin2");
		    Statement stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery(query);

			System.out.println("Players");
			PoolPlayer pp = null;
			while (rs.next()) {
				pp = new PoolPlayer(rs.getInt("ID"),rs.getString("MONIKER"),rs.getString("NAME"),rs.getString("EMAIL"));
				list.add(pp);
			}

			rs.close();
		    stmt.close();
			con.close();
		} //end try
		
		catch(ClassNotFoundException e) {
			e.printStackTrace();
		}

		catch(java.sql.SQLException e) {
			e.printStackTrace();
		}
		return (list);
	}
	
	/**
	 * @param args
	 */
	public PoolPlayer getPlayerDetails(int playerid) {
		// TODO Auto-generated method stub
		
		String query = ""; 
		PoolPlayer pp = null;
		    

		query = "SELECT pers.id as ID, pers.moniker as MONIKER, pers.name as NAME, pers.email as EMAIL, plyr.agent as agnt FROM (SELECT player.moniker, player.agent FROM player where player.moniker = " + playerid + ") AS plyr, person pers WHERE pers.id = plyr.moniker;";
		
		System.out.println("query=" + query);
		try {
			
			Class.forName(dbClass);
			Connection con = (Connection) DriverManager.getConnection (dbUrl,"root","rogozhin2");
		    Statement stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
	
			System.out.println("Players");
			if (rs.next()) {
				pp = new PoolPlayer(rs.getInt("ID"),rs.getString("MONIKER"),rs.getString("NAME"),rs.getString("EMAIL"));
			}

			rs.close();

		    stmt.close();
			con.close();
		} //end try
		
		catch(ClassNotFoundException e) {
			e.printStackTrace();
		}

		catch(java.sql.SQLException e) {
			e.printStackTrace();
		}
		return (pp);
	}
	
	
	/**
	 * @param args
	 */
	public ArrayList<PoolAgent> getAgentList() {
		// TODO Auto-generated method stub
		
		String query = ""; 
		ArrayList<PoolAgent> list = new ArrayList<PoolAgent>();
		    
		query = "select person.moniker as MONIKER, person.name as NAME, person.email as EMAIL, agent.id as ID from person, agent where agent.moniker = person.id;";
		
		try {
			
			Class.forName(dbClass);
			Connection con = (Connection) DriverManager.getConnection (dbUrl,"root","rogozhin2");
		    Statement stmt = (Statement) con.createStatement();

			ResultSet rs = stmt.executeQuery(query);
	
			while (rs.next()) {
				PoolAgent pa = new PoolAgent( rs.getInt("ID"), rs.getString("MONIKER"),rs.getString("NAME"),rs.getString("EMAIL"));
				list.add(pa);
			}

			rs.close();
		    stmt.close();
			con.close();
		} //end try
		
		catch(ClassNotFoundException e) {
			e.printStackTrace();
		}

		catch(java.sql.SQLException e) {
			e.printStackTrace();
		}
		return (list);
	}	

	/**
	 * @param args
	 */
	public ArrayList<PoolPlayer> getPlayersForAgent(int agent) {
		// TODO Auto-generated method stub
		
		String query = ""; 
		ArrayList<PoolPlayer> list = new ArrayList<PoolPlayer>();
		    	
		query = "SELECT pers.id as ID, pers.moniker as MONIKER, pers.name as NAME, pers.email as EMAIL, plyr.id as PLID FROM (SELECT player.moniker, player.id FROM player where player.agent = " + agent + ") AS plyr, person pers WHERE pers.id = plyr.moniker;";			

		System.out.println("query=" + query);
		try {
			
			Class.forName(dbClass);
			Connection con = (Connection) DriverManager.getConnection (dbUrl,"root","rogozhin2");
		    Statement stmt = (Statement) con.createStatement();
		    ResultSet rs = stmt.executeQuery(query);

			System.out.println("Players");
			PoolPlayer pp = null;
			while (rs.next()) {
				pp = new PoolPlayer(rs.getInt("PLID"),rs.getString("MONIKER"),rs.getString("NAME"),rs.getString("EMAIL"),rs.getInt("ID"));				
				list.add(pp);
			}
			rs.close();		
		    stmt.close();
			con.close();
		} //end try
		
		catch(ClassNotFoundException e) {
			e.printStackTrace();
		}

		catch(java.sql.SQLException e) {
			e.printStackTrace();
		}
		return (list);
	}	

	/**
	 * @param args
	 */
	public String[] getPlayerColumns() {
		// TODO Auto-generated method stub
		
		String cols[] = new String[4];	    	
		String query = "select COLUMN_NAME as COL from information_schema.columns where table_schema = 'mypooldb' and table_name = 'person'";

		try {
			
			Class.forName(dbClass);
			Connection con = (Connection) DriverManager.getConnection (dbUrl,"root","rogozhin2");
		    Statement stmt = (Statement) con.createStatement();
		    ResultSet rs = stmt.executeQuery(query);

			System.out.println("Player Columns");
			int i=0;
			while (rs.next()) {
				cols[i++] = rs. getString("COL");
			}
			rs.close();		
		    stmt.close();
			con.close();
		} //end try
		
		catch(ClassNotFoundException e) {
			e.printStackTrace();
		}

		catch(java.sql.SQLException e) {
			e.printStackTrace();
		}
		return (cols);
	}	



}
