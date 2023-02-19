<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user-my-page</title>
<%@ include file= "/resources/common/header.jsp" %>
</head>
<body>

<div style="width: 60%;">
	<h1 style="color: red">*주의*</h1>
	<p>회원계정 탈퇴를 하실 경우 회원님께서 생성한 소소모임은 사라지게 되고
	<p>참여한 모든 소소모임에서 자동으로 탈퇴하게 됩니다.
	<br>
	<button onclick="delete()">회원 탈퇴</button> <button onclick="location.href='/views/user/mypage'">돌아가기</button>
</div>

<script>
	function delete() {
		fetch('/user-delete/${userInfo.uiNum}', )
	}
</script>


</body>
</html>