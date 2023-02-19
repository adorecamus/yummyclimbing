<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file= "/resources/common/header.jsp" %>
</head>
<body>
		
<section class="section bg-tertiary">
	<div class="container" style="width:470px">
		<div class="justify-content-center align-items-center">
			<div class="section-title text-center">
				<p class="text-primary text-uppercase fw-bold">Find member account</p>
				<h1>회원계정 찾기</h1>
			</div>
		</div>
			<div class="shadow p-5 bg-white" style="border-radius:20px;">
				<div class="contact-form">
					<div class="row loginBtn" style="margin-bottom:15px;">
						<button class="btn btn-outline-primary" style="width:46%; margin:0 13px 0 10px;" onclick="openIdDiv()">아이디 찾기</button>
						<button class="btn btn-outline-primary" style="width:46%;" onclick="openPwdDiv()">비밀번호 찾기</button>
					<div id="idDiv" style="display: none;">
					<br>
					<div class="form-group mb-4 pb-2">
						<label class="row form-label">NAME</label>
						<input type="text" class="form-control shadow-none" id="uiName" placeholder="이름">
					</div>
						<div class="form-group mb-4 pb-2">
						<select name="question" id="idUiQuestion" class="form-select gender">
							<option value='' selected="selected">질문을 선택해 주세요.</option>
							<option value='fruit'>당신이 제일 좋아하는 과일은?</option>
							<option value='school'>당신이 나온 초등학교 이름은?</option>
							<option value='game'>당신이 즐겨하는 게임은?</option>
							<option value='city'>당신의 출신 동네는?</option>
							<option value='mountain'>당신이 제일 좋아하는 산은?</option>
							<option value='choice'>엄마와 아빠중 더 좋은사람은?</option>
						</select>
						</div>
						<div class="form-group mb-4 pb-2">
							<label class="row form-label">ANSWER</label>
							<input type="text" class="form-control shadow-none" id="idUiAnswer" placeholder="답변">
						</div>
						<a onclick="findId()" class="text-primary">아이디 찾기</a>
						<a onclick="location.href='/views/user/login'" class="text-primary">돌아가기</a>
					</div>
					<div id="pwdDiv"style="display: none;">
						<div class="form-group mb-4 pb-2">
							<label class="row form-label">ID</label>
							<input type="text" class="form-control shadow-none" id="uiId" placeholder="아이디">
						</div>
							<div class="form-group mb-4 pb-2">
								<select name="question" id="PwdUiQuestion" class="form-select gender">
									<option value='' selected="selected">질문을 선택해 주세요.</option>
									<option value='fruit'>당신이 제일 좋아하는 과일은?</option>
									<option value='school'>당신이 나온 초등학교 이름은?</option>
									<option value='game'>당신이 즐겨하는 게임은?</option>
									<option value='city'>당신의 출신 동네는?</option>
									<option value='mountain'>당신이 제일 좋아하는 산은?</option>
									<option value='choice'>엄마와 아빠중 더 좋은사람은?</option>
								</select>
							</div>
							<div class="form-group mb-4 pb-2">
								<label class="row form-label">ANSWER</label>
								<input type="text" class="form-control shadow-none" id="PwdUiAnswer" placeholder="답변">
							</div>
							<div class="row" style="text-align:center;">
								<a onclick="findPwd()" class="text-primary" style="width:50%">비밀번호 재설정 </a>
								<a onclick="location.href='/views/user/login'" class="text-primary" style="width:50%;">돌아가기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</section>
<%@ include file= "/resources/common/footer.jsp" %>	
	<script>
	
	/* 버튼클릭시 입력창 등장. */
	function openIdDiv() {
		document.querySelector('#idDiv').style.display = "";
		document.querySelector('#pwdDiv').style.display = "none";
	}
	
	function openPwdDiv() {
		document.querySelector('#pwdDiv').style.display = "";
		document.querySelector('#idDiv').style.display = "none";
	}
	
	
	/* ID찾기 함수 */
 	function findId() {
		
		const param = {
			uiName : document.querySelector('#uiName').value,
			uiQuestion : document.querySelector('#idUiQuestion').value,
			uiAnswer : document.querySelector('#idUiAnswer').value
		}
		
		
		fetch('/find-id',{
			method : 'POST',
			headers : {
				'Content-Type' : 'application/json'
			},
			body : JSON.stringify(param)
		})
		.then(function(res){
			return res.json()
		}).then(function(data){
			if(data){
				alert('회원님의 Id는' + data.uiId + '입니다.');
				location.href = '/views/user/find-user'
			}else{
				alert('입력을 확인해주세요!');	
			}
			
		})
	} 
 	
 	/* 비밀번호 초기화 함수 */
 	function findPwd(){
 		
 		const param = {
 				uiId : document.querySelector('#uiId').value,
 				uiQuestion : document.querySelector('#PwdUiQuestion').value,
 				uiAnswer : document.querySelector('#PwdUiAnswer').value
 			}
 		
 		fetch('/find-pwd',{
			method : 'PATCH',
			headers : {
				'Content-Type' : 'application/json'
			},
			body : JSON.stringify(param)
		})
		.then(function(res){
			return res.json()
		}).then(function(data){
			if(data == 1){
				console.log(data);
				alert('임시 비밀번호 123456789a 입니다.');
				location.href = '/views/user/find-user'
			}else{
				alert('입력을 확인해주세요!');	
			}
		})
 	}
	
	
	
	
	</script>

</body>
</html>