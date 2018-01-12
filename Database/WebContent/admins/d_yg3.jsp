<html>
<head>
<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<jsp:useBean id="db" scope="page" class="ck.ck" />
<%
	System.out.println("test");
	String supplierid = new String(request.getParameter("del"));
	String materialid = new String(request.getParameter("del2"));

	System.out.println("test");
	String sql2 = "delete from Supply_product where supplier_id = " + supplierid + " and material_id = "
			+ materialid;
	System.out.println(sql2);

	db.executeUpdate(sql2);
	db.closeStmt();
	db.closeConn();
%>
<script language="JavaScript" type="text/JavaScript">
	window.close()
</script>