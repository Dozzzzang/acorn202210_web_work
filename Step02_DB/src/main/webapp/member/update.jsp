<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 폼 전송되는 수정할 회원의 정보를 읽어온다.
	request.setCharacterEncoding("utf-8");
	int num=Integer.parseInt(request.getParameter("num"));
	String name=request.getParameter("name");
	String addr=request.getParameter("addr");
	
	MemberDto dto= new MemberDto(num, name, addr);
	//2. MemberDao 객체를 이용해서 DB에 저장한다.
	boolean isSuccess=MemberDao.getInstance().update(dto);
	//3. 응답한다.

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/update.jsp</title>
</head>
<body>
	<%if(isSuccess){%>
		<script>
			alert("<%=num%> 번 회원의 정보를 수정했습니다");
			//javascript 를 활용한 페이지 이동(웹브라우저가 새로운 경로로 요청을 다시 하도록 한다)
			location.href="${pageContext.request.contextPath }/member/list.jsp";
		</script>
	<%}else{ %>
		<script>
			alert("수정 실패!");
			location.href="list.jsp";
		</script>
	<%} %>
</body>
</html>