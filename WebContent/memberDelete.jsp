<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="DBConn.jsp" %>

<%
	String id=request.getParameter("id");
	pstmt=conn.prepareStatement("delete from member0203 where id=?");
	pstmt.setString(1, id);
	pstmt.executeUpdate();
	
%>
<script>
	alert("삭제 완료");
	location.href="memberSelect.jsp";
</script>