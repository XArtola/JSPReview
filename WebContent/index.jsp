<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="com.zubiri.paquete.*" %>
  <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table border="1">
<%
if(request.getParameter("borrar")!=null){
	
	Person person = new Person();
	person.setId(Integer.parseInt(request.getParameter("id")));
	person.deletePerson();
	response.sendRedirect("index.jsp");
	
}
else{
Conexion con = new Conexion();
con.connect();
ArrayList<Person> personas = new ArrayList<Person>();
personas =con.getPersonas();

%>
<tr>
<th>Name</th>
<th>Age</th>
<th>Date</th>
</tr>
<%for (int i=0; i<personas.size(); i++){ %>

<tr>
<td><%=personas.get(i).getName() %></td>
<td><%=personas.get(i).getAge() %></td>
<td><%=personas.get(i).getDate() %></td>
<td><a href="modify.jsp?id=<%=personas.get(i).getId()%>">Modify</a></td>
<td><a href="index.jsp?id=<%=personas.get(i).getId()%>&borrar=OK">Delete</a></td>
</tr>

<%	
}
%>
</table>
<a href="insert.jsp">Insert</a>
<%} %>
</body>
</html>