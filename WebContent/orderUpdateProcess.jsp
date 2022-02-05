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
	int B=0;
	int C=0;
	pstmt=conn.prepareStatement("select a.orderqty,b.unitsinstock from order0203 a, product0203 b where a.productid=b.productid and a.productid=?");
	pstmt.setString(1, productid);
	rs=pstmt.executeQuery();
	if(rs.next()){
		A=rs.getInt("orderqty");
		B=rs.getInt("unitsinstock");
		C=(A+B)-Integer.parseInt(orderqty);
		System.out.println(C);
		pstmt=conn.prepareStatement("update product0203 set UNITSINSTOCK=? where productid=?");
		pstmt.setInt(1, C);
		pstmt.setString(2, productid);
		pstmt.executeUpdate();
		
		System.out.println(productid);
		System.out.println(unitprice);
		System.out.println(orderqty);
		System.out.println(address);
		System.out.println(orderdate);
		System.out.println(ordername);
		
		pstmt=conn.prepareStatement("update order0203 set productid=?,unitprice=?,orderqty=?,orderaddress=? where orderdate=? and ordername=?");
		pstmt.setString(1, productid);
		pstmt.setString(2, unitprice);
		pstmt.setString(3, orderqty);
		pstmt.setString(4, address);
		pstmt.setString(5, orderdate);
		pstmt.setString(6, ordername);
		pstmt.executeUpdate();
	}
	
	
			
%>
</body>
<script>
	alert("주문 수정 완료");
	location.href="orderSelect.jsp";
</script>
</html>