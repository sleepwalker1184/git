<html>
<head>
<%@ page contentType="text/html; charset=gb2312"%>
<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="db" scope="page" class="ck.ck" />
<%
	String orderid = new String(request.getParameter("orderid"));	
	String time = new String(request.getParameter("time"));

	
	String sql2 = " update base_order set deadline = '" + time + "' where order_id = " + orderid;
		
	db.executeUpdate(sql2);
	
	db.closeStmt();
	db.closeConn();
	
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
