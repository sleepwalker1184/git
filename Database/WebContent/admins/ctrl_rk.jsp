<%@page import="com.sun.prism.Material"%>
<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<html>
<head>
<title>无标题文档</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function kark(a) {
		c = "kark.jsp?rec_id=" + a;
		window
				.open(
						c,
						"bodykannews",
						"toolbar=no,status=no,scrollbars=yes,menubar=no,location=no,top=100,resizable=no,left=250,width=650,height=430")
	}

	function detail(orderid, materialid) {
		c = "update_rk.jsp?detail=" + orderid + "&detail2=" + materialid;
		window
				.open(
						c,
						"bodyt31f",
						"toolbar=no,status=no,scrollbars=yes,menubar=no,location=no,top=190,resizable=no,left=250,width=750,height=400")
	}

	function del(orderid, materialid) {
		if (confirm("确定要删除此库存信息吗 ?")) {
			document.forma.action = "d_rk.jsp?del=" + orderid + "&del2="
					+ materialid;
			document.forma.submit();
		}
	}
	function submit01() {
		self.location.replace("ctrl_rk.jsp")
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
									<td width="83%"><div align="center" class="STYLE5">库存状况</div></td>
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
																<td height="23" class="STYLE4"><a href="add_rk.jsp"
																	target="mainFrame">新增货物入库</a></td>
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
																	href="ctrl_rk.jsp" target="mainFrame">库存状况</a></td>
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
 	String sql0 = "select * from base_material";
 	String sql1 = "select * from base_order";
 	ResultSet rs0 = db1.executeQuery(sql0);
 	ResultSet rs1 = db1.executeQuery(sql1);
 	int searchmaid = 0, searchorid = 0;
 	String searchmaname = "";
 	int s = 0;

 	String temorid = null;
 	if (request.getParameter("searchorid") != null) {
 		temorid = request.getParameter("searchorid");
 	}

 	String temmaid = null;
 	if (request.getParameter("searchmaid") != null) {
 		temmaid = request.getParameter("searchmaid");
 	}

 	String temareA = null;
 	if (request.getParameter("areA") != null) {
 		temareA = request.getParameter("areA");
 	}

 	String temareB = null;
 	if (request.getParameter("areB") != null) {
 		temareB = request.getParameter("areB");
 	}

 	if (temorid == null)
 		temorid = (String) session.getAttribute("temorid");

 	if (temmaid == null)
 		temmaid = (String) session.getAttribute("temmaid");

 	if (temareA == null)
 		temareA = (String) session.getAttribute("temareA");

 	if (temareB == null)
 		temareB = (String) session.getAttribute("temareB");

 	if (temorid == null || temmaid == null || temareA == null || temareB == null) {
 		temareA = "";
 		temareB = "";
 		temmaid = "";
 		temorid = "";
 	}

 	session.putValue("temareA", temareA);
 	session.putValue("temareB", temareB);
 	session.putValue("temmaid", temmaid);
 	session.putValue("temorid", temorid);
 %> <span class="STYLE10">

					<form name="forma" method="post" action="ctrl_rk.jsp">
						&nbsp;&nbsp; 原料名称：<select name="searchmaid">
							<option value="">请选择..</option>
							<%
								while (rs0.next()) {
									searchmaid = rs0.getInt("material_id");
									searchmaname = rs0.getString("material_name");
							%>
							<option value="<%=searchmaid%>"><%=searchmaname%></option>
							<%
								}
								rs0.close();
							%>
						</select>&nbsp;&nbsp; 计划编号： <select name="searchorid">
							<option value="">请选择..</option>
							<%
								while (rs1.next()) {
									searchorid = rs1.getInt("order_id");
							%>
							<option value="<%=searchorid%>"><%=searchorid%></option>
							<%
								}
								rs1.close();
							%>
						</select>&nbsp;&nbsp; 区：<select name="areA">
							<option value="">请选择..</option>
							<option value="A"><%="A"%></option>
							<option value="B"><%="B"%></option>
							<option value="C"><%="C"%></option>
							<option value="D"><%="D"%></option>
							<option value="E"><%="E"%></option>
						</select>&nbsp;&nbsp; 柜：<select name="areB">
							<option value="">请选择..</option>
							<option value="1"><%="1"%></option>
							<option value="2"><%="2"%></option>
							<option value="3"><%="3"%></option>
							<option value="4"><%="4"%></option>
							<option value="5"><%="5"%></option>
						</select>&nbsp;&nbsp; &nbsp;&nbsp; <input type="submit" value="查询"><br>
						<br>

						<table width="100%" border="0" align="center" cellpadding="0"
							cellspacing="0">

							<tr>
								<td><table width="100%" border="0" cellpadding="5"
										cellspacing="1" bgcolor="#a8c7ce">
										<tr>
											<td width="30" bgcolor="d3eaef"><span class="STYLE10">序号</span></td>
											<td align="center" bgcolor="d3eaef"><span
												class="STYLE10">原料编号</span></td>
											<td align="center" bgcolor="d3eaef"><span
												class="STYLE10">原料名称</span></td>
											<td align="center" bgcolor="d3eaef"><span
												class="STYLE10">库存数量</span></td>
											<td align="center" bgcolor="d3eaef"><span
												class="STYLE10">所属计划编号</span></td>
											<td align="center" bgcolor="d3eaef"><span
												class="STYLE10">存放区</span></td>
											<td align="center" bgcolor="d3eaef"><span
												class="STYLE10">存放柜</span></td>
											<td align="center" bgcolor="d3eaef"><span
												class="STYLE10">入库时间</span></td>
											<td align="center" bgcolor="d3eaef" width="40"><span
												class="STYLE10">修改</span></td>
											<td align="center" bgcolor="d3eaef" width="40"><span
												class="STYLE10">删除</span></td>
										</tr>
										<%
											int intPageCount = 0;
											int materialid, num, orderid;
											String materialname = "", area = "", time = "";
											char areaA, areaB;
											area = temareA + "-" + temareB;
											int pageLine = 15;
											int totalRec = 0;
											int intPage = 1;
											int i;
											if (request.getParameter("page") != null)
												intPage = Integer.parseInt(request.getParameter("page"));
											try {
												ResultSet countrs = null;
												countrs = db1.executeQuery("select count(*) as num from store_detail where order_id like '%" + temorid
														+ "%' and material_id like '%" + temmaid + "%' and store_position like '%" + area + "%'");

												if (countrs.next())
													totalRec = countrs.getInt("num");
												countrs.close();
											} catch (Exception e) {
												e.printStackTrace();
											}
											intPageCount = (totalRec + pageLine - 1) / pageLine;

											String sql2 = "select * from store_detail where order_id like '%" + temorid + "%' and material_id like '%"
													+ temmaid + "%' and store_position like '%" + area + "%' order by order_id limit "
													+ (intPage - 1) * 15 + "," + 15;

											ResultSet rs2 = db1.executeQuery(sql2);

											while (rs2.next()) {
												s++;
												materialid = rs2.getInt("material_id");
												materialname = rs2.getString("material_name");
												num = rs2.getInt("number");
												orderid = rs2.getInt("order_id");
												area = rs2.getString("store_position");
												time = rs2.getString("instore_time");
												areaA = area.charAt(0);
												areaB = area.charAt(2);
										%>
										<TR>
											<TD bgcolor="#FFFFFF" align="center"><span
												class="STYLE10"><%=s%></span></TD>
											<TD bgcolor="#FFFFFF" align="center"><span
												class="STYLE10"><%=materialid%></span></TD>
											<TD bgcolor="#FFFFFF" align="center"><span
												class="STYLE10"><%=materialname%></span></TD>
											<TD bgcolor="#FFFFFF" align="center"><span
												class="STYLE10"><%=num%></span></TD>
											<TD bgcolor="#FFFFFF" align="center"><span
												class="STYLE10"><%=orderid%></span></TD>
											<TD bgcolor="#FFFFFF" align="center"><span
												class="STYLE10"><%=areaA%></span></TD>
											<TD bgcolor="#FFFFFF" align="center"><span
												class="STYLE10"><%=areaB%></span></TD>
											<TD bgcolor="#FFFFFF" align="center"><span
												class="STYLE10"><%=time.substring(0, 10)%></span></TD>

											<td bgcolor="#FFFFFF" align="center"><a
												href="javascript:detail('<%=orderid%>','<%=materialid%>');"
												class="ccc">修改</span></a></td>
											<td bgcolor="#FFFFFF" align="center"><a
												HREF="javascript:del('<%=orderid%>','<%=materialid%>')">删除</span></span></a></td>

										</TR>
										<%
											}
											rs2.close();
										%>

									</table></td>
							</tr>
						</table>
					</form> <font size="2"> <%
 	out.print("<center><table " + "width=600 " + " valign=bottom>");
 	out.print("<tr>");
 	if (intPageCount * pageLine < totalRec)
 		intPageCount++;
 	if (intPage > intPageCount)
 		intPage = intPageCount;
 	if (intPage < 1)
 		intPage = 1;
 	out.print("<form method='post' name=fPageNum action='ctrl_rk.jsp'>");
 	if (intPage < 2)
 		out.print("首页 上一页  ");
 	else {
 		out.print("<a href='ctrl_rk.jsp?page=1' ><font color='#3300FF' size='2'>首页</font></a>&nbsp;");
 		out.print("<a href='ctrl_rk.jsp?page=" + (intPage - 1)
 				+ "' ><font color='#3300FF' size='2'>上一页</font></a>&nbsp; ");
 	}
 	if (intPage - intPageCount >= 0)
 		out.print("下一页 尾页");
 	else {
 		out.print("<a href='ctrl_rk.jsp?page=" + (intPage + 1)
 				+ "'><font color='#3300FF' size='2'>下一页</font></a>&nbsp;<a href='ctrl_rk.jsp?page="
 				+ intPageCount + "'><font color='#3300FF' size='2'>尾页</font></a>&nbsp;");
 	}
 	out.print(" 页次:<font color=red>" + intPage + "</font>/<font color=red>" + intPageCount + "</font>页 ");
 	out.print("共<font color=red>" + totalRec + "</font>条记录  <font color=red>" + pageLine + "</font>条/页");
 	out.print(
 			"  转到第<input type='text' name='page' size=2 maxlength=10  class=smallInput value=" + intPage + ">");
 	out.print("页<input class=buttonface type='submit' value='GO' name='cndok'></span></p></form>");
 	out.print("</tr>");
 	out.print("</table></center>");
 %> 
				</FONT> <!--  end 主区-->
			</td>
			<td width="8" bgcolor="#353c44">&nbsp;</td>
		</tr>
	</table>
</body>
</html>
