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
	String orderdate = request.getParameter("orderdate");
	String ordername = request.getParameter("ordername");
	String productid = request.getParameter("productid");
	String name = request.getParameter("name");
	String unitprice = request.getParameter("unitprice");
	String orderqty = request.getParameter("orderqty");
	String total = request.getParameter("total");
	String address = request.getParameter("address");
	int A=0;	
	int B=Integer.parseInt(orderqty);
	int C=0;
	pstmt=conn.prepareStatement("select unitsinstock from product0203 where productid=?");
	pstmt.setString(1, productid);
	rs=pstmt.executeQuery();
	if(rs.next()){
		A=rs.getInt(1);
		C=A-B;
		pstmt=conn.prepareStatement("insert into order0203 values(?,?,?,?,?,?)");
		pstmt.setString(1, orderdate);
		pstmt.setString(2, ordername);
		pstmt.setString(3, productid);
		pstmt.setString(4, unitprice);
		pstmt.setString(5, orderqty);
		pstmt.setString(6, address);
		pstmt.executeUpdate();
		
		pstmt=conn.prepareStatement("update product0203 set unitsinstock=? where productid=?");
		pstmt.setInt(1, C);
		pstmt.setString(2, productid);
		pstmt.executeUpdate();		
		
	}
	
	
	
%>
</body>
<script>
	alert("주문 완료");
	location.href="orderSelect.jsp";
</script>
</html>