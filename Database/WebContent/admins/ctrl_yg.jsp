<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<html>
<head>
<title>�ޱ����ĵ�</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function confid() {
		if (confirm("")) {
			document.form1.submit();
		} else {
			return false;
		}
	}

	function kannewsdetail(supplierid) {
		c = "detail_yg.jsp?detail=" + supplierid;
		window
				.open(
						c,
						"bodykannews",
						"toolbar=no,status=no,scrollbars=yes,menubar=no,location=no,top=100,resizable=no,left=250,width=650,height=500")
	}

	function del(supplierid) {
		if (confirm("ȷ��Ҫɾ���˼�¼��?")) {
			document.querydb.action = "d_yg2.jsp?del=" + supplierid;
			document.querydb.submit();
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
									<td width="83%"><div align="center" class="STYLE5">����������</div></td>
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
																<td height="23" class="STYLE4"><a href="add_yg.jsp"
																	target="mainFrame">����������</a></td>
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
																	href="ctrl_yg.jsp" target="mainFrame">����������</a></td>
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
					id="db2" scope="page" class="ck.ck" />

				<form name="querydb" method="post" action="o_types.jsp"
					onsubmit="return isValid();">
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
												<span class="STYLE10">��Ӧ�̱��</span>
											</div></td>
										<td bgcolor="d3eaef" height="40"><div align="center">
												<span class="STYLE10">��Ӧ����</span>
											</div></td>
										<td bgcolor="d3eaef" height="40"><div align="center">
												<span class="STYLE10">�����ȼ�</span>
											</div></td>
										<td bgcolor="d3eaef" width="70" height="40"><div
												align="center">
												<span class="STYLE10">����</span>
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
												countrs = db1.executeQuery("select count(*) as num from Supplier");

												if (countrs.next())
													totalRec = countrs.getInt("num");
												countrs.close();
											} catch (Exception e) {
												e.printStackTrace();
											}
											int intPageCount = 0;
											intPageCount = (totalRec + pageLine - 1) / pageLine;

											String sql1 = "select * from Supplier order by supplier_id limit " + (intPage - 1) * 15 + "," + 15;
											ResultSet rs2 = db1.executeQuery(sql1);
											String suppliername = "", repulevel;
											int supplierid, repu;

											int s = 0;
											while (rs2.next()) {
												s++;
												supplierid = rs2.getInt("supplier_id");
												suppliername = rs2.getString("supplier_name");
												repu = rs2.getInt("reputation_level");
												switch (repu) {
												case 15: {
													repulevel = "A+";
													break;
												}
												case 14: {
													repulevel = "A";
													break;
												}
												case 13: {
													repulevel = "A-";
													break;
												}
												case 12: {
													repulevel = "B+";
													break;
												}
												case 11: {
													repulevel = "B";
													break;
												}
												case 10: {
													repulevel = "B-";
													break;
												}
												case 9: {
													repulevel = "C+";
													break;
												}
												case 8: {
													repulevel = "C";
													break;
												}
												case 7: {
													repulevel = "C-";
													break;
												}
												case 6: {
													repulevel = "D+";
													break;
												}
												case 5: {
													repulevel = "D";
													break;
												}
												case 4: {
													repulevel = "D-";
													break;
												}
												case 3: {
													repulevel = "E+";
													break;
												}
												case 2: {
													repulevel = "E";
													break;
												}
												case 1: {
													repulevel = "E-";
													break;
												}
												default: {
													repulevel = "F";
													break;
												}
												}
										%>
									
									<TR>
										<td bgcolor="#FFFFFF" align="center"><span
											class="STYLE10"><%=s%></span></td>
										<TD bgcolor="#FFFFFF" align="center"><span
											class="STYLE10"><%=supplierid%></span></TD>
										<TD bgcolor="#FFFFFF" align="center"><span
											class="STYLE10"><%=suppliername%></span></TD>
										<TD bgcolor="#FFFFFF" align="center"><span
											class="STYLE10"><%=repulevel%></span></TD>
										<td bgcolor="#FFFFFF" align="center"><a
											href="javascript:kannewsdetail('<%=supplierid%>')"
											class="ccc">����</a></td>
										<td bgcolor="#FFFFFF" align="center"><a
											HREF="javascript:del('<%=supplierid%>')">ɾ��</a></td>
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
 	out.print("<form method='post' name=fPageNum action='ctrl_yg.jsp'>");
 	if (intPage < 2)
 		out.print("��ҳ ��һҳ  ");
 	else {
 		out.print("<a href='ctrl_yg.jsp?page=1' ><font color='#3300FF' size='2'>��ҳ</font></a>&nbsp;");
 		out.print("<a href='ctrl_yg.jsp?page=" + (intPage - 1)
 				+ "' ><font color='#3300FF' size='2'>��һҳ</font></a>&nbsp; ");
 	}
 	if (intPage - intPageCount >= 0)
 		out.print("��һҳ βҳ");
 	else {
 		out.print("<a href='ctrl_yg.jsp?page=" + (intPage + 1)
 				+ "'><font color='#3300FF' size='2'>��һҳ</font></a>&nbsp;<a href='ctrl_yg.jsp?page="
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
