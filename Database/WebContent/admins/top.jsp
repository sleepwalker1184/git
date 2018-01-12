<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>
<jsp:useBean id="udb2" scope="page" class="ck.ck" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
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
		var str = now.getFullYear() + "年";
		var temp = now.getMonth() + 1;
		if (temp < 10)
			str += "0";
		str += temp + "月";
		temp = now.getDate();
		if (temp < 10)
			str += "0";
		str += temp + "日";
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
		if (session.getAttribute("wnum") == null)//判断是否有登录
		{
			response.sendRedirect("checklogin.jsp");
		} else {
			h_wnuma = (String) session.getAttribute("wnum");//获取工作证号

			String usql = "select * from employee where employee_username = '" + h_wnuma + "'";
			ResultSet urs = udb2.executeQuery(usql);

			if (urs.next()) {
				u_name = urs.getString("employee_name");
				u_pri = urs.getInt("actlevel");
				depnames = urs.getString("employee_name");
				uare = urs.getInt("actarea");
			}
			urs.close();
			if (u_pri == 0) //1　表示普通员工　 　3　表示领导
			{
				u_spri = "员工";
				switch (uare) {
					case 1 : {
						depnames = "生产部门";
						break;
					}
					case 2 : {
						depnames = "采购部门";
						break;
					}
					case 3 : {
						depnames = "质检部门";
						break;
					}
					case 4 : {
						depnames = "财务部门";
						break;
					}
					case 5 : {
						depnames = "仓储部门";
						break;
					}
				}

			} else if (u_pri == 1) {
				u_spri = "员工";
				switch (uare) {
					case 1 : {
						depnames = "生产部门";
						break;
					}
					case 2 : {
						depnames = "采购部门";
						break;
					}
					case 3 : {
						depnames = "质检部门";
						break;
					}
					case 4 : {
						depnames = "财务部门";
						break;
					}
					case 5 : {
						depnames = "仓储部门";
						break;
					}
				}
			} else if (u_pri == 2) {
				u_spri = "主管";
				depnames = "管理";
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
														<a href="update_pas.jsp" target="mainFrame">修改密码</a>
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
										%> <a href="ctrl_dep.jsp" target="mainFrame">生产计划</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
										href="ctrl_news.jsp" target="mainFrame">采购计划</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
										href="ctrl_yg.jsp" target="mainFrame">供货商详情</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
										href="ctrl_types.jsp" target="mainFrame">退货报告</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
										href="ctrl_rk.jsp" target="mainFrame">库存状况</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
										href="ctrl_ck0.jsp" target="mainFrame">入库报告</a>&nbsp; <%
 	;
 	}

 	if (u_pri == 1) //　 　 
 	{
 		switch (uare) {
 			case 1 : {
 %> <a href="ctrl_dep.jsp" target="mainFrame">生产计划</a>
										<%
											break;
													}
													case 2 : {
										%><a href="ctrl_news.jsp" target="mainFrame">采购计划</a>&nbsp;&nbsp;&nbsp;&nbsp;
										<a href="ctrl_yg.jsp" target="mainFrame">供应商详情</a> <%
 	break;
 			}
 			case 3 : {
 %><a href="ctrl_types.jsp" target="mainFrame">退货报告</a>&nbsp;&nbsp;&nbsp;&nbsp;
										<%
											break;
													}
													case 4 : {
										%><a href="ctrl_news.jsp" target="mainFrame">采购计划</a>&nbsp;&nbsp;&nbsp;&nbsp;
										<a href="ctrl_types.jsp" target="mainFrame">退货报告</a>&nbsp;&nbsp;&nbsp;&nbsp;
										<a href="ctrl_ck0.jsp" target="mainFrame">入库报告</a> <%
 	break;
 			}
 			case 5 : {
 %><a href="ctrl_rk.jsp" target="mainFrame">库存状况</a> <%
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
									<td width="43%" height="20" valign="bottom" class="STYLE1">管理菜单</td>
									<td width="33%">&nbsp;</td>
								</tr>
							</table></td>
						<td width="39"><img src="images/main_30.gif" width="39"
							height="30" /></td>
						<td><table width="100%" border="0" cellspacing="0"
								cellpadding="0">
								<tr>
									<td height="20" valign="bottom"><span class="STYLE1">当前登录用户：<%=u_name%>
											&nbsp;用户角色：<%=u_spri%>&nbsp;用户所属部门: <%=depnames%></span></td>
									<td valign="bottom" class="STYLE1"><div align="right">
											<img src="images/sj.gif" width="6" height="7" /> 当前登录IP：<%=IPs%>
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
