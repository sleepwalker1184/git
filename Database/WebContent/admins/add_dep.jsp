<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<html>
<head>
<title>�ޱ����ĵ�</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function isValid() {
		var oq = document.form1.plan_code.value;
		var oq1 = document.form1.deadline.value
		if (oq == "") {
			alert("������ƻ���ţ�");
			document.form1.depname.focus();
			return false;
		}
		if (oq1 == "") {
			alert("�������ֹʱ�䣡");
			document.form1.depname.focus();
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
									<td width="83%"><div align="center" class="STYLE5">�����ƻ�</div></td>
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
																	href="add_dep.jsp" target="mainFrame">�����ƻ�</a></td>
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
																	href="ctrl_dep.jsp" target="mainFrame">�ƻ���ѯ</a></td>
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
 	String sql1 = "select * from base_material";
 	ResultSet rs1 = db1.executeQuery(sql1);
 	int materialid = 0;
 	String materialname = "";
 %>

				<form name="form1" method="post" action="o_dep.jsp"
					onsubmit="return isValid();">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="0">

						<tr>
							<td><table width="100%" border="0" cellpadding="5"
									cellspacing="1" bgcolor="#a8c7ce">
									<tr>
										<td colspan=4 bgcolor="d3eaef" height="40"><div
												align="center">
												<span class="STYLE10">��Ӽƻ�</span>
											</div></td>
									</tr>
									<tr>

										<td width="15%" bgcolor="#FFFFFF"><div align="right">
												<span class="STYLE10">�ƻ���ţ�</span>
											</div></td>
										<td bgcolor="#FFFFFF" colspan=3><div align="left">
												<input type="text" name="plan_code">
											</div></td>
									</tr>

									<tr>
										<td width="15%" bgcolor="#FFFFFF"><div align="right">
												<span class="STYLE10">��ֹʱ�䣺</span>
											</div></td>
										<td bgcolor="#FFFFFF" colspan=3><div align="left">
												<input type="text" name="deadline">
											</div></td>
									</tr>

									<tr>
										<td colspan=4 bgcolor="d3eaef" height="40"><div
												align="center">
												<span class="STYLE10">����ԭ��</span>
											</div></td>
									</tr>
									<%
										while (rs1.next()) {
											materialid = rs1.getInt("material_id");
											materialname = rs1.getString("material_name");
									%>
									<tr>
										<td width="15%" bgcolor="#FFFFFF"><div align="right">
												<span class="STYLE10"><%=materialname +": "%></span>
											</div></td>
										<td bgcolor="#FFFFFF"><div align="left">
												<input type="text" name=<%=materialid%> value ="">
											</div></td>
										<%
											if(rs1.next())
											{
												materialid =rs1.getInt("material_id");
												materialname = rs1.getString("material_name");
											} 
										%>
										<td width="15%" bgcolor="#FFFFFF"><div align="right">
												<span class="STYLE10"><%=materialname+":" %></span>
											</div></td>
										<td bgcolor="#FFFFFF"><div align="left">
												<input type="text" name=<%=materialid %> value = "">
											</div></td>
									</tr>
									<%
										}
									rs1.close();
									%>



									<tr>
										<td colspan=4 align="center" class="STYLE6" bgcolor="d3eaef">
											<input type="submit" value="����">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" value="����">
										</td>
									</tr>
								</table></td>
						</tr>
					</table>
				</form> <!--  end ����-->
			</td>
			<td width="8" bgcolor="#353c44">&nbsp;</td>
		</tr>
	</table>
</body>
</html>
