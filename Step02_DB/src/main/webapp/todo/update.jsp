<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int num=Integer.parseInt(request.getParameter("num"));
	String content=request.getParameter("content");
	String regdate=request.getParameter("regdate");
	
	TodoDto dto=new TodoDto(num, content, regdate);
	
	boolean isSuccess=TodoDao.getInstance().update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/update.jsp</title>
</head>
<body>
	<%if(isSuccess){%>
		<script>
			alert("<%=num%> 번째 할일을 수정했습니다");
			//javascript 를 활용한 페이지 이동(웹브라우저가 새로운 경로로 요청을 다시 하도록 한다)
			location.href="${pageContext.request.contextPath }/todo/list.jsp";
		</script>
	<%}else{ %>
		<script>
			alert("수정 실패!");
			location.href="list.jsp";
		</script>
	<%} %>
</body>
</html>