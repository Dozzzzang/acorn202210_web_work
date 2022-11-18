<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	/*
		jsp 페이지에서 HttpServletRequest 는 기본 객체이다.
		request 라는 이름의 지역변수에 참조값이 들어 있기 때문에 바로 . 찍어서 필요한 메소드를
		활용할 수 있다.
	*/
	
	//post 방식 전송 한글이 깨지지 않도록
	request.setCharacterEncoding("utf-8");
	//msg 라는 파라미터명으로 전송되는 문자열 추출해서 콘솔창에 출력하기
	String msg=request.getParameter("msg");
	System.out.println("msg: "+msg);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/send.jsp</title>
</head>
<body>
	<p><%= msg %></p>
	<p>"메시지 잘 받았어 클라이언트야!"</p>
</body>
</html>