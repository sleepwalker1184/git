<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>
<html>
<head>
<title>修改质检报告</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function isValid() {
		var oq = document.forma.typename.value;

		if (oq == "") {
			alert("请输入货品类别名称！");
			document.forma.typename.focus();
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
		String materialid = new String(request.getParameter("detail2"));
		int temorderid,temmaterialid;
		temorderid =Integer.parseInt(orderid);
		temmaterialid =Integer.parseInt(materialid);

		String sql1 = "select * from return_detail where order_id = " + orderid + " and material_id = "
				+ materialid;
		ResultSet rs1 = db.executeQuery(sql1);

		String sql2 = "select * from base_order";
		ResultSet rs2 = db.executeQuery(sql2);
		int baseorid;

		String sql3 = "select * from base_material";
		ResultSet rs3 = db.executeQuery(sql3);
		int basemaid;
		String basemaname;

		String sql4 = "select * from Supplier";
		ResultSet rs4 = db.executeQuery(sql4);
		int basesuid;
		String basesuname;

		String materialname = "", suppliername = "";
		int supplierid, num, price;
		if (rs1.next()) {
			materialname = rs1.getString("material_name");
			suppliername = rs1.getString("supplier_name");
			supplierid = rs1.getInt("supplier_id");
			num = rs1.getInt("number");
			price = rs1.getInt("totalprice");
	%>
	<br>
	<center>
		<form name="form1" method="post" action="okupdate_types.jsp"
			onsubmit="return isValid();">
			<input type="hidden" name="oldma" value="<%=materialid%>"> <input
				type="hidden" name="oldor" value="<%=orderid%>">
			<table width="80%" border="0" align="center" cellpadding="0"
				cellspacing="0">

				<tr>
					<td><table width="100%" border="0" cellpadding="5"
							cellspacing="1" bgcolor="#a8c7ce">
							<tr>
								<td colspan=4 bgcolor="d3eaef" height="30"><div
										align="center">
										<span class="STYLE10">修改质检报告</span>
									</div></td>
							</tr>
							<tr>
								<td width="15%" bgcolor="#FFFFFF"><div align="right">
										<span class="STYLE10">计划编号:</span>
									</div></td>
								<td bgcolor="#FFFFFF" colspan=3><select name="orderid">
										<option value=<%=orderid %>><%=orderid%></option>
										<%
											while (rs2.next()) {
													baseorid = rs2.getInt("order_id");
													if(baseorid == temorderid)
														continue;
										%>
										<option value=<%=baseorid%>><%=baseorid%></option>
										<%
											}
												rs2.close();
										%>
								</select></td>
							</tr>
							<tr>
								<td width="15%" bgcolor="#FFFFFF"><div align="right">
										<span class="STYLE10">原料:</span>
									</div></td>
								<td align="left" bgcolor="#FFFFFF" colspan = 3><select
									name="materialid">
										<option value=<%=materialid %>><%=materialid+": "+materialname%></option>
										<%
											while (rs3.next()) {
													basemaid = rs3.getInt("material_id");
													basemaname = rs3.getString("material_name");
													if(basemaid == temmaterialid)
														continue;
										%>>
										<option value="<%=basemaid%>"><%=basemaid + ": " + basemaname%></option>
										<%
											}
												rs3.close();
										%>>
								</select></td>
							</tr>
							<tr>
								<td width="25%" bgcolor="#FFFFFF"><div align="right">
										<span class="STYLE10">供应商:</span>
									</div></td>
								<td bgcolor="#FFFFFF" colspan=3 ><select name="supplierid">
										<option value=<%=supplierid %>><%=supplierid+": "+suppliername%></option>
										<%
											while (rs4.next()) {
													basesuid = rs4.getInt("supplier_id");
													basesuname= rs4.getString("supplier_name");
													if(basesuid == supplierid)
														continue;
										%>
										<option value=<%=basesuid%>><%=basesuid+": "+basesuname%></option>
										<%
											}
												rs4.close();
										%>
								</select></td>								
							</tr>
							
							<tr>
								<td width="25%" bgcolor="#FFFFFF"><div align="right">
										<span class="STYLE10">数量:</span>
									</div></td>
								<td width="25%" bgcolor="#FFFFFF"><div align="right">
										<span class="STYLE10"><%=num%></span>
									</div></td>
								<td width="15%" bgcolor="#FFFFFF"><div align="right">
										<span class="STYLE10">总价</span>
									</div></td>
								<td width="25%" bgcolor="#FFFFFF"><div align="right">
										<span class="STYLE10"><%=price%></span>
									</div></td>
							</tr>
							<tr>
								<td colspan=4 align="center" class="STYLE6" bgcolor="d3eaef">
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
