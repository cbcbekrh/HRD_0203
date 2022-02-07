<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section>
<%
	int cnt=0;
	pstmt=conn.prepareStatement("select count(*) from order0203");
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}
%>
<h1 style="text-align:center;">주문 목록</h1>
<p style="padding-left:100px">총 <%=cnt %>개의 주문정보가 있습니다.</p><hr>
<table border=1 style="margin:0 auto; width:95%;">
<tr>
<th>no</th>
<th>주문일자</th>
<th>주문자성명</th>
<th>상품번호</th>
<th>상품명</th>
<th>단가</th>
<th>주문수량</th>
<th>주문자주소</th>
<th>구분</th>
</tr>

<%
	int no=0;
	pstmt=conn.prepareStatement("select a.*,b.name from order0203 a, product0203 b where a.productid=b.productid");
	rs=pstmt.executeQuery();
	while(rs.next()){
		String orderdate=rs.getString("orderdate");
		String ordername=rs.getString("ordername");
		String productid=rs.getString("productid");
		String unitprice=rs.getString("unitprice");
		String orderqty=rs.getString("orderqty");
		String orderaddress=rs.getString("orderaddress");
		String name=rs.getString("name");
		String A = orderdate.substring(0,10);
		no++;		
%>


<tr>
<td align=center><%=no %></td>
<td align=center><%=A %></td>
<td align=center><%=ordername %></td>
<td align=center><%=productid %></td>
<td align=center><%=name %></td>
<td align=center><%=unitprice %></td>
<td align=center><%=orderqty %></td>
<td align=center><%=orderaddress %></td>
<td align=center>
	<a href="orderUpdate.jsp
	?orderdate=<%=A %>
	&ordername=<%=ordername %>
	&productid=<%=productid %>
	&address=<%=orderaddress %>
	&orderqty=<%=orderqty %>
	">수정</a> /
	<a href="orderDelete.jsp
	?orderdate=<%=A %>
	&ordername=<%=ordername %>
	 "onclick="if(!confirm('정말 삭제하시겠습니까?'))return false;">삭제</a>
</td>
</tr>
<%} %>
</table>
<div style="text-align:center; padding-top:15px;">
	<input id="b" type="button" value="작성" onclick="location.href='orderInsert.jsp'">
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>