<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//폼 전송되는 닉네임을 읽어와서
	request.setCharacterEncoding("utf-8");
	String nick=request.getParameter("nick");
	
	//session scope 에 "nick" 이라는 키값으로 저장하기
	session.setAttribute("nick", nick);
	//60 초 동안 다시 요청을 해오지 않으면 자동으로 삭제되도록 설정
	//생략하면 기본 30분 
	session.setMaxInactiveInterval(60);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/save.jsp</title>
</head>
<body>
	<p> <strong><%=nick %></strong> 이라는 닉네임을 기억 하겠습니다.</p>
	<p> 30분 동안 아무런 요청을 하지 않거나 웹브라우저를 닫으면 자동 삭제 됩니다. </p>
	<a href="../index.jsp">인덱스로 이동하기</a>	
</body>
</html>