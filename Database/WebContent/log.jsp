
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>..</title>
<style type="text/css">
<!--
@import url("_notes/bbb.css");
-->
</style>
</head>

<body>

	<%@ page contentType="text/html; charset=gb2312"%>
	<%@ page language="java" import="java.sql.*"%>
	<jsp:useBean id="db1" scope="page" class="ck.ck" />
	<jsp:useBean id="db2" scope="page" class="ck.ck" />
	<%
		String wnum = new String(request.getParameter("wnum").trim().getBytes("8859_1"));
		String spswd = new String(request.getParameter("word").trim().getBytes("8859_1"));

		int yes = 0;

		int tpri = 0;//获取员工权限

		//获取系统开关，在后台是否有关闭它
		int act = 0;//整个系统
		int teac = 0;//员工
		int stu = 0;//会员
		ResultSet rs2 = db1.executeQuery("select * from employee");
		if (rs2.next()) {
			act = rs2.getInt("actlevel");
		}
		rs2.close();

		//验证管理员
		String lsql = "select * from employee where employee_username='" + wnum + "' and  employee_password= '"
				+ spswd + "'";
		ResultSet lrs = db1.executeQuery(lsql);

 		if (lrs.next())//是管理员（员工，专家，领导) 员工名，密码正确
		{
			lrs.close();

			session.setAttribute("wnum", wnum);
			response.sendRedirect("admins/main.jsp");

		} 
		else
			lrs.close(); 

		if (yes == 0)//验证是否合法权限 
		{
	%>
	<script>
		window.alert("你输入的用户名，或者密码有错!");
		history.back();		
	</script>
	<%
		}
	%>
</body>