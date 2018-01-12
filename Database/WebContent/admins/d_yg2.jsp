<html>
<head>
<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<jsp:useBean id="db" scope="page" class="ck.ck" />
<%
	String supplierid = new String(request.getParameter("del"));

		
	String sql2="delete from Supply_product where supplier_id = "+supplierid ;
	String sql3="delete from Supplier where supplier_id = "+supplierid ;	
	db.executeUpdate(sql2);
	db.executeUpdate(sql3);
	db.closeStmt();
	db.closeConn();

	response.sendRedirect("ctrl_yg.jsp");
%>