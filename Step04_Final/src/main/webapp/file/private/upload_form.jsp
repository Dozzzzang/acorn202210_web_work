<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/upload_form.jsp</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
</head>
<body>
	<%-- /include/navbar.jsp 페이지를 포함시킨다. --%>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="file" name="thisPage" />
	</jsp:include>
	<div class="container">
		<h3 style="text-align: center;">파일 업로드 폼 입니다.</h3>
		<!-- 
			파일 업로드 폼 작성법
			1. method="post"
			2. enctype="multipart/form-data"
			3. <input type="file" />
			- enctype="multipart/form-data" 가 설정된 폼을 전송하면
			  폼 전송된 내용을 추출할때 HttpServletRequest 객체로 추출을 할수 없다
			  MultipartRequest 객체를 이용해서 추출해야 한다.
		 -->
		<form action="upload.jsp" method="post" enctype="multipart/form-data">
			<div>
				<label for="title">제목</label> <input type="text" name="title"
					id="title" />
			</div>
			<div>
				<label for="myFile">첨부파일</label> <input type="file" name="myFile"
					id="myFile" />
			</div>
			<div style="text-align: center;">
				<button type="submit" class="btn btn-outline-success">업로드</button>
			</div>
		</form>
	</div>
</body>
</html>