<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	TodoDto dto=TodoDao.getInstance().getData(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/updateform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>	
    div { text-align: center; }
</style>
</head>
<body>
	<%-- /include/navbar.jsp 페이지를 포함시킨다. --%>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="todo" name="thisPage"/>
	</jsp:include>
	<div class="container">
		<h3 style="text-align:center;">할일 수정 폼 입니다.</h3>
		<form action="update.jsp" method="post">
			<!-- 
				disabled 된 input 요소는 폼을 제출했을때 전송이 안되기 때문에
				input type="hidden" 요소를 이용해서 회원의 번호가 폼을 제출했을때 전송되도록 한다.
			 -->
			<input type="hidden" name="num" value="<%=dto.getNum() %>" />
			<input type="hidden" name="regdate" value="<%=dto.getRegdate() %>" />
			<div>
				<label for="num">번호</label>
				<input class="form-control" type="text" id="num" value="<%=dto.getNum() %>" disabled/>
			</div>
			<div>
				<label for="regdate">등록날짜</label>
				<input class="form-control" type="text" name="regdate" id="regdate" value="<%=dto.getRegdate()%>" disabled/>
			</div>
			<div>
				<label for="content">할일</label>
				<input class="form-control" type="text" name="content" id="content" value="<%=dto.getContent()%>"/>
			</div>
			<button type="submit" class="btn btn-outline-primary" style="float:left">수정확인</button>
			<a href="${pageContext.request.contextPath }/todo/list.jsp" class="btn btn-outline-danger" style="float:right">취소</a>
		</form>	
	</div>
</body>
</html>