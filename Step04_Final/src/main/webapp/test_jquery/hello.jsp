<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_jquery/hello.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<h3>jquery 테스트</h3>
	<p id="one"></p>
	<p id="two"></p>
	<div>div1</div>
	<div>div2</div>
	<div>div3</div>
	<div>div4</div>
	<div>div5</div>
	<input type="text" id="inputMsg" />
	<button id="sendBtn">전송</button>
	<script>
		//위의 모든 div 의 innerText 를 김구라로 바꾸려면?
		/*
		const divs=document.querySelectorAll("div");
		for(let i=0; i<divs.length; i++){
			divs[i].innerText="김구라";
		}
		*/
		
		//전송 버튼을 눌렀을때 실행할 함수 등록
		$("#sendBtn").on("click", function(){
			alert("전송합니다.");
		});
	</script>
</body>
</html>