<%@page import="chat.ChatDao"%>
<%@page import="chat.ChatDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String chatContent=request.getParameter("chatContent");
	ChatDto dto= new ChatDto();
	dto.setChatContent(chatContent);
	String chatName=(String)session.getAttribute("id");
	dto.setChatName(chatName);
	boolean isSuccess=ChatDao.getInstance().insert(dto);
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/index.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/chatsend.jsp</title>
</head>
<body>
	
</body>
</html>