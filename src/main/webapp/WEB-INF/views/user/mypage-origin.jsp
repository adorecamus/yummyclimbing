<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user-my-page</title>
<%@ include file="/resources/common/header.jsp"%>
</head>
<body>

	<!-- 프로필 칸 -->
	<h1>마이페이지</h1>
	<br> 이름: ${userInfo.uiName}
	<br> 나이 : ${userInfo.uiAge}
	<br> 닉네임 : ${userInfo.uiNickname}
	<br> 주소 : ${userInfo.uiAddr}
	<br>

	<!-- 프로필 사진 등록 칸-->
	<c:if test="${userInfo.uiImgPath eq null}">
		<br>
		<h3>프로필 사진</h3>
		사진을 추가해 주세요.
		<div
			style="width: 150px; height: 200px; background-color: grey; margin-top: 10px; margin-bottom: 10px"></div>
		<input type="file" class="image">
		<br>
		<button onclick="profileUpload()">프로필 사진 설정</button>
		<br>
	</c:if>

	<c:if test="${userInfo.uiImgPath ne null}">
		<img src="${userInfo.uiImgPath}">
		<h3>프로필 사진</h3>
			<input type="file" class="image">
			<button onclick="profileUpload()">사진변경</button>
		<br>
	</c:if>
	<br>



	<!-- 계정정보 수정 칸 -->

	<div id="confirm" style="display: none">
		<input type="password" id="uiPwd" placeholder="비밀번호">
		<button onclick="passwordConfirm()">비밀번호 확인</button>
	</div>
	<button onclick="showConfirm('update')">회원정보 수정</button>
	<br>
	<button onclick="showConfirm('delete')">회원 탈퇴</button>
	<br>
	<button onclick="location.href='/'">홈으로</button>


	<!-- 가입한 소모임  -->
	<h4>${userInfo.uiNickname}님이가입한소모임</h4>
	<div id="myParty"></div>

	<!-- 좋아요 소모임  -->
	<h4>${userInfo.uiNickname}님이♥한 소모임</h4>
	<div id="likeParty"></div>

	<!-- 좋아요 산 -->
	<h4>${userInfo.uiNickname}님이♥한 산</h4>
	<div id="likeMountain"></div>

	<!-- 좋아요 커뮤니티 게시물 -->
	<h4>${userInfo.uiNickname}님이♥한 게시글</h4>
	<table style="border: 1px solid; width: 30%;">
		<tr>
			<th style="width: 30%;">카테고리</th>
			<th>제목</th>
		</tr>
		<tbody id="myLikeBoard"></tbody>
	</table>

	<!-- 내가 작성한 커뮤니티 게시글 -->
	<h4>${userInfo.uiNickname}님이작성한커뮤니티 게시글</h4>
	<table style="border: 1px solid; width: 30%;">
		<tr>
			<th style="width: 30%;">카테고리</th>
			<th>제목</th>
		</tr>
		<tbody id="myBoard"></tbody>
	</table>


	<!--챌린지 리스트 칸 -->
	<div id="rDiv">
		<h2 style="color: red">${userInfo.uiNickname}의Challenge!</h2>
		<h4>New Challenge</h4>
		<textarea rows="3" cols="40" id="ucChallenge" style="resize: none;"></textarea>
		<button onclick="addChallenge()">추가하기!</button>
		<br> <br>
		<table border="1">
			<tr>
				<th>번호</th>
				<th>도전 과제</th>
				<th>작성일</th>
				<th>수정일</th>
			</tr>
			<tbody id="tBody">
			</tbody>
		</table>
	</div>



	<script>
		/*개인정보 함수 칸 */

		/* 수정or삭제 버튼 클릭시 비밀번호 확인칸이 생기는 함수 */
		let _type;
		function showConfirm(type) {
			_type = type;
			document.querySelector('#confirm').style.display = '';
			console.log(_type);
			uiPwd.focus();
		}

		/*각 요청에 맞게 수정이동 또는 삭제실행 함수 */

		function passwordConfirm() {
			let method = 'POST';
			if (_type === 'delete') {
				method = 'DELETE';
			}
			
			console.log(method);
			const param = {
				uiPwd : document.querySelector('#uiPwd').value
			}
			console.log(param);

	
			 
			fetch('/user-infos/${userInfo.uiNum}', {
				method : method,
				headers : {
					'Content-Type' : 'application/json'
				},
				body : JSON.stringify(param)
			}).then(function(res) {
				return res.json();
				console.log(res);
			}).then(function(data) {
				
				if (data === true) {
					if (_type === 'update') {
						location.href = '/views/user/update';
					} else if (_type === 'delete') {
						/* alert('삭제완료!'); */
						location.href = '/views/user/delete';
					}
				} else {
					alert('비밀번호를 확인해주세요');
				}
			});
		}
		
		
		/* 	const formData = new FormData();
		const inputImg = document.querySelector('#image');
		if(inputImg.getAttribute('type') === 'file'){
			if(inputImg.files.length==1){
				formData.append('multipartFiles',)
			}
		}
		 */
		 
		 
		 /* 프로필사진 업로드 */
		 
		 function profileUpload(){
			//첨부파일의 확장자가 exe, sh, zip, alz 경우 업로드를 제한
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");	// !!!!!!이미지 파일만 가능하게 정규식 바꿔야 함!!!!!!
			//최대 5MB까지만 업로드 가능
			var maxSize = 5242880; //5MB
			//확장자, 크기 체크
			function checkExtension(fileName, fileSize){
				
				if(fileSize >= maxSize){
					alert("사진파일의 사이즈가 초과되었습니다!");
					return false;
				}
				
				if(regex.test(fileName)){
					alert("해당 종류의 파일은 업로드할 수 없습니다.");
					return false;
				}
				//체크 통과
				return true;
			}

			const formData = new FormData();
			const inputObjs = document.querySelectorAll('input[class]');
			for(const inputObj of inputObjs){
				if(inputObj.getAttribute('type') === 'file'){
					if(inputObj.files.length==1){
						const file = inputObj.files[0];
						if(!checkExtension(file.name, file.size)){//!true라면 실패
							return;
						}
						if(!file.type.match("image.*")){
							alert("이미지 파일만 업로드 가능합니다");
							return;
						}
						formData.append('multipartFiles',inputObj.files[0]);
						
					}
					continue;
				}
				formData.append(inputObj.getAttribute('class'),inputObj.value);
			}
			
			formData.enctype='multipart/form-data'; 
			const xhr = new XMLHttpRequest();
			xhr.open('POST', '/updatImg/${userInfo.uiNum}');
			xhr.onreadystatechange = function() {
				if(xhr.readyState === xhr.DONE) {
					if(xhr.status === 200) {
						alert('사진이 등록되었습니다');
						location.reload();
					} else {
						alert('사진 등록에 실패했습니다.');
					}
				}
				xhr.send(formData);
			};
	}
			
		


		/* 개인정보 칸 함수 끝 */

		/*리스트 함수 칸*/

		/* 챌린지 불러오기 */
		function getChallengeList() {
			fetch("/challenge-list/${userInfo.uiNum}")
					.then(function(res) {
						return res.json();
					})
					.then(
							function(userChallenge) {
								let html = '';
								for (let i = 0; i < userChallenge.length; i++) {
									html += '<tr>'
									html += '<td>' + (i+1) 
											+ '</td>';
									html += '<td><a href="/views/challengeList/view?ucNum='
											+ userChallenge[i].ucNum
											+ '">'
											+ userChallenge[i].ucChallenge
											+ '</td>';
									html += '<td>' + userChallenge[i].ucCredat
											+ '</td>';
									html += '<td>' + userChallenge[i].ucLmodat
											+ '</td>';
									html += '</tr>'
								}
								document.querySelector('#tBody').innerHTML = html;
							});
		}
		window.onload = function() {
			getChallengeList();
			getMyPartyList();
			getLikePartyList();
			getLikeMountainList();
			getMyBoardList();
			getLikeBoardList();
		}

		
		/* 새로운 챌린지 추가하기 */
		function addChallenge() {

			const param = {
				ucChallenge : document.querySelector('#ucChallenge').value
			}
			console.log(param);
			
			fetch('/challenge-add', {
				method : 'POST',
				headers : {
					'Content-Type' : 'application/json'
				},
				body : JSON.stringify(param)
			}).then(function(res) {
				return res.json()
			}).then(function(data) {
				if(data===1) {
					alert('추가 완료!');
					location.reload();
				}
			});
		}

		/*리스트 함수 칸 끝*/
		
		//가입한 소모임
		function getMyPartyList(){
			fetch('/user-party/${userInfo.uiNum}')
			.then(response => response.json())
			.then(list=> {
				console.log(list);
				let html= '';
				for(let i=0; i<list.length; i++){
					html += '<li style="cursor:pointer;" onclick="location.href=\'/views/party/view?piNum=' + list[i].piNum + '\'">' + list[i].piName;
					if(list[i].pmGrade==1){
						html += ' (★)' 
					}
					html += '</li>';
					document.querySelector('#myParty').innerHTML = html;
				}
			})
		}
		
		//좋아요(♥한) 소모임
		function getLikePartyList(){
			fetch('/user-party-like/${userInfo.uiNum}')
			.then(response => response.json())
			.then(list=> {
				console.log(list);
				let html= '';
				for(let i=0; i<list.length; i++){
					html += '<li style="cursor:pointer;" onclick="location.href=\'/views/party/view?piNum=' + list[i].piNum + '\'">' + list[i].piName + '</li>';
					document.querySelector('#likeParty').innerHTML = html;
				}
			})
		}
		
		//좋아요(♥한) 산
		function getLikeMountainList(){
			fetch('/user-mountain-like/${userInfo.uiNum}')
			.then(response => response.json())
			.then(list=> {
				console.log(list);
				let html= '';
				for(let i=0; i<list.length; i++){
					html += '<li style="cursor:pointer;" onclick="location.href=\'/views/mountain/view?miNum=' + list[i].miNum + '\'">' + list[i].mntnm + '</li>';
					document.querySelector('#likeMountain').innerHTML = html;
				}
			})
		}
		
		//좋아요(♥한) 커뮤니티게시글
		function getLikeBoardList(){
			fetch('/user-board-like/${userInfo.uiNum}')
			.then(response => response.json())
			.then(list => {
				console.log(list);
				let html = '';
				for(let i=0; i<list.length; i++){
					html += '<tr>';
					html += '<td>' + list[i].cbCategory + '</td>';
					html += '<td style="cursor:pointer;" onclick="location.href=\'/views/community/view?cbNum=' + list[i].cbNum + '\'">' + list[i].cbTitle + '</td>';
					html += '</tr>';
				}
				document.querySelector('#myLikeBoard').innerHTML = html;
			})
		}
		
		//내가 작성한 커뮤니티 게시글
		function getMyBoardList(){
			fetch('/user-board/${userInfo.uiNum}')
			.then(response => response.json())
			.then(list => {
				console.log(list);
				let html = '';
				for(let i=0; i<list.length; i++){
					html += '<tr>';
					html += '<td>' + list[i].cbCategory + '</td>';
					html += '<td style="cursor:pointer;" onclick="location.href=\'/views/community/view?cbNum=' + list[i].cbNum + '\'">' + list[i].cbTitle + '</td>';
					html += '</tr>';
				}
				document.querySelector('#myBoard').innerHTML = html;
			})
		}
		

	</script>
</body>
</html>