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
	String orderdate=request.getParameter("orderdate");
	String ordername=request.getParameter("ordername");
	pstmt=conn.prepareStatement("delete from order0203 where orderdate=? and ordername=?");
	pstmt.setString(1, orderdate);
	pstmt.setString(2, ordername);
	pstmt.executeUpdate();

%>
</body>
<script>
	alert("삭제 성공");
	location.href="orderSelect.jsp";
</script>
</html>