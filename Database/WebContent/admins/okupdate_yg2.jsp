
<%@ page contentType="text/html; charset=gb2312"%>
<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="db2" scope="page" class="ck.ck" />
<jsp:useBean id="db" scope="page" class="ck.ck" />

<%
	String supplierid = new String(request.getParameter("supplierid"));
	String suppliername = new String(request.getParameter("suppliername"));
	String address = new String(request.getParameter("address"));
	String email = new String(request.getParameter("email"));
	String phone = new String(request.getParameter("phone"));
	String repu = new String(request.getParameter("repulevel"));

	String sql2 = "update Supplier set supplier_name = '" + suppliername + "', address = '" + address
			+ "', email = '" + email + "', phone = '" + phone + "', reputation_level = " + repu
			+ " where supplier_id = " + supplierid;

	db.executeUpdate(sql2);
	db.closeStmt();
	db.closeConn();	
	
%>
<html>
<head>
<title>无标题文档</title>
</head>

<body bgcolor="#FFFFFF" text="#000000" onLoad="load2()">
	<script language="JavaScript" type="text/JavaScript">
		function load2() {
			opener.setTimeout("submit01()", 15)
			self.setTimeout("exit()", 10)
		}
		function exit() {
			window.close()
		}
	</script>

</body>
</html>


