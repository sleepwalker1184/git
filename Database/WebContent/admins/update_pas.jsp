<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<html>
<head>
<title>�ޱ����ĵ�</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function isNum(passedVal) {
		if (passedVal == "") {
			return false;
		}
		for (i = 0; i < passedVal.length; i++) {
			if (passedVal.charAt(i) < "0") {//�������ֵС��0�������
				return false;
			}
			if (passedVal.charAt(i) > "9") {//�������ֵ����0-9��Χ�ڣ������
				return false;
			}
			return true;
		}
	}
	function isValid() {
		var oq = document.form1.wpswd0.value;
		var oq1 = document.form1.wpswd1.value;
		var oq2 = document.form1.wpswd2.value;
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
				alert("�����������룡");
				document.form1.wpswd1.focus();
				return false;
			}

		} else {
			alert("����������룡����д������");
			document.form1.wpswd0.focus();
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
									<td width="83%"><div align="center" class="STYLE5">�޸�����</div></td>
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
																	href="update_pas.jsp" target="mainFrame">�޸�����</a></td>
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
					id="db2" scope="page" class="ck.ck" />

				<form name="form1" method="post" action="okupdate_pas.jsp"
					onsubmit="return isValid();">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="0">

						<tr>
							<td><table width="100%" border="0" cellpadding="5"
									cellspacing="1" bgcolor="#a8c7ce">
									<tr>
										<td colspan=2 bgcolor="d3eaef" height="40"><div
												align="center">
												<span class="STYLE10">�޸�����</span>
											</div></td>
									</tr>
									<tr>
										<td width="15%" bgcolor="#FFFFFF" class="ccc">
											<div align="center" bgcolor="#FFFFFF">
												<span class="STYLE10">�� �� ��:</span>
											</div>
										</td>
										<td width="122" bgcolor="#FFFFFF">
											<div align="left">
												<input name="wpswd0" type="password" size="12">
											</div>
										</td>
									</tr>
									<tr>
										<td bgcolor="#FFFFFF" width="15%" class="ccc">
											<div align="center">
												<span class="STYLE10">�� �� ��:</span>
											</div>
										</td>
										<td bgcolor="#FFFFFF">
											<div align="left">
												<input name="wpswd1" type="password" size="12">
											</div>
										</td>
									</tr>
									<tr>
										<td width="15%" bgcolor="#FFFFFF" class="ccc">
											<div align="center">
												<span class="STYLE10">ȷ������:</span>
											</div>
										</td>
										<td bgcolor="#FFFFFF">
											<div align="left">
												<input name="wpswd2" type="password" size="12">
											</div>
										</td>
									</tr>

									<tr>
										<td colspan="2" align="center" class="STYLE6" bgcolor="d3eaef">
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
