<%@page import="java.lang.String"%>
<%-- <%@page import="com.sun.org.apache.xpath.internal.operations.String"%> --%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<html>
<head>
<title>无标题文档</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
	
// -->
</SCRIPT>
<style type="text/css">
<!--
a:link {
	font-size: 12px;
	color: #FF0000;
	text-decoration: none;
}

a:visited {
	font-size: 12px;
	color: #FF0000;
	text-decoration: none;
}

a:hover {
	font-size: 12px;
	color: #FF0000;
	text-decoration: underline;
}

a:active {
	font-size: 12px;
	color: #FF0000;
	text-decoration: none;
}

body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	overflow: hidden;
}

.STYLE1 {
	color: #e1e2e3;
	font-size: 12px;
}

.STYLE6 {
	color: #000000;
	font-size: 12;
}

.STYLE10 {
	color: #000000;
	font-size: 12px;
}

.STYLE19 {
	color: #344b50;
	font-size: 12px;
}

.STYLE21 {
	font-size: 12px;
	color: #3b6375;
}

.STYLE22 {
	font-size: 12px;
	color: #295568;
}

.STYLE3 {
	font-size: 12px;
	color: #435255;
}

.STYLE4 {
	font-size: 12px
}

.STYLE5 {
	font-size: 12px;
	font-weight: bold;
}
-->
</style>
</head>

<body>
	<table width="100%" height="100%" border="0" cellspacing="0"
		cellpadding="0">
		<tr>
			<td width="8" bgcolor="#353c44">&nbsp;</td>
			<td width="147" valign="top">
				<!-- ================ -->
				<table width="147" height="100%" border="0" align="center"
					cellpadding="0" cellspacing="0">
					<tr>
						<td height="23" background="images/main_34.gif"><table
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="9%">&nbsp;</td>
									<td width="83%"><div align="center" class="STYLE5">新增计划</div></td>
									<td width="8%">&nbsp;</td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td valign="top"><div align="center">
								<table width="82%" border="0" align="center" cellpadding="0"
									cellspacing="0">
									<tr>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td height="38"><table width="100%" border="0"
												cellspacing="0" cellpadding="0">
												<tr>
													<td width="33" height="28"><img
														src="images/main_46.gif" width="28" height="28"></td>
													<td width="99"><table width="100%" border="0"
															cellspacing="0" cellpadding="0">
															<tr>
																<td height="23" class="STYLE4"><a
																	href="add_dep.jsp" target="mainFrame">新增计划</a></td>
															</tr>
														</table></td>
												</tr>
											</table></td>
									</tr>
									<tr>
										<td height="38"><table width="100%" border="0"
												cellspacing="0" cellpadding="0">
												<tr>
													<td width="33" height="28"><img
														src="images/main_52.gif" width="28" height="28"></td>
													<td width="99"><table width="100%" border="0"
															cellspacing="0" cellpadding="0">
															<tr>
																<td height="23" class="STYLE4"><a
																	href="ctrl_dep.jsp" target="mainFrame">计划查询</a></td>
															</tr>
														</table></td>
												</tr>
											</table></td>
									</tr>
									<tr>
										<td height="38">&nbsp;</td>
									</tr>
								</table>
							</div></td>
					</tr>

					<tr>
						<td height="19" background="images/main_69.gif"><table
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="24%">&nbsp;</td>
									<td width="76%" valign="bottom"><span class="STYLE3">原材料采购管理系统</span></td>
								</tr>
							</table></td>
					</tr>
				</table> <!-- ================ -->
			</td>
			<td width="10" bgcolor="#add2da">&nbsp;</td>
			<td valign="top">
				<!--========================== 主区 =================================-->
				<jsp:useBean id="db1" scope="page" class="ck.ck" /> <jsp:useBean
					id="db2" scope="page" class="ck.ck" /> <%
 	String plan_code = new String(request.getParameter("plan_code"));
 	String deadline = new String(request.getParameter("deadline"));

 	String sql11 = "select * from base_order where order_id = " + plan_code;
 	ResultSet rs11 = db1.executeQuery(sql11);
 	if (!(rs11.next())) {
 		String sql12 = "insert into base_order(order_id,deadline) values(" + plan_code + ",'" + deadline + "')";
 		db2.executeUpdate(sql12);
 	}

 	/* ArrayList vector = new ArrayList();
 	ArrayList vector1 = new ArrayList();
 	ArrayList vector2 = new ArrayList();
 	ArrayList vector3 = new ArrayList();
 	String sqlma = "select * from base_material";
 	String tem = "";
 	ResultSet rsma = db1.executeQuery(sqlma);
 	String basema = "";
 	while (rsma.next()) {
 		basema = rsma.getString("material_name");
 		vector.add(basema);
 		basema = rsma.getString("material_id");
 		vector1.add(basema);
 	}
 	for (int i = 0; i < vector.size(); i++) {
 		tem = new String(request.getParameter(vector.get(i).toString()));
 		if (tem != "") {
 			vector2.add(tem);
 			tem = vector1.get(i).toString();
 			vector3.add(tem);
 		}
 		tem = "";
 	} 
 	
 	for (int i = 0; i < vector2.size(); i++) {
 		String sql13 = "insert into Produceplan (order_id,material_id,number) values(" + plan_code + ","
 				+ vector3.get(i).toString() +","+vector2.get(i).toString()+ ")";
 		db2.executeUpdate(sql13);
 	}*/

 	String sql1 = "select * from base_material";
 	ResultSet rs1 = db1.executeQuery(sql1);
 	int materialid = 0;
 	while (rs1.next()) {
 		materialid = rs1.getInt("material_id");
 		String number = new String(request.getParameter(String.valueOf(materialid)));
 		if (number != "") {
 			String sql2 = "insert into Produceplan (order_id,material_id,number) values(" + plan_code + ", "
 					+ materialid + ", " + number + ")";
 			db1.executeUpdate(sql2);
 		}
 	}
 %> <br> <br> <br> <br> <script>
		window.alert("添加成功!");
		self.setTimeout("exit()", 1)
		function exit() {
			document.papf.action = "add_dep.jsp";
			document.papf.submit();
		}
	</script>

				<form action="add_dep.jsp" method="post" name="papf"></form> &nbsp;
				<!--  end 主区-->
			</td>
			<td width="8" bgcolor="#353c44">&nbsp;</td>
		</tr>
	</table>
</body>
</html>
