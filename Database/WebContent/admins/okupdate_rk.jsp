
<%@ page contentType="text/html; charset=gb2312"%>
<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="db2" scope="page" class="ck.ck" />
<jsp:useBean id="db1" scope="page" class="ck.ck" />

<%
	String areA = new String(request.getParameter("areA"));
	String areB = new String(request.getParameter("areB"));
	String orderid = new String(request.getParameter("orderid"));
	String materialid = new String(request.getParameter("materialid"));
	
	System.out.println("update storage_inf set store_position = '" + areA + "-" + areB + "' where order_id =" + orderid
			+ " and material_id = " + materialid);
	String sql1 = "update storage_inf set store_position = '" + areA + "-" + areB + "' where order_id =" + orderid
			+ " and material_id = " + materialid;
	db2.executeUpdate(sql1);
	
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
