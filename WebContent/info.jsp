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
<%Person persona = new Person();
persona.setAge(5);
persona.setName("dsgfs");
persona.insertPerson();

%>    

<h1><%=persona.getName() %></h1>

</body>
</html>