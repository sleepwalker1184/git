<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>
<jsp:useBean id="udb2" scope="page" class="ck.ck" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

a:link {
	font-size: 12px;
	color: #FF0000;
	text-decoration: none;
}

a:visited {
	font-size: 12px;
	color: #FFFFFF;
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

.STYLE1 {
	font-size: 12px;
	color: #000000;
}

.STYLE5 {
	font-size: 12
}

.STYLE7 {
	font-size: 12px;
	color: #FFFFFF;
}
-->
</style>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function showtime() {
		now = new Date();
		var str = now.getFullYear() + "��";
		var temp = now.getMonth() + 1;
		if (temp < 10)
			str += "0";
		str += temp + "��";
		temp = now.getDate();
		if (temp < 10)
			str += "0";
		str += temp + "��";
		temp = now.getHours();
		if (temp < 10)
			str += "0";
		str += temp + ":";
		temp = now.getMinutes();
		if (temp < 10)
			str += "0";
		str += temp + ":";
		temp = now.getSeconds();
		if (temp < 10)
			str += "0";
		str += temp;
		document.getElementById('time').innerHTML = str;
		ctroltime = setTimeout("showtime()", 1000);
	}
// -->
</SCRIPT>
</head>

<body>

	<%
		String IPs = request.getRemoteAddr();

		String h_wnuma = "";
		String u_name = "", t = "";
		String u_spri = "";
		int u_pri = 0, uare = 0;
		String depnames = "";
		if (session.getAttribute("wnum") == null)//�ж��Ƿ��е�¼
		{
			response.sendRedirect("checklogin.jsp");
		} else {
			h_wnuma = (String) session.getAttribute("wnum");//��ȡ����֤��

			String usql = "select * from employee where employee_username = '" + h_wnuma + "'";
			ResultSet urs = udb2.executeQuery(usql);

			if (urs.next()) {
				u_name = urs.getString("employee_name");
				u_pri = urs.getInt("actlevel");
				depnames = urs.getString("employee_name");
				uare = urs.getInt("actarea");
			}
			urs.close();
			if (u_pri == 0) //1����ʾ��ͨԱ���� ��3����ʾ�쵼
			{
				u_spri = "Ա��";
				switch (uare) {
					case 1 : {
						depnames = "��������";
						break;
					}
					case 2 : {
						depnames = "�ɹ�����";
						break;
					}
					case 3 : {
						depnames = "�ʼ첿��";
						break;
					}
					case 4 : {
						depnames = "������";
						break;
					}
					case 5 : {
						depnames = "�ִ�����";
						break;
					}
				}

			} else if (u_pri == 1) {
				u_spri = "Ա��";
				switch (uare) {
					case 1 : {
						depnames = "��������";
						break;
					}
					case 2 : {
						depnames = "�ɹ�����";
						break;
					}
					case 3 : {
						depnames = "�ʼ첿��";
						break;
					}
					case 4 : {
						depnames = "������";
						break;
					}
					case 5 : {
						depnames = "�ִ�����";
						break;
					}
				}
			} else if (u_pri == 2) {
				u_spri = "����";
				depnames = "����";
			}

		}
	%>

	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="57" background="images/main_03.gif"><table
					width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="378" height="57" background="images/logo.gif">&nbsp;</td>
						<td>&nbsp;</td>
						<td width="281" valign="bottom"><table width="100%"
								border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="33" height="27"><img src="images/main_05.gif"
										width="33" height="27" /></td>
									<td width="248" background="images/main_06.gif"><table
											width="225" border="0" align="center" cellpadding="0"
											cellspacing="0">
											<tr>
												<td height="17"><div align="right">
														<a href="update_pas.jsp" target="mainFrame">�޸�����</a>
													</div></td>

												<td><div align="right">
														<a href="logout.jsp" target="_parent"><img
															src="images/quit.gif" width="69" height="17" /></A>
													</div></td>
											</tr>
										</table></td>
								</tr>
							</table></td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td height="40" background="images/main_10.gif"><table
					width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="194" height="40" background="images/main_07.gif">&nbsp;</td>
						<td><table width="100%" border="0" cellspacing="0"
								cellpadding="0">
								<tr>
									<td width="21"><img src="images/main_13.gif" width="19"
										height="14" /></td>
									<td>
										<%
											if (u_pri == 2) //
											{
										%> <a href="ctrl_dep.jsp" target="mainFrame">�����ƻ�</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
										href="ctrl_news.jsp" target="mainFrame">�ɹ��ƻ�</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
										href="ctrl_yg.jsp" target="mainFrame">����������</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
										href="ctrl_types.jsp" target="mainFrame">�˻�����</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
										href="ctrl_rk.jsp" target="mainFrame">���״��</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
										href="ctrl_ck0.jsp" target="mainFrame">��ⱨ��</a>&nbsp; <%
 	;
 	}

 	if (u_pri == 1) //�� �� 
 	{
 		switch (uare) {
 			case 1 : {
 %> <a href="ctrl_dep.jsp" target="mainFrame">�����ƻ�</a>
										<%
											break;
													}
													case 2 : {
										%><a href="ctrl_news.jsp" target="mainFrame">�ɹ��ƻ�</a>&nbsp;&nbsp;&nbsp;&nbsp;
										<a href="ctrl_yg.jsp" target="mainFrame">��Ӧ������</a> <%
 	break;
 			}
 			case 3 : {
 %><a href="ctrl_types.jsp" target="mainFrame">�˻�����</a>&nbsp;&nbsp;&nbsp;&nbsp;
										<%
											break;
													}
													case 4 : {
										%><a href="ctrl_news.jsp" target="mainFrame">�ɹ��ƻ�</a>&nbsp;&nbsp;&nbsp;&nbsp;
										<a href="ctrl_types.jsp" target="mainFrame">�˻�����</a>&nbsp;&nbsp;&nbsp;&nbsp;
										<a href="ctrl_ck0.jsp" target="mainFrame">��ⱨ��</a> <%
 	break;
 			}
 			case 5 : {
 %><a href="ctrl_rk.jsp" target="mainFrame">���״��</a> <%
 	break;
 			}
 		}
 		;

 	}
 %>
									</td>
								</tr>
							</table></td>
						<td width="248" background="images/main_11.gif"><table
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="16%"><span class="STYLE5"></span></td>
									<td width="75%"><div align="center">
											<span class="STYLE7"><div id="time">
													<script language="javascript">
														showtime();
													</script></span>
										</div></td>
									<td width="9%">&nbsp;</td>
								</tr>
							</table></td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td height="30" background="images/main_31.gif"><table
					width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="8" height="30"><img src="images/main_28.gif"
							width="8" height="30" /></td>
						<td width="147" background="images/main_29.gif"><table
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="24%">&nbsp;</td>
									<td width="43%" height="20" valign="bottom" class="STYLE1">����˵�</td>
									<td width="33%">&nbsp;</td>
								</tr>
							</table></td>
						<td width="39"><img src="images/main_30.gif" width="39"
							height="30" /></td>
						<td><table width="100%" border="0" cellspacing="0"
								cellpadding="0">
								<tr>
									<td height="20" valign="bottom"><span class="STYLE1">��ǰ��¼�û���<%=u_name%>
											&nbsp;�û���ɫ��<%=u_spri%>&nbsp;�û���������: <%=depnames%></span></td>
									<td valign="bottom" class="STYLE1"><div align="right">
											<img src="images/sj.gif" width="6" height="7" /> ��ǰ��¼IP��<%=IPs%>
										</div></td>
								</tr>
							</table></td>
						<td width="17"><img src="images/main_32.gif" width="17"
							height="30" /></td>
					</tr>
				</table></td>
		</tr>
	</table>
</body>
</html>
