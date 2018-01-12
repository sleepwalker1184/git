
<%@ page contentType="text/html; charset=gb2312"%>
<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="db2" scope="page" class="ck.ck" />
<jsp:useBean id="db" scope="page" class="ck.ck" />

<%
	String oldma = new String(request.getParameter("oldma"));
	String supplierid = new String(request.getParameter("supplierid"));	
	String materialid = new String(request.getParameter("materialid"));
	String price = new String(request.getParameter("price"));
	

	
	String sql2 = "update Supply_product set material_id = " + materialid + ", price = " + price
			+ " where supplier_id =" + supplierid+" and material_id = "+oldma;	
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


