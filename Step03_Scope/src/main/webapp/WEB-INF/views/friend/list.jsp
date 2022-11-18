<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// "list" 라는 키값으로 request scope 에 담겨 있는 List<String> type 의 참조값 얻어오기
	List<String> list=(List<String>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/WEB-INF/views/friend/list.jsp</title>
</head>
<body>
	<h3>친구 목록 입니다.</h3>
		<%for(String tmp:list){%>
    		<li><%=tmp %></li>
    	<%} %>
</body>
</html>