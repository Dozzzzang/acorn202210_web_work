<%@page import="chat.ChatDao"%>
<%@page import="java.util.List"%>
<%@page import="chat.ChatDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session scope 에 id 라는 키값으로 저장된 값이 있는지 읽어와 본다. (없으면 null)
	String id=(String)session.getAttribute("id");
	
	ChatDto dto = new ChatDto();
	List<ChatDto> list = ChatDao.getInstance().getChatList(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>

</style>
</head>
<body>
	<%-- /include/navbar.jsp 페이지를 포함시킨다. --%>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="" name="thisPage" />
	</jsp:include>
	<div>
		<%if(id!=null){ %>			
				<%for(ChatDto tmp:list){ %>
					<figure class="text-end">
						<blockquote class="blockquote">
							<p><%=tmp.getChatContent() %></p>
						</blockquote>
						<figcaption class="blockqueote-footer">
						<%=tmp.getChatName() %>
						</figcaption>						
					</figure>
				<%} %>
		<%} %>
	</div>
	<form action="send.jsp" method="post" name="chatForm">
		<div class="container row">
			<label for="chatName" class="col-sm-2 col-form-label">닉네임</label>
			<div class="col-sm-3">
				<input class="form-control" type="text" name="chatName" id="chatName"/>
			</div>			
		</div>
		<div class="container row">
			<label for="chatContent">내용</label>
			<textarea class="form-control" name="chatContent" id="chatContent" rows="4"></textarea>
		</div>
		<button class="btn btn-outline-primary" type="submit">전송</button>
	</form>
	
	<%-- /include/footer.jsp 페이지를 포함시켜서 이부분은 footer.jsp 페이지가 응답하도록 한다. --%>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>