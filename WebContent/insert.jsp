<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.zubiri.paquete.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert</title>
</head>
<body>
<%
Person person = new Person();

if(request.getParameter("insertButton")!=null){

person.setName(request.getParameter("nameField"));
person.setAge(Integer.parseInt(request.getParameter("ageField")));
person.setDate(request.getParameter("dateField"));
System.out.println(person.getDate());
person.insertPerson();
response.sendRedirect("insert.jsp");

}
else{

%>
<h1>Insert new person</h1>
<form action="insert.jsp" method="get">
<table>
<tr><td>Name</td><td><input type="text" name="nameField"></td></tr>
<tr><td>Age</td><td><input type="text" name="ageField"></td></tr>
<tr><td>Date</td><td><input type="text" name="dateField"></td></tr>
</table>
<input type="submit" name="insertButton" value="insert">
</form>
<a href="index.jsp">Atras</a>
<%} %>
</body>
</html>