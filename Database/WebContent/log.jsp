
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

		int tpri = 0;//��ȡԱ��Ȩ��

		//��ȡϵͳ���أ��ں�̨�Ƿ��йر���
		int act = 0;//����ϵͳ
		int teac = 0;//Ա��
		int stu = 0;//��Ա
		ResultSet rs2 = db1.executeQuery("select * from employee");
		if (rs2.next()) {
			act = rs2.getInt("actlevel");
		}
		rs2.close();

		//��֤����Ա
		String lsql = "select * from employee where employee_username='" + wnum + "' and  employee_password= '"
				+ spswd + "'";
		ResultSet lrs = db1.executeQuery(lsql);

 		if (lrs.next())//�ǹ���Ա��Ա����ר�ң��쵼) Ա������������ȷ
		{
			lrs.close();

			session.setAttribute("wnum", wnum);
			response.sendRedirect("admins/main.jsp");

		} 
		else
			lrs.close(); 

		if (yes == 0)//��֤�Ƿ�Ϸ�Ȩ�� 
		{
	%>
	<script>
		window.alert("��������û��������������д�!");
		history.back();		
	</script>
	<%
		}
	%>
</body>