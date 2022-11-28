<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 폼 전송되는 아이디, 비밀번호, 이메일 주소를 읽어온다.
	//request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String email=request.getParameter("email");
	//2. UsersDto 에 담는다.
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setEmail(email);
	//3. UsersDao 를 이용해서 DB 에 저장하고
	boolean isSuccess=UsersDao.getInstance().insert(dto);
	//4. 결과를 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<%if(isSuccess){ %>
			<p class="alert alert-success">
				<strong><%=id %></strong> 님의 회원가입이 완료되었습니다.
				<a href="loginform.jsp" class="btn btn-outline-success">로그인 하러 가기</a>
			</p>
		<%}else{ %>
			<p class="alert alert-danger">
				가입이 실패 했습니다.
				<a href="signup_form.jsp" class="btn btn-outline-danger">다시 가입하러 가기</a>
			</p>
		<%} %>
	</div>
</body>
</html>