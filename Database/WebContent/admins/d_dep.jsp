<%@page import="java.awt.Window"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<html>
<head>
<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<jsp:useBean id="db" scope="page" class="ck.ck" />
<%
	String orderid = request.getParameter("del");	

	String sql2 = "delete from Produceplan where order_id= "+orderid;
	String sql3 = "delete from base_order where order_id= "+orderid;

	db.executeUpdate(sql2);
	db.executeUpdate(sql3);
	db.closeStmt();
	db.closeConn();

	response.sendRedirect("ctrl_dep.jsp");
%>
window.alert(orderid);