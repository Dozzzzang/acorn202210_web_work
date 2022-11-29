<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//한 페이지에 몇개씩 표시할 것인지
	final int PAGE_ROW_COUNT=5;
	//하단 페이지를 몇개씩 표시할 것인지
	final int PAGE_DISPLAY_COUNT=5;
	
	//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
	int pageNum=1;
	
	//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
	String strPageNum=request.getParameter("pageNum");
	//만일 페이지 번호가 파라미터로 넘어 온다면
	if(strPageNum !=null){
		//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
		pageNum=Integer.parseInt(strPageNum);
	}
	
	//보여줄 페이지의 시작 ROWNUM
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지의 끝 ROWNUM
	int endRowNum=pageNum*PAGE_ROW_COUNT;
	
	//하단 시작 페이지 번호
	int startPageNum=1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	//하단 끝 페이지 번호
	int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
	//전체 글의 갯수
	int totalRow=CafeDao.getInstance().getCount();
	//전체 페이지의 갯수 구하기
	int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	//끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
	if(endPageNum > totalPageCount){
		endPageNum=totalPageCount; //보정해 준다.
	}

	//자세히 보여줄 글의 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	//DB 에서 해당글의 정보를 얻어와서
	CafeDto dto=CafeDao.getInstance().getData(num);
	//글 조회수도 1 증가 시킨다
	CafeDao.getInstance().addViewCount(num);
	//응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/detail.jsp</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
<style>
div {
	text-align: center;
}
</style>
</head>
<body>
	<%-- /include/navbar.jsp 페이지를 포함시킨다. --%>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="cafe" name="thisPage" />
	</jsp:include>
	<div class="container">
		<h3>글 상세 보기</h3>
		<table class="table table-stripe">
			<tr>
				<th class="table-secondary">글번호</th>
				<td><%=dto.getNum() %></td>
			</tr>
			<tr>
				<th class="table-secondary">작성자</th>
				<td><%=dto.getWriter() %></td>
			</tr>
			<tr>
				<th class="table-secondary">조회수</th>
				<td><%=dto.getViewCount() %></td>
			</tr>
			<tr>
				<th class="table-secondary">작성일</th>
				<td><%=dto.getRegdate() %></td>
			</tr>
			<tr>
				<td colspan="2">
					<div><%=dto.getContent() %></div>
				</td>
			</tr>
		</table>
		<%
			//로그인된 아이디가 있으면 읽어온다(null 일수도 있다)
			String id=(String)session.getAttribute("id");
		%>
		<%-- 만일 글 작성자가 로그인된 아이디와 같다면 수정, 삭제 링크를 제공한다. --%>
		<%if(dto.getWriter().equals(id)){ %>
		<a href="private/updateform.jsp?num=<%=dto.getNum()%>"
			class="btn btn-outline-primary">수정</a> <a href="javascript:"
			onclick="deleteConfirm()" class="btn btn-outline-danger">삭제</a>
		<script>
				function deleteConfirm(){
					const isDelete=confirm("이 글을 삭제 하겠습니까?");
					if(isDelete){
						location.href="private/delete.jsp?num=<%=dto.getNum()%>";
					}
				}
			</script>
		<%} %>
	</div>
</body>
</html>