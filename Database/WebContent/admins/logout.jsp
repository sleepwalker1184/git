<html>
<head>
<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%

 
%>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<title>�ޱ����ĵ�</title>
</head>
<body>
<%


		request.getSession().invalidate();
		response.sendRedirect("../index.html");
%>

</body>
</html>
