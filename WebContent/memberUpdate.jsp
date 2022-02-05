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
	String id=request.getParameter("id");
	pstmt=conn.prepareStatement("select * from member0203 where id=?");
	pstmt.setString(1, id);
	rs=pstmt.executeQuery();
	if(rs.next()){
		String password=rs.getString("password");
		String name=rs.getString("name");
		String gender=rs.getString("gender");
		String birth=rs.getString("birth");
		String email=rs.getString("email");
		String phone=rs.getString("phone");
		String address=rs.getString("address");
		String interest=rs.getString("interest");
		
		String birth1[]=birth.split("-");
		String birthth=birth1[2].substring(0,2);		
		String mail[]=email.split("@");
		if(interest == null){
			interest="";
		}
		String in[]=interest.split(",");
		
		


%>
<section>
<h1 style="text-align:center;">회원 가입 등록 화면</h1><hr>
<form name="form" method="post" action="memberUpdate_process.jsp">
<table border=1 style="margin:0 auto; width:50%;">
<tr>
<th style="width:20%;">아이디</th>
<td><input id="in1" type="text" name="id" value="<%=id %>"></td>
</tr>

<tr>
<th>성명</th>
<td><input id="in1" type="text" name="name" value="<%=name %>"></td>
</tr>

<tr>
<th>비밀번호</th>
<td><input id="in1" type="password" name="password1" value="<%=password %>"></td>
</tr>

<tr>
<th>비밀번호 확인</th>
<td><input id="in1" type="password" name="password2" value="<%=password %>"></td>
</tr>

<tr>
<th>성별</th>
<td>
	<input type="radio" name="gender" value="1" <%= gender.equals("1") ? "checked" : "" %>>남성
	<input type="radio" name="gender" value="2" <%= gender.equals("2") ? "checked" : "" %>>여성
</td>
</tr>

<tr>
<th>생일</th>
<td>
	<input id="in0" type="number" min="2000" max="2020" name="birth1" value="<%=birth1[0] %>">년
	<input id="in0" type="number" min="1" max="12" name="birth2" value="<%=birth1[1] %>">월
	<input id="in0" type="number" min="1" max="31" name="birth3" value="<%=birthth %>">일
</td>
</tr>

<tr>
<th>이메일</th>
<td>
	<input id="in01" type="text" name="mail1" value="<%=mail[0] %>"> @
	<input id="in01" type="text" name="mail2" value="<%=mail[1] %>">
	<select id="sel" name="mail3" onchange="on();">
		<option value="0">선택하세요</option>
		<option value="9">직접입력</option>
		<option value="naver.com" <%= mail[1].equals("naver.com") ? "selected" : "" %>>naver.com</option>
		<option value="hanmail.net"  <%= mail[1].equals("hanmail.net") ? "selected" : "" %>>hanmail.net</option>
	</select>
</td>
</tr>

<tr>
<th>연락처</th>
<td><input id="in1" type="text" name="phone" value="<%=phone %>"></td>
</tr>

<tr>
<th>주소</th>
<td><input id="in2" type="text" name="address" value="<%=address %>"></td>
</tr>

<tr>
<th>관심분야</th>
<td>
	<input type="checkbox" name="interest" value="프로그램" <% for(int i=0; i<in.length; i++) if("프로그램".equals(in[i]))out.print("checked"); %>>프로그램
	<input type="checkbox" name="interest" value="독서" <% for(int i=0; i<in.length; i++) if("독서".equals(in[i]))out.print("checked"); %>>독서
	<input type="checkbox" name="interest" value="등산" <% for(int i=0; i<in.length; i++) if("등산".equals(in[i]))out.print("checked"); %>>등산
	<input type="checkbox" name="interest" value="여행" <% for(int i=0; i<in.length; i++) if("여행".equals(in[i]))out.print("checked"); %>>여행
	<input type="checkbox" name="interest" value="컴퓨터" <% for(int i=0; i<in.length; i++) if("컴퓨터".equals(in[i]))out.print("checked"); %>>컴퓨터
	<input type="checkbox" name="interest" value="영화" <% for(int i=0; i<in.length; i++) if("영화".equals(in[i]))out.print("checked"); %>>영화
	<input type="checkbox" name="interest" value="운동" <% for(int i=0; i<in.length; i++) if("운동".equals(in[i]))out.print("checked"); %>>운동
	<input type="checkbox" name="interest" value="진학" <% for(int i=0; i<in.length; i++) if("진학".equals(in[i]))out.print("checked"); %>>진학
</td>
</tr>

<tr>
<td colspan=2 align=center>
	<input id="b" type="button" value="수정" onclick="check()">
	<input id="b" type="reset" value="취소">
</td>
</tr>

<%} %>
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