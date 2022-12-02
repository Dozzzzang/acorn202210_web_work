<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form3.jsp</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>

</head>
<body>
	<%-- /include/navbar.jsp 페이지를 포함시킨다. --%>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="" name="thisPage" />
	</jsp:include>
	<div class="container">
		<h3 style="text-align: center;">회원 가입 폼 입니다.</h3>
		<form v-on:submit="onSubmit" action="signup.jsp" method="post" id="signupForm">
			<div class="mb-2">
				<label class="control-label" for="id">아이디</label> 
				<input v-on:input="onIdInput" 
						v-model="id"
						v-bind:class="{'is-valid':isIdValid, 'is-invalid':!isIdValid && isIdDirty}" 
						class="form-control" type="text" name="id" id="id" />
				<small class="form-text text-muted">영문자 소문자로 시작하고 5글자~10글자 이내로 입력하세요</small>
				<div class="valid-feedback">사용 가능한 아이디 입니다</div>
				<div class="invalid-feedback">사용할 수 없는 아이디 입니다</div>
			</div>
			<div class="mb-2">
				<label class="control-label" for="pwd">비밀번호</label> 
				<input v-on:input="checkPwd" 
						v-model="pwd"
						v-bind:class="{'is-valid':isPwdValid, 'is-invalid':!isPwdValid && isPwdDirty}"
						class="form-control" type="password" name="pwd" id="pwd" />
				<small class="form-text text-muted">특수문자를 하나 이상 조합하세요.</small>
				<div class="invalid-feedback">비밀번호를 확인하세요</div>
			</div>
			<div class="mb-2">
				<label class="control-label" for="pwd2">비밀번호 확인</label> 
				<input v-on:input="checkPwd"
						v-model="pwd2"
						class="form-control" type="password" name="pwd2" id="pwd2" />
			</div>
			<div class="mb-2">
				<label class="control-label" for="email">이메일</label> 
				<input v-on:input="onEmailInput"
						v-model="email"
						v-bind:class="{'is-valid':isEmailValid, 'is-invalid':!isEmailValid && isEmailDirty}"
						class="form-control" type="text" name="email" id="email" />
				<div class="invalid-feedback">이메일 형식에 맞게 입력하세요.</div>
			</div>
			<button v-bind:disabled="!isFormValid" class="btn btn-primary" type="submit">가입</button>
		</form>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script>
		// vue를 활용한 구조
		new Vue({
			el:"#signupForm",
			data:{
				isIdValid:false,
				isPwdValid:false,
				isEmailValid:false,
				id:"",
				pwd:"",
				pwd2:"",
				email:"",
				isIdDirty:false,
				isPwdDirty:false,
				isEmailDirty:false
			},
			computed:{
				isFormValid(){
					//모델을 활용해서 얻어낼 값이 있으면 얻어낸다.
					let result=this.isIdValid && this.isPwdValid && this.isEmailValid;
					//함수에서 리턴해주는 값을 모델처럼 사용하면 된다.
					return result;
				}
			},
			methods:{
				onSubmit(e){
					if(!this.isFormValid){
						e.preventDefault();
					}
				},
				onIdInput:function(){
					//아이디를 한번이라도 입력하면 아이디가 더럽혀 졌는지 여부를 true 로 바꿔준다. 
		            this.isIdDirty=true;
					const reg=/^[a-z].{4,9}$/;
					if(!reg.test(this.id)){
						isIdValid=false;
						return;
					}
					// Vue 객체의 참조값을 self 에 담기
					const self=this;
					fetch("checkid.jsp?inputId="+this.id)
					.then(function(response){
						return response.json();
					})
					.then(function(data){
						console.log(data);
						if(data.isExist){
							self.isIdValid=false;
						}else{
							self.isIdValid=true;
						}
					});
				},
				checkPwd:function(){
					this.isPwdDirty=true;
					//비밀번호를 검증할 정규 표현식
					let reg=/[\W]/;
					//만일 비밀번호가 정규 표현식을 통과 하지 못한다면 
					if(!reg.test(this.pwd)){	
						this.isPwdValid=false;
						return;
					}
					if(this.pwd != this.pwd2){//만일 비밀번호 입력란과 확인란이 다르다면	
						this.isPwdValid=false;
					}else{//같다면
						this.isPwdValid=true;
					}
				},
				onEmailInput:function(){
					this.isEmailDirty=true;
					//이메일을 검증할 정규 표현식
					const reg=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
					//만일 입력한 이메일이 정규표현식 검증을 통과 하지 못했다면
					if(!reg.test(this.email)){
						this.isEmailValid=false;
					}else{//통과 했다면
						this.isEmailValid=true;
					}
				}
			}
		});
		
	</script>
</body>
</html>