<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage="" import="java.util.Date"
	import="java.text.SimpleDateFormat"%>

<html>
<head>
<title>无标题文档</title>
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
									<td width="83%"><div align="center" class="STYLE5">库存状况</div></td>
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
																<td height="23" class="STYLE4"><a href="add_rk.jsp"
																	target="mainFrame">新增货物入库</a></td>
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
																	href="ctrl_rk.jsp" target="mainFrame">库存状况</a></td>
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
									<td width="76%" valign="bottom"><span class="STYLE3">原材料采购管理系统</span></td>
								</tr>
							</table></td>
					</tr>
				</table> <!-- ================ -->
			</td>
			<td width="10" bgcolor="#add2da">&nbsp;</td>
			<td valign="top">
				<!--========================== 主区 =================================-->
				<jsp:useBean id="db1" scope="page" class="ck.ck" /> <jsp:useBean
					id="db2" scope="page" class="ck.ck" /> <%
 	int orderid, materialid, num;
 	String materialname = ""; 	
 	Date date = new Date();
 	SimpleDateFormat time1=new SimpleDateFormat("yyyy-MM-dd");
 	String time = time1.format(date);
 	String sql1 = "select * from base_order";
 	String sql2 = "select * from base_material";

 	ResultSet rs1 = db1.executeQuery(sql1);
 	ResultSet rs2 = db1.executeQuery(sql2);
 %>
				<form name="forma" method="post" action="o_rk.jsp"
					onsubmit="return isValid();">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="0">

						<tr>
							<td><table width="100%" border="0" cellpadding="5"
									cellspacing="1" bgcolor="#a8c7ce">
									<tr>
										<td colspan=2 bgcolor="d3eaef" height="40"><div
												align="center">
												<span class="STYLE10">添加货品入库</span>
												<input type="hidden" name="time" value=<%=time %>>
											</div></td>
									</tr>
									<tr>
										<td bgcolor="#FFFFFF" align="right"><span class="STYLE10">原料名称:</span></td>
										<td bgcolor="#FFFFFF" align="left"><select
											name="materialid">
												<option value="">请选择</option>
												<%
												while(rs2.next())
												{
													materialid = rs2.getInt("material_id");
													materialname = rs2.getString("material_name");
												%>
												<option value="<%=materialid%>"><%=materialid+":"+materialname%></option>
												<%
												}
												rs2.close();
												%>
										</select></td>
									</tr>
									<tr>
										<td bgcolor="#FFFFFF" align="right"><span class="STYLE10">计划编号:</span></td>
										<td bgcolor="#FFFFFF" align="left"><select
											name="orderid">
												<option value="">请选择..</option>
												<%
												while(rs1.next())
												{
													orderid = rs1.getInt("order_id");
												%>
												<option value="<%=orderid%>"><%=orderid%></option>
												<%
												}
												rs1.close();
												%>
										</select></td>
									</tr>									

									<tr>
									</tr>
									<tr>
										<td bgcolor="#FFFFFF" align="right"><span class="STYLE10">存放位置:</span></td>
										<td bgcolor="#FFFFFF" align="left"><select
											name="areA">
												<option value="">请选择..</option>
												<option value="<%="A"%>"><%="A"%></option>
												<option value="<%="B"%>"><%="B"%></option>
												<option value="<%="C"%>"><%="C"%></option>
												<option value="<%="D"%>"><%="D"%></option>
												<option value="<%="E"%>"><%="E"%></option>												
										</select> 区&nbsp;&nbsp;<select name="areB">
												<option value="">请选择..</option>
												<option value="<%=1%>"><%=1%></option>
												<option value="<%=2%>"><%=2%></option>
												<option value="<%=3%>"><%=3%></option>
												<option value="<%=4%>"><%=4%></option>
												<option value="<%=5%>"><%=5%></option>
										</select>&nbsp;柜<span class="STYLE10"></td>
									</tr>


									<tr>
										<td colspan="2" align="center" class="STYLE6" bgcolor="d3eaef">
											<input type="submit" value="保存">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" value="重置">
										</td>
									</tr>
								</table></td>
						</tr>
					</table>
					
				</form> <!--  end 主区-->
			</td>
			<td width="8" bgcolor="#353c44">&nbsp;</td>
		</tr>
	</table>
</body>
</html>
