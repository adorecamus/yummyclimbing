<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user-my-page</title>
<%@ include file="/resources/common/header.jsp"%>
</head>
<body>

	<section class="section bg-tertiary">
		<div class="container" style="width: 470px">
			<div class="justify-content-center align-items-center">
				<div class="section-title text-center">
					<p class="text-primary text-uppercase fw-bold">Delete account</p>
					<h1 style="color: #c11515;">주의</h1>
				</div>
			</div>
			<div class="shadow p-5 bg-white" style="border-radius: 20px;">
				<div class="contact-form">
					<p style="font-size: 1.37rem;">회원 탈퇴를 하실 경우 회원님께서 생성한 소소모임은 사라지게 되고 참여한 
					모든 소소모임에서 자동으로 탈퇴하게 됩니다.</p>
					<h4 style="text-align: center;">-정말로 탈퇴하시겠습니까?-</h4>
					<div class="row loginBtn" style="margin-bottom: 15px;margin-top: 20px">
						<button class="btn btn-dark"
							style="width: 46%; margin: 0 13px 0 10px;" onclick="deleteUser()">회원
							탈퇴</button>
						<button class="btn btn-light" style="width: 46%;"
							onclick="location.href='/views/user/mypage'">돌아가기</button>
					</div>
				</div>
			</div>
		</div>
	</section>
<%@ include file= "/resources/common/footer.jsp" %>
	<script>
function deleteUser() {
	fetch('/user-info/delete/${userInfo.uiNum}',{
		method : 'DELETE',

	})
	.then(function(res){
		return res.json();
		console.log(res);
	})
	.then(function(data){
		if(data === true){
			alert('회원탈퇴가 완료되었습니다.')
			location.href='/';
		}
	});
}
</script>


</body>
</html>