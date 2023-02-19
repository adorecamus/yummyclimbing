<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user-update-page</title>
<%@ include file="/resources/common/header.jsp"%>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>

	<input type="text" id="uiId" value="${userInfo.uiId}" disabled>아이디
	<br>
	<input type="text" id="uiName" value="${userInfo.uiName}" disabled>이름
	<br>
	<input type="text" id="uiAge" value="${userInfo.uiAge}" disabled>나이
	<br>
	<input type="text" id="uiNickname" placeholder="닉네임을 입력하세요">닉네임
	<button onclick="checkNickname()">중복 확인</button>
	<br>
	<input type="text" id="uiAddr" value="${userInfo.uiAddr}" disabled>주소
	<br>
	<input type="text" id="uiZonecode" value="${userInfo.uiZonecode}" disabled>우편번호
	<br>
	<button onclick="searchAddr()">주소검색</button>
	<br>
	
	<br>
	<button onclick="join()">정보수정</button>
	<button onclick="location.href='/'">홈으로</button>

	<script>
		function searchAddr() {
			const daumWin = new daum.Postcode({
				oncomplete : function(data) {
					document.querySelector('#uiZonecode').value = data.zonecode;
					//주소의 우편번호
					document.querySelector('#uiAddr').value = data.address;
					//일반 주소
				}
			});
			daumWin.open();

		}

		/*동일한 닉네임이 있는지 확인하는 함수 */
		let isExistName = false;

		function checkNickname() {
			const uiNickname = document.querySelector('#uiNickname').value;
			fetch('/sign-up/checkNickname/' + uiNickname)
			.then(function(data) {
				return data.json();
			}).then(function(res) {
				if (res===false) {
					alert('사용 가능한 닉네임 입니다.');
					isExistName = true;
				} else {
					alert('이미 사용중인 닉네임 입니다.');
					isExistName = false;
				}
			});

		}

		//수정 회원정보
		function join() {
			
			if(!isExistName){
				alert('닉네임을 확인해주세요.');
				return;
			}
			const param = {
				uiNickname : document.querySelector('#uiNickname').value,
				uiAddr : document.querySelector('#uiAddr').value,
				uiZonecode : document.querySelector('#uiZonecode').value
			}
			console.log(param);

			fetch('/user-infos/${userInfo.uiNum}', {
				method : 'PATCH',
				headers : {
					'Content-Type' : 'application/json'
				},
				body : JSON.stringify(param)
			})
			.then(function(res){
					return res.json()
				})
				.then(function(data){
					if(data===true){
						alert('수정이 성공하였습니다.')
						location.href='/views/user/mypage';
					}
				})
				.catch(function(err){
					alert('오류가 발생하였습니다.')
					location.replace();
	})
		}
	</script>

</body>
</html>