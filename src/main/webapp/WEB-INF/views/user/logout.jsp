<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file= "/resources/common/header.jsp" %>
</head>
<body>
	<%
	session.invalidate();
	response.sendRedirect("/");
	%>
</body>
</html>