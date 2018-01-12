<html>
<head>
<%@ page contentType="text/html; charset=gb2312"%>
<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="db" scope="page" class="ck.ck" />
<jsp:useBean id="db1" scope="page" class="ck.ck" />

<%
	String orderid = new String(request.getParameter("orderid"));
	String trans = new String(request.getParameter("trans"));
	String transs = new String(request.getParameter("transstatus"));
	String oldma = new String(request.getParameter("oldma"));
	String supplierid = new String(request.getParameter("supplierid"));

	String sql1 = "update purchase_inf set transport = '" + trans + "', transport_status = '" + transs
			+ "', supplier_id = " + supplierid + " where order_id = " + orderid + " and material_id = " + oldma;

	db.executeUpdate(sql1);
		
%>
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
