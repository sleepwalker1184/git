<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<html>
<head>
<title>�ޱ����ĵ�</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function del(orderid, materialid) {
		if (confirm("ȷ��Ҫɾ���˼�¼�� ?")) {
			document.querydb.action = "d_types.jsp?del=" + orderid + "&del2="
					+ materialid;
			document.querydb.submit();
		}
	}

	function detail(orderid, materialid) {
		c = "update_types.jsp?detail=" + orderid + "&detail2=" + materialid;
		window
				.open(
						c,
						"bodyt31f",
						"toolbar=no,status=no,scrollbars=yes,menubar=no,location=no,top=190,resizable=no,left=250,width=540,height=400")
	}
	function submit01() {
		self.location.replace("ctrl_types.jsp")
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
									<td width="83%"><div align="center" class="STYLE5">�ʼ챨��</div></td>
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
																	href="add_types.jsp" target="mainFrame">�����ʼ챨��</a></td>
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
																	href="ctrl_types.jsp" target="mainFrame">�ʼ첻�ϸ��¼</a></td>
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
									<td width="76%" valign="bottom"><span class="STYLE3">ԭ���ϲɹ�����ϵͳ</span></td>
								</tr>
							</table></td>
					</tr>
				</table> <!-- ================ -->
			</td>
			<td width="10" bgcolor="#add2da">&nbsp;</td>
			<td valign="top">
				<!--========================== ���� =================================-->
				<jsp:useBean id="db1" scope="page" class="ck.ck" /> <jsp:useBean
					id="db2" scope="page" class="ck.ck" /> <%
 	String sql3 = "select * from base_order";
 	ResultSet rs3 = db1.executeQuery(sql3);
 	String sql4 = "select * from base_material";
 	ResultSet rs4 = db1.executeQuery(sql4);
 	String sql5 = "select * from Supplier";
 	ResultSet rs5 = db1.executeQuery(sql5);

 	int searchmaid = 0, searchorid = 0, searchsuid;
 	String searchmaname = "", searchsuname = "";

 	String temorid = null;
 	if (request.getParameter("searchorid") != null) {
 		temorid = request.getParameter("searchorid");
 	}

 	String temmaid = null;
 	if (request.getParameter("searchmaid") != null) {
 		temmaid = request.getParameter("searchmaid");
 	}
 	String temsuid = null;
 	if (request.getParameter("searchsuid") != null) {
 		temsuid = request.getParameter("searchsuid");
 	}

 	if (temorid == null)
 		temorid = (String) session.getAttribute("temorid");

 	if (temmaid == null)
 		temmaid = (String) session.getAttribute("temmaid");

 	if (temsuid == null)
 		temsuid = (String) session.getAttribute("temsuid");

 	if (temorid == null || temmaid == null || temsuid == null) {
 		temmaid = "";
 		temorid = "";
 		temsuid = "";
 	}
 	session.putValue("temmaid", temmaid);
 	session.putValue("temorid", temorid);
 	session.putValue("temsuid", temsuid);
 %>

				<form name="querydb" method="post" action="ctrl_types.jsp"
					onsubmit="return isValid();">
					&nbsp;&nbsp; ԭ�����ƣ�<select name="searchmaid">
						<option value="">��ѡ��..</option>
						<%
							while (rs4.next()) {
								searchmaid = rs4.getInt("material_id");
								searchmaname = rs4.getString("material_name");
						%>
						<option value="<%=searchmaid%>"><%=searchmaname%></option>
						<%
							}
							rs4.close();
						%>
					</select>&nbsp;&nbsp; ��Ӧ�̣� <select name="searchsuid">
						<option value="">��ѡ��..</option>
						<%
							while (rs5.next()) {
								searchsuid = rs5.getInt("supplier_id");
								searchsuname = rs5.getString("supplier_name");
						%>
						<option value="<%=searchsuid%>"><%=searchsuname%></option>
						<%
							}
							rs5.close();
						%>
					</select>&nbsp;&nbsp;�ƻ���ţ� <select name="searchorid">
						<option value="">��ѡ��..</option>
						<%
							while (rs3.next()) {
								searchorid = rs3.getInt("order_id");
						%>
						<option value="<%=searchorid%>"><%=searchorid%></option>
						<%
							}
							rs3.close();
						%>
					</select>&nbsp;&nbsp;<input type="submit" value="��ѯ"><br> <br>

					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="0">

						<tr>
							<td><table width="100%" border="0" cellpadding="5"
									cellspacing="1" bgcolor="#a8c7ce">
									<tr>
										<td bgcolor="d3eaef" width="30" height="40"><div
												align="center">
												<span class="STYLE10">���</span>
											</div></td>
										<td bgcolor="d3eaef" height="40"><div align="center">
												<span class="STYLE10">ԭ�����</span>
											</div></td>
										<td bgcolor="d3eaef" height="40"><div align="center">
												<span class="STYLE10">ԭ����</span>
											</div></td>
										<td bgcolor="d3eaef" height="40"><div align="center">
												<span class="STYLE10">��Ӧ��</span>
											</div></td>
										<td bgcolor="d3eaef" height="40"><div align="center">
												<span class="STYLE10">�����ƻ����</span>
											</div></td>
										<td bgcolor="d3eaef" width="70" height="40"><div
												align="center">
												<span class="STYLE10">�޸�</span>
											</div></td>
										<td bgcolor="d3eaef" width="70" height="40"><div
												align="center">
												<span class="STYLE10">ɾ��</span>
											</div></td>
									</tr>
									<tr>

										<%
											int pageLine = 15;
											int totalRec = 0;
											int intPage = 1;
											int i;
											if (request.getParameter("page") != null)
												intPage = Integer.parseInt(request.getParameter("page"));
											try {
												ResultSet countrs = null;
												countrs = db1.executeQuery("select count(*) as num from return_detail where order_id like '%" + temorid
														+ "%' and material_id like '%" + temmaid + "%' and supplier_id like '%" + temsuid + "%'");

												if (countrs.next())
													totalRec = countrs.getInt("num");
												countrs.close();
											} catch (Exception e) {
												e.printStackTrace();
											}
											int intPageCount = 0;
											intPageCount = (totalRec + pageLine - 1) / pageLine;

											String sql1 = "select * from return_detail where order_id like '%" + temorid + "%' and material_id like '%"
													+ temmaid + "%' and supplier_id like '%" + temsuid + "%' order by order_id limit "
													+ (intPage - 1) * 15 + "," + 15;
											ResultSet rs2 = db1.executeQuery(sql1);
											String materialname = "", supplier = "";
											int materialid, orderid;
											String remark = "";
											String add_time = "";
											int rec_id = 0;
											int s = 0;
											while (rs2.next()) {
												s++;
												materialid = rs2.getInt("material_id");
												materialname = rs2.getString("material_name");
												supplier = rs2.getString("supplier_name");
												orderid = rs2.getInt("order_id");

												if (remark.equals(""))
													remark = "&nbsp;";
										%>
									
									<TR>
										<td bgcolor="#FFFFFF" align="center"><span
											class="STYLE10"><%=s%></span></td>
										<TD bgcolor="#FFFFFF" align="center"><span
											class="STYLE10"><%=materialid%></span></TD>
										<TD bgcolor="#FFFFFF" align="center"><span
											class="STYLE10"><%=materialname%></span></TD>
										<TD bgcolor="#FFFFFF" align="center"><span
											class="STYLE10"><%=supplier%></span></TD>
										<TD bgcolor="#FFFFFF" align="center"><span
											class="STYLE10"><%=orderid%></span></TD>
										<td bgcolor="#FFFFFF" align="center"><a
											href="javascript:detail('<%=orderid%>','<%=materialid%>');"
											class="ccc">�޸�</a></td>
										<td bgcolor="#FFFFFF" align="center"><a
											HREF="javascript:del('<%=orderid%>','<%=materialid%>')">ɾ��</a></td>

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
 	out.print("<form method='post' name=fPageNum action='ctrl_types.jsp'>");
 	if (intPage < 2)
 		out.print("��ҳ ��һҳ  ");
 	else {
 		out.print("<a href='ctrl_types.jsp?page=1' ><font color='#3300FF' size='2'>��ҳ</font></a>&nbsp;");
 		out.print("<a href='ctrl_types.jsp?page=" + (intPage - 1)
 				+ "' ><font color='#3300FF' size='2'>��һҳ</font></a>&nbsp; ");
 	}
 	if (intPage - intPageCount >= 0)
 		out.print("��һҳ βҳ");
 	else {
 		out.print("<a href='ctrl_types.jsp?page=" + (intPage + 1)
 				+ "'><font color='#3300FF' size='2'>��һҳ</font></a>&nbsp;<a href='ctrl_types.jsp?page="
 				+ intPageCount + "'><font color='#3300FF' size='2'>βҳ</font></a>&nbsp;");
 	}
 	out.print(" ҳ��:<font color=red>" + intPage + "</font>/<font color=red>" + intPageCount + "</font>ҳ ");
 	out.print("��<font color=red>" + totalRec + "</font>����¼  <font color=red>" + pageLine + "</font>��/ҳ");
 	out.print(
 			"  ת����<input type='text' name='page' size=2 maxlength=10  class=smallInput value=" + intPage + ">");
 	out.print("ҳ<input class=buttonface type='submit' value='GO' name='cndok'></span></p></form>");
 	out.print("</tr>");
 	out.print("</table></center>");
 %> 
			</FONT> <!--  end ����-->
			</td>
			<td width="8" bgcolor="#353c44">&nbsp;</td>
		</tr>
	</table>
</body>
</html>