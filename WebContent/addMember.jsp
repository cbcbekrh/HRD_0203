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
<%
	int cnt=0;
try{
	pstmt=conn.prepareStatement("select max(id) from member0203");
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
		cnt++;
	}
	System.out.println("맥스성공");
}catch(SQLException e){
	System.out.println("맥스실패");
}

%>
<section>
<h1 style="text-align:center;">회원 가입 등록 화면</h1><hr>
<form name="form" method="post" action="addMember_process.jsp">
<table border=1 style="margin:0 auto; width:50%;">
<tr>
<th style="width:20%;">아이디</th>
<td><input id="in1" type="text" name="id" value="<%=cnt %>">(마지막번호+1)</td>
</tr>

<tr>
<th>성명</th>
<td><input id="in1" type="text" name="name"></td>
</tr>

<tr>
<th>비밀번호</th>
<td><input id="in1" type="password" name="password1"></td>
</tr>

<tr>
<th>비밀번호 확인</th>
<td><input id="in1" type="password" name="password2"></td>
</tr>

<tr>
<th>성별</th>
<td>
	<input type="radio" name="gender" value="1">남성
	<input type="radio" name="gender" value="2">여성
</td>
</tr>

<tr>
<th>생일</th>
<td>
	<input id="in0" type="number" min="2000" max="2020" name="birth1">년
	<input id="in0" type="number" min="1" max="12" name="birth2">월
	<input id="in0" type="number" min="1" max="31" name="birth3">일
</td>
</tr>

<tr>
<th>이메일</th>
<td>
	<input id="in01" type="text" name="mail1"> @
	<input id="in01" type="text" name="mail2" disabled>
	<select id="sel" name="mail3" onchange="on();">
		<option value="0">선택하세요</option>
		<option value="9">직접입력</option>
		<option value="naver.com">naver.com</option>
		<option value="hanmail.net">hanmail.net</option>
	</select>
</td>
</tr>

<tr>
<th>연락처</th>
<td><input id="in1" type="text" name="phone"></td>
</tr>

<tr>
<th>주소</th>
<td><input id="in2" type="text" name="address"></td>
</tr>

<tr>
<th>관심분야</th>
<td>
	<input type="checkbox" name="interest" value="프로그램">프로그램
	<input type="checkbox" name="interest" value="독서">독서
	<input type="checkbox" name="interest" value="등산">등산
	<input type="checkbox" name="interest" value="여행">여행
	<input type="checkbox" name="interest" value="컴퓨터">컴퓨터
	<input type="checkbox" name="interest" value="영화">영화
	<input type="checkbox" name="interest" value="운동">운동
	<input type="checkbox" name="interest" value="진학">진학
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
function on(){
	if(document.form.mail3.options[document.form.mail3.selectedIndex].value=="0"){
		document.form.mail2.disabled=true;	
		document.form.mail2.value="";
	}else if(document.form.mail3.options[document.form.mail3.selectedIndex].value=="9"){
		document.form.mail2.disabled=false;
		document.form.mail2.value="";
		document.form.mail2.focus();
	}else{
		document.form.mail2.disabled=false;
		document.form.mail2.value=document.form.mail3.options[document.form.mail3.selectedIndex].value;
	}	
}

function check(){
	if(document.form.id.value==""){
		alert("아이디를 입력하세요");
		document.form.id.focus();
	}else if(document.form.name.value==""){
		alert("이름을 입력하세요");
		document.form.name.focus();
	}else if(document.form.password1.value==""){
		alert("비밀번호를 입력하세요");
		document.form.password1.focus();
	}else if(document.form.password2.value==""){
		alert("비밀번호 확인을 입력하세요");
		document.form.password2.focus();
	}else if(document.form.password1.value != document.form.password2.value){
		alert("비밀번호가 일치하지 않습니다.");
		document.form.password1.value="";
		document.form.password2.value="";
		document.form.password1.focus();
	}else{
		document.form.submit();
	}
}

</script>
</html>