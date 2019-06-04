package com.zubiri.paquete;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Person {

	private int id = 0;
	private String name = "";
	private int age = 0;
	private String date = "";

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public void getPerson(int id) throws ClassNotFoundException, SQLException {

		Conexion con = new Conexion();
		con.connect();
		PreparedStatement pst = con.getCon().prepareStatement("select * from person where id=?");
		pst.setInt(1, id);
		ResultSet rs = pst.executeQuery();
		rs.next();
		setId(rs.getInt("id"));
		setName(rs.getString("name"));
		setAge(rs.getInt("age"));
		setDate(rs.getString("fecha"));
		con.close();
	}

	public void updatePerson() throws ClassNotFoundException, SQLException {

		Conexion con = new Conexion();
		con.connect();
		PreparedStatement pst = con.getCon()
				.prepareStatement("update person set id=?, name=?, age=?, fecha=? where id=?;");
		pst.setInt(1, id);
		pst.setString(2, name);
		pst.setInt(3, age);
		pst.setString(4, date);
		pst.setInt(5, id);
		pst.execute();
		con.close();
	}

	public void deletePerson() throws ClassNotFoundException, SQLException {

		Conexion con = new Conexion();
		con.connect();
		PreparedStatement pst = con.getCon().prepareStatement("delete from person where id=?");
		pst.setInt(1, id);
		pst.execute();
		pst.close();
	}

	public void insertPerson() throws ClassNotFoundException, SQLException {

		Conexion con = new Conexion();
		con.connect();
		PreparedStatement pst = con.getCon()
				.prepareStatement("insert into person (id, name, age, fecha) values(?,?,?,?)");
		pst.setInt(1, id);
		pst.setString(2, name);
		pst.setInt(3, age);
		pst.setString(4, date);
		pst.execute();
		pst.close();
	}
	
}
