<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.zubiri.paquete.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Person person = new Person();

if(request.getParameter("modifyButton")!=null){
	person.getPerson(Integer.parseInt(request.getParameter("idField")));
person.setId(Integer.parseInt(request.getParameter("idField")));
person.setName(request.getParameter("nameField"));
person.setAge(Integer.parseInt(request.getParameter("ageField")));
person.setDate(request.getParameter("dateField"));
System.out.println(person.getDate());
person.updatePerson();
response.sendRedirect("modify.jsp?id="+person.getId());

}
else{
person.getPerson(Integer.parseInt(request.getParameter("id")));

%>
<h1>Modify <%=person.getName()%></h1>
<form action="modify.jsp" method="get">
<table>
<tr><td>Name</td><td><input type="text" name="nameField" value=<%=person.getName()%>></td></tr>
<tr><td>Age</td><td><input type="text" name="ageField" value=<%=person.getAge()%>></td></tr>
<tr><td>Date</td><td><input type="text" name="dateField" value=<%=person.getDate()%>></td></tr>
</table>
<input type="hidden" name="idField" value=<%=person.getId()%>>
<input type="submit" name="modifyButton" value="modify">
</form>
<a href="index.jsp">Atras</a>
<%} %>
</body>
</html>