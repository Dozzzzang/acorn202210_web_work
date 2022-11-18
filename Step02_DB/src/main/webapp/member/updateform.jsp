<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. GET 방식 파라미터로 전달되는 수정할 회원의 번호(primary key) 를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	//2. MemberDao 객체를 이용해서 회원 한명의 정보를 얻어온다.
	MemberDto dto=MemberDao.getInstance().getData(num);
	//3. 수정할 회원의 정보를 수정폼에 출력해서 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/updateform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>	
    div { text-align: center; }
</style>
</head>
<body>
	<%-- /include/navbar.jsp 페이지를 포함시킨다. --%>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="member" name="thisPage"/>
	</jsp:include>
	<div class="container">
		<h3 style="text-align:center;">회원 정보 수정 폼</h3>
		<form action="update.jsp" method="post">
			<!-- 
				disabled 된 input 요소는 폼을 제출했을때 전송이 안되기 때문에
				input type="hidden" 요소를 이용해서 회원의 번호가 폼을 제출했을때 전송되도록 한다.
			 -->
			<input type="hidden" name="num" value="<%=dto.getNum() %>" />
			<div class="mb-3">
				<label for="num">번호</label>
				<input class="form-control" type="text" id="num" value="<%=dto.getNum() %>" disabled/>
			</div>
			<div class="mb-3">
				<label for="name">이름</label>
				<input class="form-control" type="text" name="name" id="name" value="<%=dto.getName()%>"/>
			</div>
			<div class="mb-3">
				<label for="addr">주소</label>
				<input class="form-control" type="text" name="addr" id="addr" value="<%=dto.getAddr()%>"/>
			</div>			
		</form>
		<button type="submit" class="btn btn-outline-primary" style="float:left">수정확인</button>
		<a href="${pageContext.request.contextPath }/member/list.jsp" class="btn btn-outline-danger" style="float:right">취소</a>
	</div>
</body>
</html>