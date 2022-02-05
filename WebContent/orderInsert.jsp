<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="DBConn.jsp" %>
<%
	String orderdate=request.getParameter("orderdate");
	String ordername=request.getParameter("ordername");
	String productid=request.getParameter("productid");
	String orderqty=request.getParameter("orderqty");
	String address=request.getParameter("address");
	if(orderdate == null){orderdate = "";}
	if(ordername == null){ordername = "";}	
	if(address == null){address = "";}	
	if(orderqty == null || productid.equals("")){orderqty = "0";}	
	String name = "";
	String unitprice = "";		
	int total = 0;
	int A=0;
	int B=0;
	int C=0;
	if(productid == null || productid.equals("")){
		productid="";
	}else{	
	pstmt=conn.prepareStatement("select * from product0203 where productid=?");
	pstmt.setString(1, productid);
	rs=pstmt.executeQuery();
	if(rs.next()){
		name=rs.getString("name");
		unitprice=rs.getString("unitprice");
		C=rs.getInt("unitsinstock");
		
		if(orderqty != ""){
			A=Integer.parseInt(unitprice);
			B=Integer.parseInt(orderqty);
			if(B > C){				
				%>
					<script>
						alert("주문수량이 재고수량보다 많습니다.");
					</script>
				<%
				total=0;
				orderqty="";
			}else{
				total=A*B;
				
			}
		}
	}else{
		%>
			<script>
				alert("등록되지 않은 코드입니다.");				
			</script>
		<%
		productid="";
		
	}
}		
	
%>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<h1 style="text-align:center;">주문정보 등록</h1>
<form name="form" method="post" action="orderInsert.jsp">
<table border=1 style="margin:0 auto; width:40%;">
<tr>
<th>주문일자</th>
<td><input style="height:22px;" type="text" name="orderdate" value="<%=orderdate %>"></td>
<th>주문자이름</th>
<td><input style="height:22px;" type="text" name="ordername" value="<%=ordername %>"></td>
</tr>

<tr>
<th>상품코드</th>
<td><input style="height:22px;" type="text" name="productid" value="<%=productid %>" onchange="on();"></td>
<th>상품명</th>
<td><input style="height:22px;" type="text" name="name" value="<%=name %>"></td>
</tr>

<tr>
<th>단가</th>
<td><input style="height:22px;" type="text" name="unitprice" value="<%=unitprice %>"></td>
<th>주문수량</th>
<td><input style="height:22px;" type="text" name="orderqty" value="<%=orderqty %>" onchange="on();"></td>
</tr>

<tr>
<th>주문금액</th>
<td><input style="height:22px;" type="text" name="total" value="<%=total %>"></td>
<th>주문주소</th>
<td><input style="height:22px;" type="text" name="address" value="<%=address %>"></td>
</tr>

<tr>
<td colspan=4 align=center>
	<input id="b" type="submit" value="등록" onclick="check()">
	<input id="b" type="button" value="취소">
</td>
</tr>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
<script>
function on(){
	document.form.submit();
}


function check(){
	if(document.form.orderdate.value==""){
		alert("주문일자를 입력하세요");
		document.form.orderdate.focus();
	}else if(document.form.ordername.value==""){
		alert("주문자 이름을 입력하세요");
		document.form.ordername.focus();
	}else if(document.form.productid.value==""){
		alert("상품코드를 입력하세요");
		document.form.productid.focus();
	}else if(document.form.address.value==""){
		alert("주소를 입력하세요");
		document.form.address.focus();
	}else{
		form.action="orderInsertProcess.jsp";
	}
}
</script>
</html>