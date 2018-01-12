<html>
<head>
<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<jsp:useBean id="db" scope="page" class="ck.ck" />
<%
	String orderid = new String(request.getParameter("del"));
	String materialid = new String(request.getParameter("del2"));

	String sql2 = "delete from purchase_inf where order_id = " + orderid + " and material_id = " + materialid;

	db.executeUpdate(sql2);
	db.closeStmt();
	db.closeConn();

	
%>
<script language="JavaScript" type="text/JavaScript">
	window.close()
</script>