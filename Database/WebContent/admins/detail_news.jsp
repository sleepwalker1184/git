<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>
<html>
<head>

<SCRIPT LANGUAGE="JavaScript">
	function del(orderid, materialid) {
		if (confirm("ȷ��ɾ���ü�¼��?")) {
			c = "d_news.jsp?del=" + orderid + "&del2=" + materialid;
			window
					.open(
							c,
							"bodyt31f",
							"toolbar=no,status=no,scrollbars=yes,menubar=no,location=no,top=190,resizable=no,left=250,width=540,height=400")
		}
	}

	function detail2(orderid, materialid) {
		c = "update_news.jsp?detail= " + orderid + " &detail2= " + materialid;
		window
				.open(
						c,
						"bodyt31f",
						"toolbar=no,status=no,scrollbars=yes,menubar=no,location=no,top=190,resizable=no,left=250,width=540,height=400")
	}
	function detail(orderid) {
		c = "update_dep.jsp?detail= " + orderid;
		window
				.open(
						c,
						"bodyt31f",
						"toolbar=no,status=no,scrollbars=yes,menubar=no,location=no,top=190,resizable=no,left=250,width=540,height=400")
	}
</SCRIPT>


<title>�鿴�ɹ�����</title>

</head>

<body>

	<jsp:useBean id="db1" scope="page" class="ck.ck" />
	<jsp:useBean id="db2" scope="page" class="ck.ck" />
	<%
		String orderid = request.getParameter("detail");
		int pageLine = 5;
		int totalRec = 0;
		int intPage = 1;
		int i;
		if (request.getParameter("page") != null)
			intPage = Integer.parseInt(request.getParameter("page"));
		try {
			ResultSet countrs = null;
			countrs = db1.executeQuery("select count(*) as num from purchase_detail where order_id = " + orderid);

			if (countrs.next())
				totalRec = countrs.getInt("num");
			countrs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		int intPageCount = 0;
		intPageCount = (totalRec + pageLine - 1) / pageLine;
		String sql2 = "select * from purchase_detail where order_id =" + orderid + " limit " + (intPage - 1) * 5
				+ "," + 5;
		String materialname = "", suppliername = "", trans = "", transstatus = "";
		int materialid = 0, supplierid = 0, num = 0, price = 0;

		ResultSet rs2 = db1.executeQuery(sql2);
	%>
	<center>

		<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="0">

			<tr>
				<td><table width="100%" border="0" cellpadding="5"
						cellspacing="1" bgcolor="#a8c7ce">
						<tr>
							<td colspan=10 align="center" bgcolor="d3eaef"><B><font
									size="5"><%=orderid%></font></B> <br></td>
						</tr>

						<tr>
							<td colspan=10 bgcolor="#FFFFFF"><div align="center">
									<span class="STYLE10"><B><font size="5">ԭ�϶���</font></B></span>
								</div></td>
						</tr>
						<%
							while (rs2.next()) {
								materialid = rs2.getInt("material_id");
								materialname = rs2.getString("material_name");
								supplierid = rs2.getInt("supplier_id");
								suppliername = rs2.getString("supplier_name");
								num = rs2.getInt("number");
								price = rs2.getInt("totalprice");
								trans = rs2.getString("TransWay");
								transstatus = rs2.getString("TransStatus");
						%>
						<tr>
							<td bgcolor="#FFFFFF" align="center"><span class="STYLE10"><%=materialname%></span></td>
							<td bgcolor="#FFFFFF" align="center"><span class="STYLE10"><%=suppliername%></span></td>
							<td bgcolor="#FFFFFF" align="center"><span class="STYLE10"><%=num%></span></td>
							<td bgcolor="#FFFFFF" align="center"><span class="STYLE10"><%=price%></span></td>
							<td bgcolor="#FFFFFF" align="center"><span class="STYLE10"><%=trans%></span></td>
							<td bgcolor="#FFFFFF" align="center"><span class="STYLE10"><%=transstatus%></span></td>
							<td bgcolor="#FFFFFF" align="center"><a
								HREF="javascript:detail2('<%=orderid%>','<%=materialid%>')">�޸�</a></td>
							<td bgcolor="#FFFFFF" align="center"><a
								HREF="javascript:del('<%=orderid%>','<%=materialid%>')">ɾ��</a></td>
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
		out.print("<form method='post' name=fPageNum action='detail.news.jsp.jsp'>");
		if (intPage < 2)
			out.print("��ҳ ��һҳ  ");
		else {
			out.print("<a href='detail.news.jsp.jsp?page=1' ><font color='#3300FF' size='2'>��ҳ</font></a>&nbsp;");
			out.print("<a href='detail.news.jsp.jsp?page=" + (intPage - 1)
					+ "' ><font color='#3300FF' size='2'>��һҳ</font></a>&nbsp; ");
		}
		if (intPage - intPageCount >= 0)
			out.print("��һҳ βҳ");
		else {
			out.print("<a href='detail.news.jsp.jsp?page=" + (intPage + 1)
					+ "'><font color='#3300FF' size='2'>��һҳ</font></a>&nbsp;<a href='detail.news.jsp.jsp?page="
					+ intPageCount + "'><font color='#3300FF' size='2'>βҳ</font></a>&nbsp;");
		}
		out.print(" ҳ��:<font color=red>" + intPage + "</font>/<font color=red>" + intPageCount + "</font>ҳ ");
		out.print("��<font color=red>" + totalRec + "</font>����¼  <font color=red>" + pageLine + "</font>��/ҳ");
		out.print(
				"  ת����<input type='text' name='page' size=2 maxlength=10  class=smallInput value=" + intPage + ">");
		out.print("ҳ<input class=buttonface type='submit' value='GO' name='cndok'></span></p></form>");
		out.print("</tr>");
		out.print("</table></center>");
	%>
	
</body>
</html>
