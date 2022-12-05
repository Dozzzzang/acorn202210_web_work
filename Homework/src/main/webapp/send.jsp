<%@page import="chat.ChatDto"%>
<%@page import="chat.ChatDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String chatName=request.getParameter("chatName");
	String chatContent=request.getParameter("chatContent");
	
	ChatDto dto=new ChatDto();
	dto.setChatName(chatName);
	dto.setChatContent(chatContent);
	
	boolean isSuccess=ChatDao.getInstance().insert(dto);
	
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/index.jsp");
%>
