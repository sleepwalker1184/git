<html>
<head>
<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<jsp:useBean id="db" scope="page" class="ck.ck" />
<%
	String orderid = new String(request.getParameter("del"));
	String sql3 = "delete from Produceplan where order_id = " + orderid;
	String sql4 ="delete from purchase_inf where order_id = " + orderid;
	String sql2 = "delete from base_order where order_id = " + orderid;

	db.executeUpdate(sql4);
	db.executeUpdate(sql3);
	db.executeUpdate(sql2);
	db.closeStmt();
	db.closeConn();

	response.sendRedirect("ctrl_news.jsp");
%>