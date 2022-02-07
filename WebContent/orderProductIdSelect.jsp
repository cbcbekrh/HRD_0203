<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	DecimalFormat fo=new DecimalFormat("###,###");	
%>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section>
<h1 style="text-align:center;">주문 목록(상품별)</h1>
<table border=1 style="margin:0 auto; width:50%;">
<tr>
<th>no</th>
<th>상품번호</th>
<th>상품명</th>
<th>주문수량</th>
<th>주문금액</th>
</tr>

<%
	int no=0;
	int sum=0;
	int sum1=0;
	pstmt=conn.prepareStatement("select a.productid,b.name,sum(a.orderqty),sum(a.unitprice*a.orderqty) from order0203 a,product0203 b where a.productid=b.productid group by a.productid,b.name");
	rs=pstmt.executeQuery();
	while(rs.next()){
	no++;
	sum += rs.getInt(3);
	sum1 += rs.getInt(4);

%>
<tr>
<td align=center><%=no %></td>
<td align=center><%=rs.getString(1) %></td>
<td align=center><%=rs.getString(2) %></td>
<td align=center><%=rs.getInt(3) %></td>
<td align=center><%=fo.format(rs.getInt(4)) %></td>
</tr>
<%} %>
<tr>
<td colspan=3 align=center>합계</td>
<td align=center><%=sum %></td>
<td align=center><%=fo.format(sum1) %></td>
</tr>
</table>
<div style="text-align:center; padding-top:10px;">
	<input id="b" type="button" value="작성">
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>