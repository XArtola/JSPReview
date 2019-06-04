package com.zubiri.paquete;

import java.sql.*;
import java.util.ArrayList;

public class Conexion {

	private Connection con;
	private PreparedStatement st;
	private CallableStatement cst;
	
	public Connection getCon() {
		return con;
	}

	public void setCon(Connection con) {
		this.con = con;
	}

	public PreparedStatement getSt() {
		return st;
	}

	public void setSt(PreparedStatement st) {
		this.st = st;
	}

	public CallableStatement getCst() {
		return cst;
	}

	public void setCst(CallableStatement cst) {
		this.cst = cst;
	}

	public void connect() throws ClassNotFoundException, SQLException {

		Class.forName("com.mysql.cj.jdbc.Driver");
		String jdbcUrl = "jdbc:mysql://localhost:3306/personas?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";		
		con = DriverManager.getConnection(jdbcUrl,"usuario","1234");

	}
	
	public void close() throws SQLException {
		
		con.close();
		
	}
	
	public ArrayList<Person> getPersonas() throws SQLException, ClassNotFoundException{
		
		st = con.prepareStatement("select * from person");
		ResultSet rs = st.executeQuery();
		ArrayList<Person> personas = new ArrayList<Person>();
		while(rs.next()) {
			
			Person person = new Person();
			person.setId(rs.getInt("id"));
			person.setName(rs.getString("name"));
			person.setAge(rs.getInt("age"));
			person.setDate(rs.getString("fecha"));
			personas.add(person);
		}
		
		return personas;
	
		
	}
	
	

}
