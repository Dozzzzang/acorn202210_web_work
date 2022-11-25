<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /include/navbar.jsp 페이지의 내용 입니다 --%>
<%
	// 이 navbar.jsp 페이지가 어디에 include 되었는지 읽어와 보기
	String thisPage=request.getParameter("thisPage"); //"index" , "file", "cafe"
%>
<nav class="navbar navbar-expand-lg bg-primary navbar-dark">
	<div class="container">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/">
			<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ089Mun2QtaA5zfTh0PqYUkzbKoGH-1T0EzQ&usqp=CAU" alt="" width="30" height="30" class="d-inline-block align-text-top">
			Project
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="navbar-toggler-icon"></span>
    	</button>
    	<!-- 화면이 좁으면 숨겨지는 요소들은 아래의 div 안에 넣어두면 된다. -->
    	<div class="collapse navbar-collapse" id="navbarNav">
    		<ul class="navbar-nav">
    			<li class="nav-item">
    				<a class="nav-link <%= thisPage.equals("file") ? "active" : "" %>" href="${pageContext.request.contextPath }/file/list.jsp">자료실</a>
    			</li>
    			<li class="nav-item">
    				<a class="nav-link <%= thisPage.equals("cafe") ? "active" : "" %>" href="${pageContext.request.contextPath }/cafe/list.jsp">게시판</a>
    			</li>
    		</ul>
    	</div>
	</div>
</nav>