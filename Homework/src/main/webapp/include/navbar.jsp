<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- /include/navbar.jsp 페이지의 내용 입니다 --%>
<%
	// 이 navbar.jsp 페이지가 어디에 include 되었는지 읽어와 보기
	String thisPage=request.getParameter("thisPage"); //"index" , "file", "cafe"
	//session scope 에 id 라는 키값으로 저장된 값이 있는지 읽어와 본다. (없으면 null)
	String id=(String)session.getAttribute("id");
	//DB 에서 가입 정보를 불러온다.
	UsersDto dto=UsersDao.getInstance().getData(id);
%>
<style>
	#profileImage {
		width: 75px;
		height: 75px;
		border: 1px solid #cecece;
		border-radius: 50%;
	}
</style>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
    <a class="navbar-brand" href="${pageContext.request.contextPath }/index.jsp">Hello</a>
    <ul class="nav">
		<%if(id!=null){ %>
		<li class="nav-item">
			<button type="button" class="btn btn-outline-light btn-sm"
				onclick="location.href = '${pageContext.request.contextPath }/users/private/info.jsp' "><%=id %></button>
			<a style="color:white; ">님 로그인 중...</a>
			<button type="button" class="btn btn-outline-secondary btn-sm"
				onclick="location.href = '${pageContext.request.contextPath }/users/logout.jsp' ">로그아웃</button>
		</li>
		<%}else{ %>
		<button type="button" class="btn btn-light btn-sm"
			onclick="location.href = '${pageContext.request.contextPath }/users/loginform.jsp' ">로그인</button>
		<button type="button" class="btn btn-secondary btn-sm"
			onclick="location.href = '${pageContext.request.contextPath }/users/signup_form.jsp' ">회원가입</button>
		<%} %>
	</ul>
    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1" id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel">
      <div class="offcanvas-header">
        <ul class="nav">        	
			<%if(id!=null){ %>
			<li class="nav-item">
				<%if(dto.getProfile()==null){ %> <svg id="profileImage"
						xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-person-circle"
						viewBox="0 0 16 16">
                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                        <path fill-rule="evenodd"
							d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                   </svg> <%}else{ %> <img id="profileImage" width="100" height="100"
					src="${pageContext.request.contextPath }<%=dto.getProfile()%>">
				<%} %>
				<button type="button" class="btn btn-outline-light btn-sm"
					onclick="location.href = '${pageContext.request.contextPath }/users/private/info.jsp' "><%=id %></button>
				님 로그인 중...
				<button type="button" class="btn btn-outline-secondary btn-sm"
					onclick="location.href = '${pageContext.request.contextPath }/users/logout.jsp' ">로그아웃</button>
			</li>
			<%}else{ %>
			<button type="button" class="btn btn-light btn-sm"
				onclick="location.href = '${pageContext.request.contextPath }/users/loginform.jsp' ">로그인</button>
			<button type="button" class="btn btn-secondary btn-sm"
				onclick="location.href = '${pageContext.request.contextPath }/users/signup_form.jsp' ">회원가입</button>
			<%} %>
		</ul>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body">
        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath }/index.jsp">Home</a>
          </li>          
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              Dropdown
            </a>
            <ul class="dropdown-menu dropdown-menu-dark">
              <li><a class="dropdown-item" href="#">Action</a></li>
              <li><a class="dropdown-item" href="#">Another action</a></li>
              <li>
                <hr class="dropdown-divider">
              </li>
              <li><a class="dropdown-item" href="#">Something else here</a></li>
            </ul>
          </li>
        </ul>
        <form class="d-flex mt-3" role="search">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-success" type="submit">Search</button>
        </form>
      </div>
    </div>
  </div>
</nav>