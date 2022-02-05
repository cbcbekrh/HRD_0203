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
<h1 style="text-align:center;">상품 목록</h1>
<%
	int cnt=0;
	pstmt=conn.prepareStatement("select count(*) from product0203");
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}
	
%>
<p style="padding-left:100px;">총 <%=cnt %>개의 상품이 있습니다.</p><hr>

<table border=1 style="margin:0 auto; width:95%;">
<tr>
<th>상품코드</th>
<th>상품명</th>
<th>단가</th>
<th>상세정보</th>
<th>제조사</th>
<th>분류</th>
<th>재고수</th>
<th>상태</th>
<th>구분</th>
</tr>

<%
	pstmt=conn.prepareStatement("select * from product0203");
	rs=pstmt.executeQuery();
	while(rs.next()){
		String productid=rs.getString("productid");
		String name=rs.getString("name");
		String unitprice=rs.getString("unitprice");
		String description=rs.getString("description");
		String category=rs.getString("category");
		String manufacturer=rs.getString("manufacturer");
		String unitsinstock=rs.getString("unitsinstock");
		String condition=rs.getString("condition");
		if(category.equals("10")){
			category="it제품";
		}else if(category.equals("20")){
			category="주방제품";
		}else if(category.equals("30")){
			category="전자제품";
		}else{
			category="일반잡화";
		}
		
	

%>
<tr>
<td align=center><a style="text-decoration:none;" href="productUpdate.jsp?productid=<%=productid %>"><%=productid %></a></td>
<td align=center><%=name %></td>
<td align=center><%=unitprice %></td>
<td align=center><%=description %></td>
<td align=center><%=category %></td>
<td align=center><%=manufacturer %></td>
<td align=center><%=unitsinstock %></td>
<td align=center><%=condition %></td>
<td align=center>
	<a style="text-decoration:none;" href="productDelete.jsp?productid=<%=productid %>" onclick="if(!confirm('정말 삭제하시겠습니까?'))return false">삭제</a>
</td>
</tr>









<%} %>
</table>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>