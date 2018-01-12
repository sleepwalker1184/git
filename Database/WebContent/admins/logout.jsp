<html>
<head>
<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%

 
%>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<title>无标题文档</title>
</head>
<body>
<%


		request.getSession().invalidate();
		response.sendRedirect("../index.html");
%>

</body>
</html>
