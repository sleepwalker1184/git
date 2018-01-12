<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>
<html>
<head>
<title>查看公告信息</title>

</head>

<body>

	<jsp:useBean id="dep" scope="page" class="ck.ck" />
	<jsp:useBean id="adn" scope="page" class="ck.ck" />
	<%
		String newsid = new String(request.getParameter("newsid"));

		int dep1;
		String title = "";
		String news = "";
		String depname1 = "";
		String addtime = "";

		String sql2 = "select * from news  where  newsid=" + newsid;

		ResultSet rs3 = dep.executeQuery(sql2);

		if (rs3.next()) {
			title = rs3.getString("title");
			news = rs3.getString("content");
			dep1 = rs3.getInt("dep");
			addtime = rs3.getString("addtime");
			switch (dep1) {
			case 1: {
				depname1 = "生产部门";
				break;
			}
			case 2: {
				depname1 = "采购部门";
				break;
			}
			case 3: {
				depname1 = "财务部门";
				break;
			}
			case 4: {
				depname1 = "仓储部门";
				break;
			}
			case 5: {
				depname1 = "质检部门";
				break;
			}
			case 6: {
				depname1 = "管理";
				break;
			}
			}
	%>
	<center>

		<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="0">

			<tr>
				<td><table width="100%" border="0" cellpadding="5"
						cellspacing="1" bgcolor="#a8c7ce">
						<tr>
							<td align="center" bgcolor="d3eaef"><B><font size="5"><%=title%></font></B>
								<br></td>
						</tr>
						<tr>
							<td height="300" bgcolor="#FFFFFF" align="left" valign="top"><font
								size="2">&nbsp;&nbsp;&nbsp;&nbsp;<%=news%></font></td>
						</tr>
						<tr>
							<td bgcolor="#FFFFFF" bgcolor="d3eaef" align="right"><font
								size="2">公告时间：<font size="2" color="#6633FF"><%=addtime%></font></font>
							</td>
						</tr>
					</table></td>
			</tr>
		</table>
	</center>
	<%
		}
		rs3.close();
	%>

	<center>
		<input onclick="window.opener=null;window.close()" type="button"
			value=" 关闭 ">
	</center>
</body>
</html>
