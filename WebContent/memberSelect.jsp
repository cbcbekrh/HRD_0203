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
	pstmt=conn.prepareStatement("select count(*) from member0203");
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}

%>
<section>
<h1 style="text-align:center">회원 목록 조회</h1>
<p style="padding-left:150px;">총 <%=cnt %>명의 회원이 있습니다</p><hr>
<table border=1 style="margin:0 auto; width:95%;">
<tr>
<th>id</th>
<th>성명</th>
<th>비밀번호</th>
<th>성별</th>
<th>생년월일</th>
<th>이메일</th>
<th>연락처</th>
<th>주소</th>
<th>관심분야</th>
<th>구분</th>
</tr>

<%
	pstmt=conn.prepareStatement("select * from member0203");
	rs=pstmt.executeQuery();
	while(rs.next()){
		String id=rs.getString("id");
		String name=rs.getString("name");
		String password=rs.getString("password");
		String gender=rs.getString("gender");
		if(gender.equals("1")){
			gender="남성";
		}else{
			gender="여성";
		}
		String birth=rs.getString("birth");
		String email=rs.getString("email");
		String phone=rs.getString("phone");
		String address=rs.getString("address");
		String interest=rs.getString("interest");
		
%>

<tr>
<td align=center><%=id %></td>
<td align=center><%=name %></td>
<td align=center><%=password %></td>
<td align=center><%=gender %></td>
<td align=center><%=birth %></td>
<td align=center><%=email %></td>
<td align=center><%=phone %></td>
<td align=center><%=address %></td>
<td align=center><%=interest %></td>
<td align=center>
	<a href="memberUpdate.jsp?id=<%=id %>">수정</a> /
	<a href="memberDelete.jsp?id=<%=id %>">삭제</a>
</td>
</tr>
<%} %>
</table>
<div align=center style="padding:10px 0;">
	<input id="b" type="button" value="작성" onclick="location.href='addMember.jsp'">
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>