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
import com.mysql.jdbc.PreparedStatement;



public class PoolAccess {

	protected String dbUrl;
	protected String dbClass;
	
	/**
	 * 
	 */
	public PoolAccess() {
		// TODO Auto-generated constructor stub

		dbUrl = "jdbc:mysql://localhost:3306/casinodb";
		dbClass = "com.mysql.jdbc.Driver";

	}
	

	/**
	 * @param args
	 */
	public ArrayList<Person> getPersonList() {
		// TODO Auto-generated method stub
	
		ArrayList<Person> list = new ArrayList<Person>();
		
		String query = "SELECT person.pe_id as ID, person.pe_moniker as MONIKER, person.name as NAME, person.email as EMAIL FROM person ORDER BY Moniker;";		
		System.out.println("query=" + query);
		try {			
			Class.forName(dbClass);
			Connection con = (Connection) DriverManager.getConnection (dbUrl,"root","rogozhin2");
			PreparedStatement pstmt = (PreparedStatement)con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery(query);
			//pstmt.setInt(1,1);
			System.out.println("Users");
			Person pp = null;
			while (rs.next()) {
				pp = new Person(rs.getInt("ID"),rs.getString("MONIKER"),rs.getString("NAME"),rs.getString("EMAIL"));
				System.out.println(pp.dump());
				list.add(pp);
			}

			rs.close();
		    pstmt.close();
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
	public Person getPersonDetails(int personid) {
		// TODO Auto-generated method stub
		
		String query = ""; 
		Person pp = null;
		    
//		query = "SELECT pers.pe_id as ID, pers.pe_moniker as MONIKER, pers.name as NAME, pers.email as EMAIL, plyr.agent as agnt FROM (SELECT player.pl_moniker, player.agent FROM player where player.pl_moniker = " + playerid + ") AS plyr, person pers WHERE pers.pe_id = plyr.pl_moniker;";

		query = "select pe_id, pe_moniker, name, email from person where person.pe_id = " + personid;		

		System.out.println("query=" + query);
		
		try {			
			Class.forName(dbClass);
			Connection con = (Connection) DriverManager.getConnection (dbUrl,"root","rogozhin2");
		    Statement stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
	
			System.out.println("Users");
			if (rs.next()) {
//				pp = new PoolPlayer(rs.getInt("ID"),rs.getString("MONIKER"),rs.getString("NAME"),rs.getString("EMAIL"));
				pp = new Person(rs.getInt("pe_id"),rs.getString("pe_moniker"),rs.getString("name"),rs.getString("email"));
				System.out.println(pp.dump());
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
	public ArrayList<PoolPlayer> getPlayerList() {
		// TODO Auto-generated method stub		
		String query = ""; 
		ArrayList<PoolPlayer> list = new ArrayList<PoolPlayer>();
		
		query = "select pl_id, pl_moniker, name, email from player join person on person.pe_id = player.pl_id";		
		//query = "select pl_id, pl_moniker, name, email, ag_moniker, ag_id from player join person on person.pe_id = player.pl_id join agent on player.agent = agent.ag_id";		
		System.out.println("query=" + query);
		try {		
			Class.forName(dbClass);
			Connection con = (Connection) DriverManager.getConnection (dbUrl,"root","rogozhin2");
		    Statement stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery(query);

			System.out.println("Players");
			PoolPlayer pp = null;
			while (rs.next()) {
				pp = new PoolPlayer(rs.getInt("pl_id"),rs.getString("pl_moniker"),rs.getString("name"),rs.getString("email"),0,"No Agent");
				list.add(pp);
				System.out.println(pp.dump());
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
		    
//		query = "SELECT pers.pe_id as ID, pers.pe_moniker as MONIKER, pers.name as NAME, pers.email as EMAIL, plyr.agent as agnt FROM (SELECT player.pl_moniker, player.agent FROM player where player.pl_moniker = " + playerid + ") AS plyr, person pers WHERE pers.pe_id = plyr.pl_moniker;";

		query = "select pl_id, pl_moniker, name, email, ag_moniker, ag_id from player join person on player.pl_id = " + playerid + " join agent on player.agent = agent.ag_id";		

		System.out.println("query=" + query);
		try {
			
			Class.forName(dbClass);
			Connection con = (Connection) DriverManager.getConnection (dbUrl,"root","rogozhin2");
		    Statement stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
	
			System.out.println("Players");
			if (rs.next()) {
//				pp = new PoolPlayer(rs.getInt("ID"),rs.getString("MONIKER"),rs.getString("NAME"),rs.getString("EMAIL"));
				pp = new PoolPlayer(rs.getInt("pl_id"),rs.getString("pl_moniker"),rs.getString("name"),rs.getString("email"),rs.getInt("ag_id"),rs.getString("ag_moniker"));
				System.out.println(pp.dump());
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
		    
		query = "select person.pe_id as ID, person.pe_moniker as MONIKER, person.name as NAME, person.email as EMAIL, agent.ag_id as ID from person, agent where agent.ag_moniker = person.pe_id;";
		
		try {
			
			Class.forName(dbClass);
			Connection con = (Connection) DriverManager.getConnection (dbUrl,"root","rogozhin2");
		    Statement stmt = (Statement) con.createStatement();

			ResultSet rs = stmt.executeQuery(query);
	
			while (rs.next()) {
				PoolAgent pa = new PoolAgent( rs.getInt("ID"), rs.getString("MONIKER"),rs.getString("NAME"),rs.getString("EMAIL"));
				list.add(pa);
				System.out.println(pa.dump());
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
		    	
		query = "select pe_id, pe_moniker name, email, from player join person join agent on player.agent = agent.ag_id";

		//query = "select person.pe_moniker as MONIKER, person.name as NAME, person.email as EMAIL, agent.ag_id as ID from person, agent where agent.ag_moniker = person.pe_id;";
		System.out.println("query=" + query);

		try {
			
			Class.forName(dbClass);
			Connection con = (Connection) DriverManager.getConnection (dbUrl,"root","rogozhin2");
		    Statement stmt = (Statement) con.createStatement();
		    ResultSet rs = stmt.executeQuery(query);

			System.out.println("Players");
			PoolPlayer pp = null;
			while (rs.next()) {
				pp = new PoolPlayer(rs.getInt("pe_id"),rs.getString("pe_moniker"),rs.getString("name"),rs.getString("email"));				
				list.add(pp);
				System.out.println(pp.dump());
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
		String query = "select COLUMN_NAME as COL from information_schema.columns where table_schema = 'casinodb' and table_name = 'person'";

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

	/**
	 * @param args
	 */
	public void addPerson() {
		// TODO Auto-generated method stub
	
		String query = "INSERT INTO person (pe_Moniker, Name, email) VALUES ('KC', 'KC Jones', 'KC@aol.com');";
	
//		String query = "SELECT person.id as ID, person.moniker as MONIKER, person.name as NAME, person.email as EMAIL FROM person ORDER BY Moniker;";		
		System.out.println("query=" + query);
		try {			
			Class.forName(dbClass);
			Connection con = (Connection) DriverManager.getConnection (dbUrl,"root","rogozhin2");
			PreparedStatement pstmt = (PreparedStatement)con.prepareStatement(query);
			//pstmt.setInt(1,16);
			//pstmt.setString(1,"KC");
			//pstmt.setString(2,"KC Jones");
			//pstmt.setString(3,"KC@aol.com");
			
			System.out.println("Players");
			pstmt.execute(query);
		    pstmt.close();
			con.close();
		} //end try
		catch(ClassNotFoundException e) {
			e.printStackTrace();
		}

		
		catch(java.sql.SQLException e) {
			e.printStackTrace();
		}
	}
	

	//INSERT INTO `mypooldb`.`person` (`id`, `Moniker`, `Name`, `email`) VALUES ('15', 'Chief', 'Robert Parish', 'chief@aol.com');
}
class Test {

	static void main(String[] args){

		System.out.println("Hello World");
		PoolAccess pool = new PoolAccess();
		pool.getPersonList();
	}
	}

