<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session scope 에 id 라는 키값으로 저장된 값이 있는지 읽어와 본다. (없으면 null)
	String id=(String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>
	div {
		text-align: center;
	}
</style>
</head>
<body>
	<%-- /include/navbar.jsp 페이지를 포함시킨다. --%>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="" name="thisPage" />
	</jsp:include>
	<div class="container">
		<%if(id!=null){ %>
		<p>
			<button type="button" class="btn btn-secondary btn-sm"
				onclick="location.href = '${pageContext.request.contextPath }/private/study.jsp' ">회원전용공간(공부)</button>
			<button type="button" class="btn btn-secondary btn-sm"
				onclick="location.href = '${pageContext.request.contextPath }/private/game.jsp' ">회원전용공간(게임)</button>
		</p>
		<div class="container" style="text-align: center;">
			<hr class="border border-1 opacity-0">
			<button type="button" class="btn btn-outline-success btn-lg"
				onclick="location.href = 'https://naver.com' ">NAVER</button>
			<button type="button" class="btn btn-outline-danger btn-lg"
				onclick="location.href = 'https://google.com' ">GOOGLE</button>
			<button type="button" class="btn btn-outline-warning btn-lg"
				onclick="location.href = 'https://daum.net' ">DAUM</button>
			<button type="button" class="btn btn-outline-primary btn-lg"
				onclick="location.href = 'https://us02web.zoom.us/j/2385516187?pwd=NE5aMG5BNGhRMmgrTTRVR1ExMGlpZz09' ">ZOOM강의실</button>
			<hr class="border border-1 opacity-0">
		</div>
		<%} %>
	</div>
	
	
	
	
	<%-- /include/footer.jsp 페이지를 포함시켜서 이부분은 footer.jsp 페이지가 응답하도록 한다. --%>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>