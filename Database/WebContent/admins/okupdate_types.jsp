
<%@ page contentType="text/html; charset=gb2312"%>
<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="db2" scope="page" class="ck.ck" />
<jsp:useBean id="db1" scope="page" class="ck.ck" />

<%
	String oldor = new String(request.getParameter("oldor"));
	String oldma = new String(request.getParameter("oldma"));
	String orderid = new String(request.getParameter("orderid"));
	String materialid = new String(request.getParameter("materialid"));
	String supplierid = new String(request.getParameter("supplierid"));
	
	String sql2 = "update quality_test set order_id = " + orderid + ", material_id =" + materialid
			+ ",supplier_id =" + supplierid+" where order_id = "+oldor+" and material_id ="+oldma;

	db2.executeUpdate(sql2);
	
%>
<html>
<head>
<title>�ޱ����ĵ�</title>
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

