<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>出库</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
	 function isValid() 
{

 
 	 if(document.forma.s_cname.value=="")
	 {
		 alert("请输入提货人(公司) ！"); 
		 document.forma.s_cname.focus();
		 return false;
	 }
	 if(document.forma.s_tel.value=="")
	 {
		 alert("请输入提货人(公司) 联系电话 ！"); 
		 document.forma.s_tel.focus();
		 return false;
	 }
	 if(document.forma.sums.value=="")
	 {
		 alert("请输入出库　数量 ！"); 
		 document.forma.sums.focus();
		 return false;
	 }
 
		if (confirm("您确定要出库吗？"))
	{
			document.form1.submit();
	}
	else
	{
		return false;
	}
}

function kasbf(a)
{
	c="kasb.jsp?rec_id="+a;
	window.open(c,"bodykannews","toolbar=no,status=no,scrollbars=yes,menubar=no,location=no,top=100,resizable=no,left=250,width=650,height=430")
}
function xd(rec_id){
    
	 
 	document.forma.action="xd_2.jsp?rec_id="+vid;
	document.forma.submit();
	 
}


		

	function sumarea( min, max, value, com){
		if(value == '') return;
		if(value < min || value > max){
			alert(' 出库数量只允许输入： ' + min +' 至 ' + max+'之间！');

			com.focus();
		}
	}
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
<%
String 	  h_wnum=(String)session.getAttribute("wnum");//获取工作证号

String rec_id=new String(request.getParameter("rec_id").trim().getBytes("8859_1"));

String sbname="",wnum="";
String typename="";
int sbsums=0,types_rec_id=0;
String addtime="";
String remark="",xx="",yy="",dw="";
String sql2="select * from sb_info  where  rec_id='"+rec_id+"'";

ResultSet rs2=dep.executeQuery(sql2);

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
					wnum=rs2.getString("wnum");
					addtime=rs2.getString("addtime");


%>
<center>
<form name="forma" method="post" action="ck2.jsp"  onsubmit="return isValid();" >
	<input type="hidden" name="rec_id" value="<%=rec_id%>">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#a8c7ce"  >
			  <tr>
				<td    colspan=2 bgcolor="d3eaef" height="40"><div align="center"><span class="STYLE10"> 货品出库信息</span></div></td>
			  </tr>
			  <tr>
				<td  bgcolor="#FFFFFF"align="right"><span class="STYLE10">货品名称:</span></td>
				<td  bgcolor="#FFFFFF" align="left"><font size=2 color="#6633CC"><%=sbname%></font></td>
			  </tr>
			  <tr>
				<td  bgcolor="#FFFFFF" align="right"><span class="STYLE10">货品类型:</span></td>
				<td  bgcolor="#FFFFFF" align="left"><font size=2 color="#6633CC"><%=sbname%></font></td>
			  </tr>
			  <tr>
				<td  bgcolor="#FFFFFF"align="right"><span class="STYLE10">数量:</span></td>
				<td  bgcolor="#FFFFFF" align="left"><font size=2 color="#6633CC"><%=sbsums%></font></td>
			  </tr>
			  <tr>
				<td  bgcolor="#FFFFFF"align="right"><span class="STYLE10">单位:</span></td>
				<td  bgcolor="#FFFFFF" align="left"><font size=2 color="#6633CC"><%=dw%></font></td>
			  </tr>
			  <tr>
				<td  bgcolor="#FFFFFF"align="right"><span class="STYLE10">存放位置:</span></td>
				<td  bgcolor="#FFFFFF" align="left"><font size=2 color="#6633CC"><%=xx%>  区&nbsp;&nbsp; <%=yy%>&nbsp;柜</font>  </td>
			  </tr>
			  <tr  >
				<td bgcolor="#FFFFFF"  align="right"><span class="STYLE10">提货人(公司):</span></td>
				<td bgcolor="#FFFFFF"  align="left"><input type="text" name="s_cname" maxlength="80" size="30" value="" class="input"> 
				</td>
			  </tr> 
			  <tr   >
				<td  bgcolor="#FFFFFF" align="right"><span class="STYLE10">联系电话:</span></td>
				<td  bgcolor="#FFFFFF" align="left">
				<input type="text" name="s_tel" maxlength="80" size="15" value="" class="input"> 
				</td>
			  </tr>
			  <tr>
				<td   bgcolor="#FFFFFF" align="right"><span class="STYLE10">出库数量:</span></td>
				<td   bgcolor="#FFFFFF" align="left"><input type="text" name="sums" maxlength="10" size="10" value=""  onblur="sumarea(1, <%=sbsums%>, this.value, this)"  onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')"  class="input">&nbsp;<font size=2 color="#6633CC"><%=dw%></font></td>
			  </tr>
			  <tr>
				<td   bgcolor="#FFFFFF" align="right"><span class="STYLE10">出库人ID:</span></td>
				<td   bgcolor="#FFFFFF" align="left"><font size=2 color="#6633CC"><%=h_wnum%></font></td>
			  </tr>
			  <tr> 
					<td colspan="2" align="center" bgcolor="#FFFFFF"><input type="submit" value="确定出库"></td>
			  </tr>
		</table>
	</td>
  </tr>
 </table>
 </form>
		</center>
<%


}
rs2.close();
%>
<br>
<br>
<center>
<input onclick="window.opener=null;window.close()" type="button" value=" 关闭 ">
</center>
</form>
</body>
</html>
