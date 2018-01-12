<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>
<html>
<head>
<title>更改订单详情</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function isValid() {
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

		System.out.println(orderid + materialid);
		String sql2 = "select * from purchase_detail where order_id = " + orderid + " and material_id = "
				+ materialid;
		String sql3 = "select * from base_material";
		String sql4 =" select * from supply_detail where material_id = "+materialid;
		
		int number = 0, price = 0, supplierid = 0;
		String materialname = "", suppliername = "", trans = "", transstatus = "";

		ResultSet rs2 = db.executeQuery(sql2);
		ResultSet rs3 = db.executeQuery(sql3);
		ResultSet rs4 = db.executeQuery(sql4);
		int temmaterialid=0,temmaterialid2,temsupplierid = 0;
		String temamterialname="",temsuppliername="";

		if (rs2.next()) {
			materialname = rs2.getString("material_name");
			number = rs2.getInt("number");
			price = rs2.getInt("totalprice");
			supplierid = rs2.getInt("supplier_id");
			suppliername = rs2.getString("supplier_name");
			trans = rs2.getString("TransWay");
			transstatus = rs2.getString("TransStatus");
			temmaterialid2 = rs2.getInt("material_id");
	%>
	<br>
	<center>
		<form name="forma" method="post" action="okupdate_news.jsp"
			onsubmit="return isValid();">
			<table width="80%" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<input type="hidden" name ="oldma" value =<%= materialid %> >
				<input type="hidden" name ="orderid" value =<%= orderid %> >
				<tr>
					<td><table width="100%" border="0" cellpadding="5"
							cellspacing="1" bgcolor="#a8c7ce">
							<tr>
								<td colspan=2 bgcolor="d3eaef" height="30"><div
										align="center">
										<span class="STYLE10">修改详情</span>
									</div></td>
							</tr>
							<tr>
								<td width="20%" bgcolor="#FFFFFF"><div align="right">
										<span class="STYLE10">计划编号:</span>
									</div></td>
								<td bgcolor="#FFFFFF"><div align="left">
										<span class="STYLE10"><%=orderid%></span>
									</div></td>
							</tr>
							<tr>
								<td width="15%" bgcolor="#FFFFFF"><div align="right">
										<span class="STYLE10">原料:</span>
									</div></td>
								<td bgcolor="#FFFFFF"><div align="left">
								<span class="STYLE10"><%=materialname %></span>																
										<%-- <select name ="materialid">
										<option value = <%=materialid %>><%=materialid+": "+materialname %> </option>
										<%
										while(rs3.next())
										{
											temmaterialid = rs3.getInt("material_id");
											temamterialname = rs3.getString("material_name");
											if(temmaterialid == temmaterialid2)
												continue;
										%>
										<option value = <%=temmaterialid %>><%=temmaterialid+": "+temamterialname %>  </option>
										<%
										}
										%>
										</select> --%>
									</div></td>								
							</tr>
							<tr>
								<td width="15%" bgcolor="#FFFFFF"><div align="right">
										<span class="STYLE10">供应商:</span>
									</div></td>
								<td bgcolor="#FFFFFF"><div align="left">								
										<select name = "supplierid">
										<option value = <%=supplierid %> > <%=supplierid+": "+suppliername %></option>
										<%
										while(rs4.next())
										{
											temsupplierid = rs4.getInt("supplier_id");
											temsuppliername = rs4.getString("supplier_name");
											if(temsupplierid == supplierid)
												continue;
										%>
										<option value = <%=temsupplierid %>><%=temsupplierid+": "+temsuppliername %></option>
										<%
										}
										
										%>
										</select>
									</div></td>								
							</tr>
							<td width="15%" bgcolor="#FFFFFF"><div align="right">
									<span class="STYLE10">运输方式:</span>
								</div></td>
							<td bgcolor="#FFFFFF"><div align="left">
									<select name = "trans">
									<option value =<%=trans %> ><%=trans %></option>
									<option value = "car" >car</option>
									<option value = "plane">plane</option>
									<option value = "ship">ship</option>
									<option value = "train">train</option>
									<option value = "truck">truck</option>
									</select>
								</div></td>														
							
							<tr>
							<td width="15%" bgcolor="#FFFFFF"><div align="right">
									<span class="STYLE10">运输状态:</span>
								</div></td>
							<td bgcolor="#FFFFFF"><div align="left">
									<select name="transstatus">
									<option value =<%=transstatus %> ><%=transstatus %></option>
									<option value = "PreTrans">PreTrans</option>
									<option value = "Shiped">Shiped</option>
									<option value = "Stored">Stored</option>
									<option value = "Returned">Returned</option>
									</select>
								</div></td>
							</tr>							

							<tr>
								<td colspan=2 align="center" class="STYLE6" bgcolor="d3eaef">
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
