<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<html>
<head>
<title>无标题文档</title>
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
<script>
	function kannewsdetail(a) {
		c = "detail_news2.jsp?newsid=" + a;
		window
				.open(
						c,
						"bodykannews",
						"toolbar=no,status=no,scrollbars=yes,menubar=no,location=no,top=100,resizable=no,left=250,width=650,height=430")
	}
</script>
</head>

<body>
	<table width="100%" height="100%" border="0" cellspacing="0"
		cellpadding="0">
		<tr>
			<td width="8" bgcolor="#353c44">&nbsp;</td>
			<td width="147" valign="top"><iframe height="100%" width="100%"
					border="0" frameborder="0" src="left0.jsp"></iframe></td>
			<td width="10" bgcolor="#add2da">&nbsp;</td>
			<td valign="top">
				<!--  --> <jsp:useBean id="db1" scope="page" class="ck.ck" /> <jsp:useBean
					id="db2" scope="page" class="ck.ck" /> <%
 	int u_pri = 0, u_dep = 0;
 	String th_wnum = "", u_spri = "";
 	if (session.getAttribute("wnum") == null)//判断是否有登录
 	{
 		response.sendRedirect("checklogin.jsp");
 	} else {
 		th_wnum = (String) session.getAttribute("wnum");//获取工作证号

 		String usql = "select * from employee where employee_username='" + th_wnum + "'";
 		ResultSet urs = db1.executeQuery(usql);

 		if (urs.next()) {
 			//u_dep=urs.getInt("tdep");
 			u_pri = urs.getInt("actlevel");
 		}
 		urs.close();
 		if (u_pri == 1) //1　表示普通员工　 　3　表示领导
 			u_spri = "普通员工";

 		else if (u_pri == 3)
 			u_spri = "领导";

 	}

 	String sql2 = "select * from news";//显示已添加的公告标题
 	ResultSet rs2 = db1.executeQuery(sql2);
 	String newsid = "";
 	String title = "";
 	int dep = 0;
 	String depname = "";
 	String addtime = "";
 	int s = 0;
 %>
				<form name="forma" method="post" action="qy_gg.jsp">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="0">

						<tr>
							<td><table width="100%" border="0" cellpadding="5"
									cellspacing="1" bgcolor="#a8c7ce">
									<tr bgcolor="d3eaef">
										<td width="30" bgcolor="d3eaef"><span class="STYLE10">序号</span></td>
										<td align="center" bgcolor="d3eaef"><span class="STYLE10">公告标题</span>
										</td>
										<td align="center" bgcolor="d3eaef" width="60"><span
											class="STYLE10">所属部门</span></td>
										<td align="center" bgcolor="d3eaef" width="140"><span
											class="STYLE10">时间</span></td>
										<td align="center" bgcolor="d3eaef" width="140"><span
											class="STYLE10">详情</span></td>
									</tr>
									<%
										while (rs2.next()) {
											s++;
											newsid = rs2.getString("newsid");
											title = rs2.getString("title");
											dep = rs2.getInt("dep");
											addtime = rs2.getString("addtime");
											switch (dep) {
											case 1: {
												depname = "生产部门";
												break;
											}
											case 2: {
												depname = "采购部门";
												break;
											}
											case 3: {
												depname = "财务部门";
												break;
											}
											case 4: {
												depname = "仓储部门";
												break;
											}
											case 5: {
												depname = "质检部门";
												break;
											}
											case 6: {
												depname = "管理";
												break;
											}
											}
									%>
									<TR>
										<td bgcolor="#FFFFFF" align="center"><span
											class="STYLE10"><%=s%></span></td>
										<TD bgcolor="#FFFFFF" align="left"><a
											href="javascript:kannewsdetail('<%=newsid%>');" class="ccc"><span
												class="STYLE10"><%=title%></span></a></TD>
										<TD bgcolor="#FFFFFF" align="center"><span
											class="STYLE10"><%=depname%></span></TD>
										<TD bgcolor="#FFFFFF" align="center"><span
											class="STYLE10"><%=addtime%></span></TD>
										<TD bgcolor="#FFFFFF" align="center" ><a
											href="javascript:kannewsdetail('<%=newsid%>');" class= "ccc" >
											<span class="STYLE10">详情</span></a></TD>
									</TR>
									<%
										}
										rs2.close();
									%>

								</table></td>
						</tr>
					</table>
				</form> <!--  -->
			</td>
			<td width="8" bgcolor="#353c44">&nbsp;</td>
		</tr>
	</table>
</body>
</html>
