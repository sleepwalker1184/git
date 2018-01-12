
<%@ page contentType="text/html; charset=gb2312"%>
<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="db2" scope="page" class="ck.ck" />
<jsp:useBean id="db" scope="page" class="ck.ck" />

<%
	String orderid = new String(request.getParameter("orderid"));
	String materialid = new String(request.getParameter("materialid"));
	String num = new String(request.getParameter("num"));
	String oldma = new String(request.getParameter("oldma"));

	String sql2 = "update Produceplan set material_id = " + materialid + ", number = " + num
			+ " where order_id =" + orderid +" and material_id ="+oldma;
	System.out.println(sql2);

	db.executeUpdate(sql2);
		
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


