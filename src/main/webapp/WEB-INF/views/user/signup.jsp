<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user-sign-in-page</title>
<%@ include file="/resources/common/header.jsp"%>
<link href="/resources/css/style.css" rel="stylesheet" type="text/css">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<div id="userInfo"></div>
<section class="section bg-tertiary">
	<div class="container" style="max-width:605px">
		<div class="justify-content-center align-items-center">
			<div class="section-title text-center">
				<p class="text-primary text-uppercase fw-bold">sign up</p>
				<img loading="prelaod" decoding="async" class="img-fluid mb-2" width="62px" src="/resources/images/banner/smile2.png" alt="맛등산" style="cursor:pointer;" onclick="location.href='/'">
				<h2 style="color:#293930;">회원가입</h2>
			</div>
		</div>
			<div class="shadow p-5 bg-white">
				<div class="contact-form">
					<div class="form-group mb-4 pb-2" style="display:flex;">
						<div style="width:100%">
						<label type="text" class="form-label" style="left:23px;">ID</label>
						<input type="text" class="form-control shadow-none" id="uiId" placeholder="아이디">
						</div>
						<div class="searchBtn" style="width:122px; padding-right:0;">
							<button class="btn btn-primary search" onclick="checkId()" style="margin:0 5px; padding:13px 11px; min-width: 100%;">중복 확인</button>
						</div>
					</div>
					<div class="form-group mb-4 pb-2">
						<label class="form-label">PASSWORD</label>
						<input type="password" class="form-control shadow-none" id="uiPwd" placeholder="비밀번호">
					</div>
					<div class="form-group mb-4 pb-2">
						<label class="form-label">PASSWORD CHECK</label>
						<input type="password" class="form-control shadow-none" id="uiPwdCheck" placeholder="비밀번호 확인">
					</div>
					<div class="form-group mb-4 pb-2" style="display:flex;">
						<div style="width:100%">
						<label class="form-label">NICKNAME</label>
						<input type="text" class="form-control shadow-none" id="uiNickname" placeholder="닉네임">
						</div>
						<div class="searchBtn" style="width:122px; padding-right:0;">
							<button class="btn btn-primary search" onclick="checkNickname()" style="margin:0 5px; padding:13px 11px; min-width: 100%;">중복 확인</button>
						</div>
					</div>
					<div class="form-group mb-4 pb-2">
						<label class="form-label">NAME</label>
						<input type="text" class="form-control shadow-none" id="uiName" placeholder="이름">
					</div>
					<div class="form-group mb-4 pb-2">
						<label class="row form-label">AGE</label>
						<input type="text" class="form-control shadow-none" id="uiAge" placeholder="나이" onkeyup="checkAge(this)">
					</div>
					<div class="form-group mb-4 pb-2">
						<select id="uiGender" class="form-select gender">
							<option value="">성별을 선택하세요</option>
							<option value="남">남</option>
							<option value="여">여</option>
						</select>
					</div>
					<div class="form-group mb-4 pb-2">
						<label class="form-label">ADDRESS</label>
						<input type="text" class="form-control shadow-none" id="uiAddr" placeholder="주소" disabled>
					</div>
					<div class="form-group pb-2" style="display:flex;">
						<div style="width:100%">
						<label class="form-label">ZONE CODE</label>
						<input type="text" class="form-control shadow-none" id="uiZonecode" placeholder="우편번호" disabled>
						</div>
						<div class="addrBtn" style="width:122px; margin:0 auto;">
							<button class="btn btn-primary" style="margin:0 5px; padding:13px 11px; min-width:100%;" onclick="searchAddr()">주소검색</button>
						</div>
					</div>
					<div id="findQuestion" class="mt-5">
						<h3 style="color:#293930">회원 계정찾기 질문</h3>
						<select name="question" id="uiQuestion" class="form-select gender">
							<option value='' selected="selected">질문을 선택해 주세요.</option>
							<option value='fruit'>당신이 제일 좋아하는 과일은?</option>
							<option value='school'>당신이 나온 초등학교 이름은?</option>
							<option value='game'>당신이 즐겨하는 게임은?</option>
							<option value='city'>당신의 출신 동네는?(구까지만 입력)</option>
							<option value='mountain'>당신이 제일 좋아하는 산은?</option>
							<option value='choice'>엄마와 아빠중 더 좋은사람은?</option>
						</select>
						<div class="form-group mt-3 pb-2 ">
							<label class="form-label ">ANSWER</label>
							<input type="text" class="form-control shadow-none" id="uiAnswer" placeholder="답변">
						</div>
					</div>
					<div class="row loginBtn mt-3">
						<button class="btn btn-primary" style="width:46%; margin:0 13px 0 10px;" onclick="join()">회원가입</button>
						<button class="btn btn-primary" style="width:46%;" onclick="location.href='/'">홈으로</button>
					</div>
				</div>
			</div>
		</div>
</section>
<%@ include file= "/resources/common/footer.jsp" %>
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
			const uiId = document.querySelector("#uiId");
			uiId.value = uiId.value.trim();
			
			const reg = /[^0-9a-z]/g;
			if (reg.test(uiId.value)) {
				alert('영문 소문자와 숫자만 입력할 수 있습니다.');
				uiId.value = uiId.value.replace(reg, '');
				uiId.focus();
				return;
			}
			
			if (uiId.value.length < 4) {
				alert('아이디는 4글자 이상이어야 합니다.');
				return;
			}
			
			fetch('/sign-up/checkId/' + uiId.value)
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
			const uiNickname = document.querySelector('#uiNickname');
			uiNickname.value = uiNickname.value.trim();
			
			const regExp = /[\[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
			if (regExp.test(uiNickname.value)) {
				alert('특수문자는 입력할 수 없습니다.');
				uiNickname.value = uiNickname.value.replace(regExp, '');
				uiNickname.focus();
				return;
			}
			if (uiNickname.value.length < 2 ||uiNickname.value.length > 10) {
				alert('닉네임은 2~10글자만 가능합니다.');
				uiNickname.focus();
				return;
			}
			
			
			fetch('/sign-up/checkNickname/' + uiNickname.value)
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

		//나이검사
		function checkAge(obj) {
			const reg = /[^0-9]/g;
			if (reg.test(obj.value)) {
				alert('숫자만 입력할 수 있습니다.');
				obj.value = obj.value.replace(reg, '');
				obj.focus();
				return;
			}
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
			
			
			const uiNickname = document.querySelector('#uiNickname').value;
			if (uiNickname.trim().length > 10) {
				alert('닉네임은 10자 이하여야 합니다.');
				uiNickname.focus();
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
				uiId : document.querySelector('#uiId').value.trim(),
				uiPwd : document.querySelector('#uiPwd').value.trim(),
				uiName : document.querySelector('#uiName').value.trim(),
				uiAge : document.querySelector('#uiAge').value,
				uiNickname : document.querySelector('#uiNickname').value.trim(),
				uiAddr : document.querySelector('#uiAddr').value,
				uiZonecode : document.querySelector('#uiZonecode').value,
				uiGender : document.querySelector('#uiGender').value,
				uiQuestion : document.querySelector('#uiQuestion').value,
				uiAnswer : document.querySelector('#uiAnswer').value.trim()
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