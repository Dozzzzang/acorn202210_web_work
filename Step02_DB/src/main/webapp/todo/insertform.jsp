<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insertform.jsp</title>
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
		<nav class="mt-2">
	      	<ol class="breadcrumb">
	         	<li class="breadcrumb-item">
	            	<a href="${pageContext.request.contextPath }/index.jsp">Home</a>
	         	</li>
	         	<li class="breadcrumb-item">
	            	<a href="${pageContext.request.contextPath }/todo/list.jsp">할일목록</a>
	         	</li>
	         	<li class="breadcrumb-item active">할일 추가 페이지</li>
      		</ol>
		</nav>		
		<h3 style="text-align:center;">할일 추가 폼 입니다.</h3>
		<form action="insert.jsp" method="post">
			<div class="mb-3">  				
  				<input type="text" name="content" class="form-control" id="content" placeholder="할일을 추가하세요" />
			</div>			
			<button type="submit" class="btn btn-outline-primary" style="float:left">추가</button>
		</form>
		<a href="${pageContext.request.contextPath }/todo/list.jsp" class="btn btn-outline-info" style="float:right">돌아가기</a>
	</div>
</body>
</html>