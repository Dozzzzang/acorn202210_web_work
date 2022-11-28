<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 로그인된 아이디를 읽어온다.
	String id=(String)session.getAttribute("id");
	//2. DB 에서 삭제한다.
	UsersDao.getInstance().delete(id);
	//3. 로그아웃 처리를 한다.
	session.invalidate();
	//4. 응답

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/delete.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">		
		<p class="alert alert-success">
			<strong><%=id %></strong> 님의 탈퇴 처리가 완료되었습니다.
			<a href="${pageContext.request.contextPath }/" class="btn btn-outline-success">인덱스로 가기</a>
		</p>
	</div>
</body>
</html>