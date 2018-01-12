<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>出库</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
 
// -->
</SCRIPT>
</head>
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
	overflow:hidden;
}
.STYLE1 {
	color: #e1e2e3;
	font-size: 12px;
}
.STYLE6 {color: #000000; font-size: 12; }
.STYLE10 {color: #000000; font-size: 12px; }
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
.STYLE4 {font-size: 12px}
.STYLE5 {font-size: 12px; font-weight: bold; }
-->
</style>
<body >

<jsp:useBean id="dep" scope="page" class="ck.ck"/>
<jsp:useBean id="db1" scope="page" class="ck.ck"/>
<jsp:useBean id="db2" scope="page" class="ck.ck"/>
<jsp:useBean id="db3" scope="page" class="ck.ck"/>

<%
 

String 	  h_wnum=(String)session.getAttribute("wnum");//获取工作证号

String rec_id=new String(request.getParameter("rec_id").trim().getBytes("8859_1"));
 
String s_cname=new String(request.getParameter("s_cname").trim().getBytes("8859_1"));
String s_tel=new String(request.getParameter("s_tel").trim().getBytes("8859_1"));
String sums=new String(request.getParameter("sums").trim().getBytes("8859_1"));

String sbname="",wnum="";
String typename="";
int sbsums=0,types_rec_id=0;
String addtime="";
String remark="",xx="",yy="",dw="";



 
ResultSet rs2=dep.executeQuery("select * from sb_info  where  rec_id='"+rec_id+"'");

if (rs2.next())
{
					sbname=rs2.getString("sbname");
					types_rec_id=rs2.getInt("types_rec_id");
					ResultSet rs5=db1.executeQuery("select * from types where rec_id='"+types_rec_id+"' ");
								if(rs5.next())
								{
									typename=rs5.getString("typename");
								}
								rs5.close();
 					sbsums=rs2.getInt("sbsums");

					dw=rs2.getString("dw");
					remark=rs2.getString("remark");
					xx=rs2.getString("xx");
					yy=rs2.getString("yy");
}
rs2.close();

db2.executeUpdate("update sb_info set sbsums=sbsums-"+sums+" where rec_id='"+rec_id+"'");//将库存数减去出库数
String sql2="insert into ck(sbname,sbtypename ,remark,s_cname ,s_tel ,sums,wnum )values('"+sbname+"','"+typename+"','"+remark+"','"+s_cname+"','"+s_tel+"','"+sums+"','"+h_wnum+"')";
db2.executeUpdate(sql2);
 

ResultSet rs5=db1.executeQuery("select  top 1 * from ck order by rec_id desc  ");
String timses="";
int maxrec_id=0;
if(rs5.next())
{
	maxrec_id=rs5.getInt("rec_id");
	timses=rs5.getString("addtime");
}
rs5.close();
			%>
<center>
<form name="forma" method="post" action="ck3.jsp"  onsubmit="return isValid();" >
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#a8c7ce"  >
			  <tr>
				<td    colspan=2 bgcolor="d3eaef" height="40"><div align="center"><span class="STYLE10"> 货品出库信息单<%=maxrec_id%></span></div><input type="button" onclick="javascript:window.print()" value="打印"></td>
			  </tr>
			  <tr>
				<td  bgcolor="#FFFFFF"align="right"><span class="STYLE10">货品名称:</span></td>
				<td  bgcolor="#FFFFFF" align="left"><font size=2 color="#6633CC"><%=sbname%></font></td>
			  </tr>
			  <tr>
				<td  bgcolor="#FFFFFF" align="right"><span class="STYLE10">货品类型:</span></td>
				<td  bgcolor="#FFFFFF" align="left"><font size=2 color="#6633CC"><%=typename%></font></td>
			  </tr>
			  <tr>
				<td  bgcolor="#FFFFFF"align="right"><span class="STYLE10">数量:</span></td>
				<td  bgcolor="#FFFFFF" align="left"><font size=2 color="#6633CC"><%=sums%></font></td>
			  </tr>
			  <tr>
				<td  bgcolor="#FFFFFF"align="right"><span class="STYLE10">单位:</span></td>
				<td  bgcolor="#FFFFFF" align="left"><font size=2 color="#6633CC"><%=dw%></font></td>
			  </tr>
 
			  <tr  >
				<td bgcolor="#FFFFFF"  align="right"><span class="STYLE10">提货人(公司):</span></td>
				<td bgcolor="#FFFFFF"  align="left"><font size=2 color="#6633CC"><%=s_cname%></font> 
				</td>
			  </tr> 
			  <tr   >
				<td  bgcolor="#FFFFFF" align="right"><span class="STYLE10">联系电话:</span></td>
				<td  bgcolor="#FFFFFF" align="left">
				<font size=2 color="#6633CC"><%=s_tel%></font>
				</td>
			  </tr>
			  <tr>
				<td   bgcolor="#FFFFFF" align="right"><span class="STYLE10">出库数量:</span></td>
				<td   bgcolor="#FFFFFF" align="left"><font size=2 color="#6633CC"><%=sums%></font></td>
			  </tr>
			  <tr>
				<td   bgcolor="#FFFFFF" align="right"><span class="STYLE10">出库人ID:</span></td>
				<td   bgcolor="#FFFFFF" align="left"><font size=2 color="#6633CC"><%=h_wnum%></font></td>
			  </tr>
			   <tr>
				<td   bgcolor="#FFFFFF" align="right"><span class="STYLE10">出库时间:</span></td>
				<td   bgcolor="#FFFFFF" align="left"><font size=2 color="#6633CC"><%=timses.substring(0,19)%></font></td>
			  </tr>
			  <tr> 
					<td colspan="2" align="center" bgcolor="#FFFFFF"></td>
			  </tr>
			  <tr>
				<td    colspan=2 bgcolor="d3eaef" height="40" align="center"> <input type="submit" value="结-束"></td>
			  </tr>
		</table>
	</td>
  </tr>
 </table>
 </form>
		</center>
 
<br>
 
</form>
</body>
</html>
