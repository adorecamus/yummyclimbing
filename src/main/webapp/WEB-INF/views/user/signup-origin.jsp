<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user-sign-in-page</title>
<%@ include file= "/resources/common/header.jsp" %>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<div id="userInfo">
	<h2>회원가입</h2>
	
	<input type="text" id="uiId" placeholder="ID">아이디
	<button onclick="checkId()">중복 확인</button>
	<br>
	<input type="password" id="uiPwd" placeholder="PWD">비밀번호
	<br>
	<input type="password" id="uiPwdCheck" placeholder="PWD">비밀번호
	확인
	<br>
	<input type="text" id="uiName" placeholder="이름">이름
	<br>
	<input type="text" id="uiAge" placeholder="나이">나이
	<br>
	<input type="text" id="uiNickname" placeholder="닉네임">닉네임
	<button onclick="checkNickname()">중복 확인</button>
	<br>
	<input type="text" id="uiAddr" disabled>주소
	<br>
	<input type="text" id="uiZonecode" disabled>우편번호
	<br>
	<button onclick="searchAddr()">주소검색</button>
	<br>
	<select id="uiGender">
		<option value="">선택하세요</option>
		<option value="남">남</option>
		<option value="여">여</option>
	</select>성별
	</div>
	<br>
	<div id="findQuestion">
	<h3 style="color: blue;">회원 계정찾기 질문</h3>
	<select name="question" id="uiQuestion">
		<option value='' selected="selected">질문을 선택해 주세요.</option>
		<option value='fruit'>당신이 제일 좋아하는 과일은?</option>
		<option value='school'>당신이 나온 초등학교 이름은?</option>
		<option value='game'>당신이 즐겨하는 게임은?</option>
		<option value='city'>당신의 출신 동네는?(구까지만 입력)</option>
		<option value='mountain'>당신이 제일 좋아하는 산은?</option>
		<option value='choice'>엄마와 아빠중 더 좋은사람은?</option>
	</select>질문 <br>
	<input type="text" id="uiAnswer">답변 
	</div>
	<br>
	<button onclick="join()">회원가입</button>
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

		//동일한 아이디를 확인하는 함수
		let isCheckedId = false;

		function checkId() {
			const uiId = document.querySelector("#uiId").value;
			if (uiId.trim().length < 4) {
				alert('아이디는 4글자 이상이어야 합니다.');
				return;
			}

			fetch('/sign-up/checkId/' + uiId)
			.then(function(data) {
				return data.json();
			}).then(function(res) {
				if (res===false) {
					alert('사용 가능한 아이디 입니다.');
					isCheckedId = true;
				} else {
					alert('이미 사용중인 아이디 입니다.');
					isCheckedId = false;
				}
			});
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

		//회원가입 진행
		function join() {
			if (!isCheckedId) {
				alert('아이디 중복확인을 하십시오.');
				return false;
			}
			
			if (!isExistName) {
				alert('닉네임 중복확인을 하십시오.');
				return false;
			}

			const uiId = document.querySelector('#uiId').value;
			if (uiId.trim().length < 4) {
				alert('아이디는 4자 이상이어야 합니다.');
				uiId.value = '';
				uiId.focus();
				return;
			}

			const uiPwd = document.querySelector('#uiPwd').value;
			if (uiPwd.trim().length < 6) {
				alert('비밀번호는 6자 이상이어야 합니다');
				uiPwd.value = '';
				uiPwd.focus();
				return;
			}

			const uiPwdCheck = document.querySelector('#uiPwdCheck').value;
			if (uiPwdCheck != uiPwd) {
				alert('비밀번호를 확인하세요.');
				uiPwdCheck.value = '';
				uiPwdCheck.focus();
				return;
			}
			
			const uiGender = document.querySelector('#uiGender').value;
			if (uiGender == "") {
				alert('성별을 선택해 주세요.');
				uiGender.focus();
			}
			
			const uiQuestion = document.querySelector('#uiQuestion').value;
			const uiAnswer = document.querySelector('#uiAnswer').value;
			if (uiQuestion == '' || uiAnswer == '') {
				alert('계정확인용 질문에 답해주세요.')
				uiQuestion.focus();
				return;
			}

			const param = {
				uiId : document.querySelector('#uiId').value,
				uiPwd : document.querySelector('#uiPwd').value,
				uiName : document.querySelector('#uiName').value,
				uiAge : document.querySelector('#uiAge').value,
				uiNickname : document.querySelector('#uiNickname').value,
				uiAddr : document.querySelector('#uiAddr').value,
				uiZonecode : document.querySelector('#uiZonecode').value,
				uiGender : document.querySelector('#uiGender').value,
				uiQuestion : document.querySelector('#uiQuestion').value,
				uiAnswer : document.querySelector('#uiAnswer').value
			}
			console.log(param);

			 
			fetch('/sign-up', {
				method : 'POST',
				headers : {
					'Content-Type' : 'application/json'
				},
				body : JSON.stringify(param)
			})
			//해당 url로 요청을보내고 보내는 제이슨형태의 파일을 스트링으로 풀어서 보냄
			.then(function(res) {
				return res.json()
			}).then(function(data) {
				console.log(data);
				if(data) {
					alert('회원가입되었습니다.');
					location.href = '/views/user/login'
				}
			})
						
		}
		
	</script>

</body>
</html>