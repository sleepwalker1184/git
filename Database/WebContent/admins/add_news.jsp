<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<html>
<head>
<title>无标题文档</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function isValid() {
		var oq = document.forma.material.value;
		var oq3 = document.forma.plan_code.value;
		var oq2 = document.forma.supply.value;
		var oq4 = document.forma.number.value;
		var oq5 = document.forma.totalprice.value;

		if (oq == "") {
			alert("原料编号为空");
			document.forma.title.focus();
			return false;
		} else if (oq3 == "") {
			alert("计划编号为空");
			document.forma.news.focus();
			return false;
		} else if (oq2 == "") {
			alert("供应商为空");
			document.forma.dep.focus();
			return false;
		} else if (oq4 == "") {
			alert("数量为空");
			document.forma.dep.focus();
			return false;
		} else if (oq5 == "") {
			alert("总价为空");
			document.forma.dep.focus();
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
									<td width="83%"><div align="center" class="STYLE5">新增采购记录</div></td>
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
																	href="add_news.jsp" target="mainFrame">新增采购记录</a></td>
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
																	href="ctrl_news.jsp" target="mainFrame">采购记录</a></td>
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
 	String sql1 = "select * from base_material";
 	String sql2 = "select * from base_order";
 	String sql3 = "select * from supplier";
 	ResultSet rs1 = db1.executeQuery(sql1);
 	ResultSet rs2 = db1.executeQuery(sql2);
 	ResultSet rs3 = db1.executeQuery(sql3);
 	String materialname = "", suppliername = "", transway = "";
 	int orderid, materialid, supplierid, s1 = 0, s2 = 0, s3 = 0;
 %>
				<form name="forma" method="post" action="o_news.jsp"
					onsubmit="return isValid();">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="0">

						<tr>
							<td><table width="100%" border="0" cellpadding="5"
									cellspacing="1" bgcolor="#a8c7ce">
									<tr>
										<td colspan=6 bgcolor="d3eaef" height="40"><div
												align="center">
												<span class="STYLE10">新增采购记录</span>
											</div></td>
									</tr>
									<tr>
										<td align="right" width="5%" bgcolor="#FFFFFF"><span
											class="STYLE10">计划编号:</span></td>
										<td align="left" bgcolor="#FFFFFF" width="15%"><select name="orderid">
												<option value="">请选择</option>
												<%
													while (rs2.next()) {
														s2++;
														orderid = rs2.getInt("order_id");
												%>>
												<option value="<%=orderid%>"><%=orderid%></option>
												<%
													}
													rs2.close();
												%>>
										</select></td>
										<td align="right" width="5%" bgcolor="#FFFFFF"><span
											class="STYLE10">原料:</span></td>
										<td align="left" bgcolor="#FFFFFF" width=15%><select
											name="materialid">
												<option value="">请选择</option>
												<%
													while (rs1.next()) {
														s1++;
														materialid = rs1.getInt("material_id");
														materialname = rs1.getString("material_name");
												%>>
												<option value="<%=materialid%>"><%=materialid + ": " + materialname%></option>
												<%
													}
													rs1.close();
												%>>
										</select></td>

									</tr>
									<tr>
										<td align="right" width="5%" bgcolor="#FFFFFF"><span
											class="STYLE10">供应商:</span></td>
										<td align="left" bgcolor="#FFFFFF" width="15"><select
											name="supplierid">
												<option value="">请选择</option>
												<%
													while (rs3.next()) {
														s3++;
														supplierid = rs3.getInt("supplier_id");
														suppliername = rs3.getString("supplier_name");
												%>>
												<option value="<%=supplierid%>"><%=supplierid + ": " + suppliername%></option>
												<%
													}
												rs3.close();
												%>
										</select></td>
										<td align="right" width="5%" bgcolor="#FFFFFF"><span
											class="STYLE10">运输方式:</span></td>
										<td align="left" bgcolor="#FFFFFF"><select name="trans">
												<option value="">请选择</option>

												<option value="<%="car"%>"><%="car"%></option>
												<option value="<%="plane"%>"><%="plane"%></option>
												<option value="<%="ship"%>"><%="ship"%></option>
												<option value="<%="train"%>"><%="train"%></option>
												<option value="<%="truck"%>"><%="truck"%></option>
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
