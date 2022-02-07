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
<h1 style="text-align:center;">주문 목록(주문일자별 수량 및 금액 합계)</h1>
<table border=1 style="margin:0 auto; width:50%;">
<tr>
<th>no</th>
<th>주문일자</th>
<th>주문수량</th>
<th>주문금액</th>
</tr>

<%
	int no=0;
	int sum=0;
	int sum1=0;
	pstmt=conn.prepareStatement("select to_char(orderdate,'yyyy-mm-dd'),sum(orderqty),sum(unitprice*orderqty) from order0203 group by orderdate");
	rs=pstmt.executeQuery();
	while(rs.next()){
		String orderdate=rs.getString(1);
		int orderqrt=rs.getInt(2);
		int unitprice=rs.getInt(3);
		sum += orderqrt;
		sum1 += unitprice;
		no++;
	
	
%>
<tr>
<td align=center><%=no %></td>
<td align=center><%=orderdate %></td>
<td align=center><%=fo.format(orderqrt) %></td>
<td align=center><%=fo.format(unitprice) %></td>
</tr>


<%} %>

<tr>
<td colspan=2 align=center>합계</td>
<td align=center><%=fo.format(sum) %></td>
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