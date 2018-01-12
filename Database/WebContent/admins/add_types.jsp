<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<html>
<head>
<title>无标题文档</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function isValid() {
		var oq = document.form1.typename.value;
		if (oq == "") {
			alert("请输入货品类别名称！");
			document.form1.typename.focus();
			return false;
		}
	}
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
									<td width="83%"><div align="center" class="STYLE5">质检报告</div></td>
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
																	href="add_types.jsp" target="mainFrame">新增质检报告</a></td>
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
																	href="ctrl_types.jsp" target="mainFrame">质检不合格记录</a></td>
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
 	String sql1 = "select * from base_order";
 	String sql2 = "select * from base_material";
 	String sql3 = "select * from Supplier";
 	ResultSet rs1 = db1.executeQuery(sql1);
 	ResultSet rs2 = db1.executeQuery(sql2);
 	ResultSet rs3 = db1.executeQuery(sql3);
 	int orderid, materialid, supplierid;
 	String materialname = "", suppliername = "";
 %>

				<form name="form1" method="post" action="o_types.jsp"
					onsubmit="return isValid();">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="0">

						<tr>
							<td><table width="100%" border="0" cellpadding="5"
									cellspacing="1" bgcolor="#a8c7ce">
									<tr>
										<td colspan=6 bgcolor="d3eaef" height="40"><div
												align="center">
												<span class="STYLE10">新增质检报告</span>
											</div></td>
									</tr>

									<tr>
										<td width="10%" bgcolor="#FFFFFF"><div align="left">
												<span class="STYLE10">所属计划编号：</span>
											</div></td>
										<td align="left" bgcolor="#FFFFFF"><select name="orderid">
												<option value="">请选择</option>
												<%
													while (rs1.next()) {
														orderid = rs1.getInt("order_id");
												%>
												<option value="<%=orderid%>"><%=orderid%></option>
												<%
													}
													rs1.close();
												%>
										</select></td>																	
									</tr>
									
									<tr>
									<td width="10%" bgcolor="#FFFFFF"><div align="left">
												<span class="STYLE10">原料：</span>
											</div></td>
										<td align="left" bgcolor="#FFFFFF"><select
											name="materialid">
												<option value="">请选择</option>
												<%
													while (rs2.next()) {
														materialid = rs2.getInt("material_id");
														materialname = rs2.getString("material_name");
												%>
												<option value="<%=materialid%>"><%=materialname%></option>
												<%
													}
													rs2.close();
												%>
										</select></td>
									</tr>
									<tr>
									
									<td width="10%" bgcolor="#FFFFFF"><div align="left">
												<span class="STYLE10">供应商：</span>
											</div></td>
										<td align="left" bgcolor="#FFFFFF"><select
											name="supplierid">
												<option value="">请选择</option>
												<%
													while (rs3.next()) {
														supplierid = rs3.getInt("supplier_id");
														suppliername = rs3.getString("supplier_name");
												%>
												<option value="<%=supplierid%>"><%=suppliername%></option>
												<%
													}
													rs3.close();
												%>
										</select></td>
									</tr>

									<tr>
										<td colspan=6 align="center" class="STYLE6" bgcolor="d3eaef">
											<input type="submit" value="保存">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" value="重置">
										</td>
									</tr>
								</table></td>
						</tr>
					</table>
					
				</form> <!--  end 主区-->
			</td>
			<td width="8" bgcolor="#353c44">&nbsp;</td>
		</tr>
	</table>
</body>
</html>
