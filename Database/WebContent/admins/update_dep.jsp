<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>
<html>
<head>
<title>更改计划详情</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function isValid() {
		var oq = document.form1.depname.value;
		if (oq == "") {
			alert("请输入计划编号！");
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

	<jsp:useBean id="db" scope="page" class="ck.ck" />
	<jsp:useBean id="db1" scope="page" class="ck.ck" />
	<%
		String orderid = new String(request.getParameter("detail"));

		String sql2 = "select * from base_order where order_id =" + orderid;
		String time;

		ResultSet rs2 = db.executeQuery(sql2);

		if (rs2.next()) {
			time = rs2.getString("deadline");
	%>
	<br>
	<center>
		<form name="form1" method="post" action="okupdate_dep.jsp"
			onsubmit="return isValid();">
			<table width="80%" border="0" align="center" cellpadding="0"
				cellspacing="0">

				<tr>
					<td><table width="100%" border="0" cellpadding="5"
							cellspacing="1" bgcolor="#a8c7ce">
							<tr>
								<td colspan=2 bgcolor="d3eaef" height="30"><div
										align="center">
										<span class="STYLE10">修改计划详情</span>
									</div></td>
							</tr>
							<tr>

								<td width="20%" bgcolor="#FFFFFF"><div align="right">
										<span class="STYLE10">计划编号:</span>
									</div></td>
								<td bgcolor="#FFFFFF"><div align="left">
										<span clasee="STYLE10"><%=orderid%></span> </select>
									</div></td>
							</tr>
							<tr>
								<td width="20%" bgcolor="#FFFFFF"><div align="right">
										<span class="STYLE10">截止时间:</span>
									</div></td>
								<td bgcolor="#FFFFFF"><div align="left">
										<input type="text" name="time" value="<%=time%>">
									</div></td>
								<input type="hidden" name="orderid" value="<%=orderid%>" />
							</tr>
							<tr>
								<td colspan="2" align="center" class="STYLE6" bgcolor="d3eaef">
									<input type="submit" value="保存">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; <input
									type="reset" value="重置">
								</td>
							</tr>
						</table></td>
				</tr>
			</table>
		</form>
	</center>
	<%
		}		
	%>
	<br>
	<br>
	<center>
		<input onclick="window.opener=null;window.close()" type="button"
			value=" 关闭 ">
	</center>
</body>
</html>
