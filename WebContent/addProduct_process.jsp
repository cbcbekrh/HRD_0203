<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
	String productid=request.getParameter("productid");
	String name=request.getParameter("name");
	String unitprice=request.getParameter("unitprice");
	String description=request.getParameter("description");
	String category=request.getParameter("category");
	String manufacturer=request.getParameter("manufacturer");
	String unitsinstock=request.getParameter("unitsinstock");
	String condition=request.getParameter("condition");
	
	pstmt=conn.prepareStatement("insert into product0203 values(?,?,?,?,?,?,?,?)");
	pstmt.setString(1, productid);
	pstmt.setString(2, name);
	pstmt.setString(3, unitprice);
	pstmt.setString(4, description);
	pstmt.setString(5, category);
	pstmt.setString(6, manufacturer);
	pstmt.setString(7, unitsinstock);
	pstmt.setString(8, condition);
	pstmt.executeUpdate();
	
	

%>
</body>
<script>
	alert("상품 등록 완료");
	location.href="productSelect.jsp";
</script>
</html>