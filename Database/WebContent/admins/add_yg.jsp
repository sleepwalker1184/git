<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<html>
<head>
<title>�ޱ����ĵ�</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function isValid() {
		var bq = document.form1.supplierid.value;
		var oq1 = document.form1.wpswd1.value;
		var oq2 = document.form1.wpswd2.value;
		var oq3 = document.form1.tdep.value;

		if (oq != "") {
			if (oq1 != "") {
				if (oq2 != "") {
					if (oq1 != oq2) {
						alert("������������룬��һ����");
						document.form1.wpswd1.focus();
						return false;
					}
				} else {
					alert("������ȷ������");
					document.form1.wpswd2.focus();
					return false;
				}

			} else {
				alert("���������룡");
				document.form1.wpswd1.focus();
				return false;
			}
		} else {
			alert("������Ա����ţ�");
			document.form1.wnum.focus();
			return false;
		}

		if (bq == "") {
			alert("���빩Ӧ�̱��!");
			document.form1.tname.focus();
			return false;
		}
		if (oq3 == "") {
			alert("��ѡ�������������ţ�");
			document.form1.tdep.focus();
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
									<td width="76%" valign="bottom"><span class="STYLE3">������ϵͳ</span></td>
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
 	String sql1 = "select * from base_material ";
 	ResultSet rs1 = db1.executeQuery(sql1); 	
 	String materialname = "",suppliernam ="";
 	int materialid,supplierid;
 	int s = 0;
 %>
				<form name="form1" method="post" action="o_yg.jsp"
					onsubmit="return isValid();">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="0">

						<tr>
							<td><table width="100%" border="0" cellpadding="5"
									cellspacing="1" bgcolor="#a8c7ce">
									<tr>
										<td colspan=4 bgcolor="d3eaef" height="40"><div
												align="center">
												<span class="STYLE10">����������</span>
											</div></td>
									</tr>
									<tr>
										<td width="15%" bgcolor="#FFFFFF"><div align="right">
												<span class="STYLE10">�����̱��:</span>
											</div></td>
										<td bgcolor="#FFFFFF" width="10%"><div align="left">
												<input type="text" name="supplierid" value="" class="input">
											</div></td>
										<td width="15%" bgcolor="#FFFFFF"><div align="right">
												<span class="STYLE10">����������:</span>
											</div></td>
										<td bgcolor="#FFFFFF"><div align="left">
												<input type="text" name="suppliername" value=""
													class="input">
											</div></td>
									</tr>
									<tr>
										<td width="15%" bgcolor="#FFFFFF"><div align="right">
												<span class="STYLE10">ԭ��:</span>
											</div></td>
										<td bgcolor="#FFFFFF"><select name="materialid">
												<option value="">��ѡ��</option>
												<%
													while (rs1.next()) {
														s++;
														materialname = rs1.getString("material_name");
														materialid =rs1.getInt("material_id");
												%>>
												<option value="<%=materialid%>"><%=materialid+": "+materialname%></option>
												<%
													}
													rs1.close();
												%>>
										</select></td>
										<td width="15%" bgcolor="#FFFFFF"><div align="right">
												<span class="STYLE10">�۸�:</span>
											</div></td>
										<td bgcolor="#FFFFFF"><div align="left">
												<input type="text" name="price" value="" class="input">
											</div></td>
									</tr>
									<tr>
										<td width="15%" bgcolor="#FFFFFF" ><div align="right">
												<span class="STYLE10">��ַ:</span>
											</div></td>
										<td bgcolor="#FFFFFF" colspan = 3><div align="left">
												<input type="text" name="address" value="" class="input" size=50>
											</div></td>
									</tr>
									<tr>
										<td width="15%" bgcolor="#FFFFFF"><div align="right">
												<span class="STYLE10">�ʼ�:</span>
											</div></td>
										<td bgcolor="#FFFFFF" colspan = 3><div align="left">
												<input type="text" name="email" value="" class="input" size=50>
											</div></td>
									</tr>
									<tr>
										<td width="15%" bgcolor="#FFFFFF" ><div align="right">
												<span class="STYLE10">�绰:</span>
											</div></td>
										<td bgcolor="#FFFFFF" colspan = 3><div align="left">
												<input type="text" name="phone" value="" class="input" size=50>
											</div></td>
									</tr>
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
