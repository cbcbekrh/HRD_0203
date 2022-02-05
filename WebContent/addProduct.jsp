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
<section>
<h1 style="text-align:center;">상품 등록 화면</h1><hr>
<form name="form" method="post" action="addProduct_process.jsp">
<table border=1 style="margin:0 auto; width:50%;">
<tr>
<th>상품코드</th>
<td><input id="in2" type="text" name="productid"></td>
</tr>

<tr>
<th>상품명</th>
<td><input id="in2" type="text" name="name"></td>
</tr>

<tr>
<th>가격</th>
<td><input id="in2" type="text" name="unitprice"></td>
</tr>

<tr>
<th>상세정보</th>
<td><input id="in2" type="text" name="description"></td>
</tr>

<tr>
<th>제조사</th>
<td><input id="in2" type="text" name="manufacturer"></td>
</tr>

<tr>
<th>분류</th>
<td>
	<select id="sel" name="category">
		<option value="10">it제품</option>
		<option value="20">주방제품</option>
		<option value="30">전자제품</option>
		<option value="40">일반잡화</option>
	</select>
</td>
</tr>

<tr>
<th>재고수</th>
<td><input id="in2" type="text" name="unitsinstock"></td>
</tr>

<tr>
<th>상태</th>
<td>
	<input type="radio" name="condition" value="신규제품">신규제품
	<input type="radio" name="condition" value="중고제품">중고제품
	<input type="radio" name="condition" value="재생제품">재생제품
</td>
</tr>

<tr>
<td colspan=2 align=center>
	<input id="b" type="button" value="등록" onclick="check()">
	<input id="b" type="reset" value="취소">
</td>
</tr>
</table>
</form>
<hr>
</section>
<%@ include file="footer.jsp" %>
</body>
<script>
function check(){
	if(document.form.productid.value==""){
		alert("상품코드를 입력하세요");
		document.form.productid.focus();
	}else if(document.form.name.value==""){
		alert("상품명을 입력하세요");
		document.form.name.focus();
	}else if(document.form.name.value.length < 4 || 50 < document.form.name.value.length){
		alert("[상품명]최소4자리에서 50자까지 입력하세요.");
		document.form.name.focus();
	}else if(document.form.unitprice.value==""){
		alert("가격을 입력하세요");
		document.form.unitprice.focus();
	}else if(isNaN(document.form.unitprice.value)){
		alert("[가격]숫자만 입력하세요");
		document.form.unitprice.focus();
	}else if(document.form.unitprice.value < 0){
		alert("[가격]음수는 입력할수 없습니다.");
		document.form.unitprice.focus();
	}else if(document.form.unitsinstock.value == ""){
		alert("재고를 입력하세요.");
		document.form.unitsinstock.focus();
	}else if(isNaN(document.form.unitsinstock.value)){
		alert("[재고]숫자만 입력하세요.");
		document.form.unitsinstock.focus();
	}else{
		document.form.submit();
	}
}
</script>
</html>