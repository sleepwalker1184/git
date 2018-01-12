<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>
<html>
<head>
<title>更改供货商详情</title>
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
		String supplierid = new String(request.getParameter("detail"));
		String materialid = new String(request.getParameter("detail2"));
		String sql2 = "select * from supply_detail where supplier_id = " + supplierid + " and material_id = "
				+ materialid;
		String sql3 = "select * from base_material";

		int price, repu;
		String suppliername = "", materialname = "", address = "", email = "", phone = "", repulevel = "";

		ResultSet rs2 = db1.executeQuery(sql2);
		ResultSet rs3 = db1.executeQuery(sql3);
		int temmaterialid = 0, temmaterialid2 = 0;
		String temmaterialname = "";

		if (rs2.next()) {
			suppliername = rs2.getString("supplier_name");
			materialname = rs2.getString("material_name");
			address = rs2.getString("address");
			email = rs2.getString("email");
			phone = rs2.getString("phone");
			price = rs2.getInt("price");
			repu = rs2.getInt("reputation_level");
			temmaterialid2 = rs2.getInt("material_id");

			switch (repu) {
			case 15: {
				repulevel = "A+";
				break;
			}
			case 14: {
				repulevel = "A";
				break;
			}
			case 13: {
				repulevel = "A-";
				break;
			}
			case 12: {
				repulevel = "B+";
				break;
			}
			case 11: {
				repulevel = "B";
				break;
			}
			case 10: {
				repulevel = "B-";
				break;
			}
			case 9: {
				repulevel = "C+";
				break;
			}
			case 8: {
				repulevel = "C";
				break;
			}
			case 7: {
				repulevel = "C-";
				break;
			}
			case 6: {
				repulevel = "D+";
				break;
			}
			case 5: {
				repulevel = "D";
				break;
			}
			case 4: {
				repulevel = "D-";
				break;
			}
			case 3: {
				repulevel = "E+";
				break;
			}
			case 2: {
				repulevel = "E";
				break;
			}
			case 1: {
				repulevel = "E-";
				break;
			}
			default: {
				repulevel = "F";
				break;
			}
			}
	%>
	<br>
	<center>
		<form name="forma" method="post" action="okupdate_yg.jsp"
			onsubmit="return isValid();">
			<input type="hidden" name="oldma" value="<%=materialid%>"> <input
				type="hidden" name="supplierid" value="<%=supplierid%>">
			<table width="80%" border="0" align="center" cellpadding="0"
				cellspacing="0">

				<tr>
					<td><table width="100%" border="0" cellpadding="5"
							cellspacing="1" bgcolor="#a8c7ce">
							<tr>
								<td colspan=2 bgcolor="d3eaef" height="30"><div
										align="center">
										<span class="STYLE10">修改供货商信息</span>
									</div></td>
							</tr>


							<tr>
								<td bgcolor="#FFFFFF">
									<div align="right">
										<span class="STYLE10">供货商编号:</span></strong>
									</div>
								</td>
								<td bgcolor="#FFFFFF"><span clasee="STYLE10"><%=supplierid%></span>
								</td>
							</tr>

							<tr>
								<td bgcolor="#FFFFFF">
									<div align="right">
										<span class="STYLE10">供货商名:</span></strong>
									</div>
								</td>
								<td bgcolor="#FFFFFF"><span class="STYLE10"><%=suppliername%></span></td>
							</tr>

							<tr>
								<td bgcolor="#FFFFFF">
									<div align="right">
										<span class="STYLE10">原料:</span></strong>
									</div>
								</td>
								<td bgcolor="#FFFFFF"><select name="materialid">
										<option value=<%=materialid%>><%=materialid + ": " + materialname%></option>
										<%
											while (rs3.next()) {
													temmaterialid = rs3.getInt("material_id");
													temmaterialname = rs3.getString("material_name");
													if (temmaterialid == temmaterialid2)
														continue;
										%>
										<option value=<%=temmaterialid%>><%=temmaterialid + ": " + temmaterialname%>
										</option>
										<%
											}
										%>
								</select></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF">
									<div align="right">
										<span class="STYLE10">价格:</span></strong>
									</div>
								</td>
								<td bgcolor="#FFFFFF"><input type="text" name="price"
									value="<%=price%>"></td>
							</tr>							
							<%-- <tr>
								<td bgcolor="#FFFFFF">
									<div align="right">
										<span class="STYLE10">信誉等级:</span></strong>
									</div>
								</td>
								<td bgcolor="#FFFFFF"><span clasee="STYLE10"><%=repulevel%></span>
								</td>
							</tr> --%>

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
