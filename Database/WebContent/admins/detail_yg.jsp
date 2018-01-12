<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>
<html>
<head>

<SCRIPT LANGUAGE="JavaScript">
	function del(supplierid, materialid) {
		if (confirm("确定删除该原料吗?")) {
			c = "d_yg3.jsp?del=" + supplierid + "&del2=" + materialid;
			window
					.open(
							c,
							"bodyt31f",
							"toolbar=no,status=no,scrollbars=yes,menubar=no,location=no,top=190,resizable=no,left=250,width=540,height=400")
		}
	}

	function detail2(supplierid, materialid) {
		c = "update_yg.jsp?detail= " + supplierid + " &detail2= " + materialid;
		window
				.open(
						c,
						"bodyt31f",
						"toolbar=no,status=no,scrollbars=yes,menubar=no,location=no,top=190,resizable=no,left=250,width=540,height=400")
	}
	function detail(supplierid) {
		c = "update_yg2.jsp?detail= " + supplierid;
		window
				.open(
						c,
						"bodyt31f",
						"toolbar=no,status=no,scrollbars=yes,menubar=no,location=no,top=190,resizable=no,left=250,width=540,height=400")
	}
</SCRIPT>


<title>查看供应商详情</title>

</head>

<body>

	<jsp:useBean id="db1" scope="page" class="ck.ck" />
	<jsp:useBean id="db2" scope="page" class="ck.ck" />
	<%
		String supplierid= null;
		supplierid = request.getParameter("detail");
		if(supplierid == null||supplierid == "")
			supplierid = (String)session.getAttribute("supplierid");
		session.putValue("supplierid", supplierid);
		int pageLine = 5;
		int totalRec = 0;
		int intPage = 1;
		int i;
		if (request.getParameter("page") != null)
			intPage = Integer.parseInt(request.getParameter("page"));
		try {
			ResultSet countrs = null;
			countrs = db1
					.executeQuery("select count(*) as num from supply_detail where supplier_id = " + supplierid);

			if (countrs.next())
				totalRec = countrs.getInt("num");
			countrs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		int intPageCount = 0;
		intPageCount = (totalRec + pageLine - 1) / pageLine;

		String sql1 = "select * from Supplier where supplier_id = " + supplierid;
		String sql2 = "select * from supply_detail where supplier_id =" + supplierid + " limit " + (intPage - 1) * 5
				+ "," + 5;		
		String address = "", phone = "", email = "", materialname = "", suppliername = "";
		int materialid = 0, price = 0;

		ResultSet rs1 = db1.executeQuery(sql1);
		if (rs1.next()) {
			suppliername = rs1.getString("supplier_name");
			address = rs1.getString("address");
			email = rs1.getString("email");
			phone = rs1.getString("phone");
		}
		rs1.close();
		ResultSet rs2 = db1.executeQuery(sql2);
	%>
	<center>

		<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="0">

			<tr>
				<td><table width="100%" border="0" cellpadding="5"
						cellspacing="1" bgcolor="#a8c7ce">
						<tr>
							<td colspan=5 align="center" bgcolor="d3eaef"><B><font
									size="5"><%=suppliername%></font></B> <br></td>
						</tr>
						<tr>
							<td width="5%" bgcolor="#FFFFFF"><div align="left">
									<span class="STYLE10">地址:</span>
								</div></td>
							<td colspan=4 width="25%" bgcolor="#FFFFFF"><div
									align="left">
									<span class="STYLE10"><%=address%></span>
								</div></td>
						</tr>
						<tr>
							<td width="5%" bgcolor="#FFFFFF"><div align="left">
									<span class="STYLE10">邮件:</span>
								</div></td>
							<td colspan=4 width="25%" bgcolor="#FFFFFF"><div
									align="left">
									<span class="STYLE10"><%=email%></span>
								</div></td>
						</tr>
						<tr>
							<td width="5%" bgcolor="#FFFFFF"><div align="left">
									<span class="STYLE10">电话:</span>
								</div></td>
							<td colspan=4 width="25%" bgcolor="#FFFFFF"><div
									align="left">
									<span class="STYLE10"><%=phone%></span>
								</div></td>
						</tr>
						<tr>
							<td colspan=5 bgcolor="#FFFFFF" align="center"><a
								HREF="javascript:detail('<%=supplierid%>')">修改</a></td>
						</tr>
						<tr>
							<td colspan=5 bgcolor="#FFFFFF"><div align="center">
									<span class="STYLE10"><B><font size="5">提供原料</font></B></span>
								</div></td>
						</tr>
						<%
							while (rs2.next()) {
								materialid = rs2.getInt("material_id");
								materialname = rs2.getString("material_name");
								price = rs2.getInt("price");
						%>
						<tr>
							<td bgcolor="#FFFFFF" align="center"><span class="STYLE10"><%=materialid%></span></td>
							<td bgcolor="#FFFFFF" align="center"><span class="STYLE10"><%=materialname%></span></td>
							<td bgcolor="#FFFFFF" align="center"><span class="STYLE10"><%=price%></span></td>
							<td bgcolor="#FFFFFF" align="center"><a
								HREF="javascript:detail2('<%=supplierid%>','<%=materialid%>')">修改</a></td>
							<td bgcolor="#FFFFFF" align="center"><a
								HREF="javascript:del('<%=supplierid%>','<%=materialid%>')">删除</a></td>
						</tr>
						<%
							}
							rs2.close();
						%>
					</table></td>
			</tr>
		</table>
	</center>
	<%
		out.print("<center><table " + "width=600 " + " valign=bottom>");
		out.print("<tr>");
		if (intPageCount * pageLine < totalRec)
			intPageCount++;
		if (intPage > intPageCount)
			intPage = intPageCount;
		if (intPage < 1)
			intPage = 1;
		out.print("<form method='post' name=fPageNum action='detail_yg.jsp'>");
		if (intPage < 2)
			out.print("首页 上一页  ");
		else {
			out.print("<a href='detail_yg.jsp?page=1' ><font color='#3300FF' size='2'>首页</font></a>&nbsp;");
			out.print("<a href='detail_yg.jsp?page=" + (intPage - 1)
					+ "' ><font color='#3300FF' size='2'>上一页</font></a>&nbsp; ");
		}
		if (intPage - intPageCount >= 0)
			out.print("下一页 尾页");
		else {
			out.print("<a href='detail_yg.jsp?page=" + (intPage + 1)
					+ "'><font color='#3300FF' size='2'>下一页</font></a>&nbsp;<a href='detail_yg.jsp?page="
					+ intPageCount + "'><font color='#3300FF' size='2'>尾页</font></a>&nbsp;");
		}
		out.print(" 页次:<font color=red>" + intPage + "</font>/<font color=red>" + intPageCount + "</font>页 ");
		out.print("共<font color=red>" + totalRec + "</font>条记录  <font color=red>" + pageLine + "</font>条/页");
		out.print(
				"  转到第<input type='text' name='page' size=2 maxlength=10  class=smallInput value=" + intPage + ">");
		out.print("页<input class=buttonface type='submit' value='GO' name='cndok'></span></p></form>");
		out.print("</tr>");
		out.print("</table></center>");
	%>
	
</body>
</html>
