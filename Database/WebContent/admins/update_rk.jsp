<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>
<html>
<head>
<title>更改货品入库信息</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function isValid() {

		if (document.forma.sbname.value == "") {
			alert("请输入货品名称！");
			document.forma.sbname.focus();
			return false;
		}
		if (document.forma.types_rec_id.value == "") {
			alert("请选择货品类型！");
			document.forma.types_rec_id.focus();
			return false;
		}
		if (document.forma.sbsums.value == "") {
			alert("请输入货品　数量 ！");
			document.forma.sbsums.focus();
			return false;
		}
		if (document.forma.dw.value == "") {
			alert("请输入　数量 单位！");
			document.forma.dw.focus();
			return false;
		}
		if (document.forma.remark.value == "") {
			alert("请输入参数说明！");
			document.forma.remark.focus();
			return false;
		}
		if (document.forma.xx.value == "") {
			alert("请输入存放　区！");
			document.forma.xx.focus();
			return false;
		}
		if (document.forma.yy.value == "") {
			alert("请输入存放　柜！");
			document.forma.yy.focus();
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

		String sql2 = "select * from store_detail where order_id = " + orderid + " and material_id = " + materialid;
		ResultSet rs2 = db.executeQuery(sql2);
		String materialname = "", suppliernam = "", store = "", time;
		int supplierid = 0, num = 0, price = 0;
		char areA, areB;
		char baseA='A';
		int baseB=1;

		if (rs2.next()) {
			materialname = rs2.getString("material_name");
			supplierid = rs2.getInt("supplier_id");
			suppliernam = rs2.getString("supplier_name");
			store = rs2.getString("store_position");
			time = rs2.getString("instore_time");
			num = rs2.getInt("number");
			price = rs2.getInt("totalprice");
			areA = store.charAt(0);
			areB = store.charAt(2);
			int s=0;
	%>
	<br>
	<center>
		<form name="forma" method="post" action="okupdate_rk.jsp"
			onsubmit="return isValid();">
			<table width="80%" border="0" align="center" cellpadding="0"
				cellspacing="0">

				<tr>
					<td><table width="100%" border="0" cellpadding="5"
							cellspacing="1" bgcolor="#a8c7ce">
							<tr>
								<td colspan=2 bgcolor="d3eaef" height="30"><div
										align="center">
										<span class="STYLE10">修改库存信息</span>
										<input type = "hidden" name="orderid" value="<%=orderid %>" >
										<input type = "hidden" name="materialid" value="<%=materialid %>" >
									</div></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="right"><span class="STYLE10">计划编号</span></td>
								<td bgcolor="#FFFFFF" align="left"><span class="STYLE10"><%=orderid%></span></td>
							</tr>


							<tr>
								<td bgcolor="#FFFFFF" align="right"><span class="STYLE10">原料</span></td>
								<td bgcolor="#FFFFFF" align="left"><span class="STYLE10"><%=materialname%></span></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="right"><span class="STYLE10">供应商:</span></td>
								<td bgcolor="#FFFFFF" align="left"><span class="STYLE10"><%=suppliernam%></span></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="right"><span class="STYLE10">数量:</span></td>
								<td bgcolor="#FFFFFF" align="left"><span class="STYLE10"><%=num%></span></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="right"><span class="STYLE10">价格:</span></td>
								<td bgcolor="#FFFFFF" align="left"><span class="STYLE10"><%=price%></span></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="right"><span class="STYLE10">存放位置:</span></td>
								<td bgcolor="#FFFFFF" align="left"><span class="STYLE10"><select name="areA">								
								<%
								while(s<5)
								{
									s++;								
								%>
								<option value=<%=baseA %> ><%=baseA %></option>
								<%
									baseA++;
								}
								s=0;
								%>
								</select> 区&nbsp;&nbsp;<select name ="areB">								
								<%
								while(s<5)
								{
									s++;									
								%>
								<option value = <%=baseB %>><%=baseB %></option>
								<%
									baseB++;
								}
								%>
								</select> &nbsp;柜<span class="STYLE10"></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="right"><span class="STYLE10">入库时间:</span></td>
								<td bgcolor="#FFFFFF" align="left"><span class="STYLE10"><%=time%></span></td>
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

	<center>
		<input onclick="window.opener=null;window.close()" type="button"
			value=" 关闭 ">
	</center>
</body>
</html>
