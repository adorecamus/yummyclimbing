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
	<section class="page-header bg-tertiary">
		<div class="container">
			<div class="row">
				<div class="col-8 mx-auto text-center">
					<p class="text-primary text-uppercase fw-bold">mypage</p>
					<h2 class="mb-3 text-capitalize" onclick="location.href='/views/user/mypage'" style="cursor:pointer;">마이페이지</h2>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-lg-9">
							<div class="align-items-center mb-5">
								<div class="icon-box-item">
									<div class="block bg-white">
										<div class="row justify-content-between">
											<div class="col-xl-4 pt-3" style="text-align:center;">
												<div class="mb-4 p-5" style="background:#e8f8f1; border-radius:14px; text-align:center;">
													<!-- 프로필 사진 등록 칸-->
													<div class="profile-box">
														<img class="profile-img" src="/resources/images/user/user-base-img.png" >
													</div>
													<button class="btn btn-primary mb-2 " id="displayBtn" onclick="displayFileInput(this)">사진변경</button>
													<input type="hidden" name="userNum"value="${userInfo.uiNum}" >
													<div class="fileWrap" style="display:none;">
														<input type="file" id="image" accept="image/png, image/jpeg"">
														<div class="row mt-4">
															<button class="btn btn-primary mb-2 " id="changeBtn" style="width:45%" onclick="changeImg(this)">확인</button>
															<button class="btn btn-light mb-2 " id="cancleBtn" style="width:45%; margin-left:5px" onclick="cancleChange(this)">취소</button>
														</div>
														<button class="btn btn-light mb-2" onclick="deleteFile()">기본 이미지로 설정</button>
														
													</div>	
												</div>
												<!-- 프로필 칸 -->
												<div class="p-4 mb-3" style="background:#e8f8f1; border-radius:14px;">
													<h3 class="mb-4">
														<span class="border-sm-tit">프로필</span>
													</h3>
													<div style="color:#386e44;">
														<b>닉네임&nbsp;&nbsp; ${userInfo.uiNickname}<br>
														이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  ${userInfo.uiName} <br>
														나이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  ${userInfo.uiAge} &nbsp;&nbsp;&nbsp;&nbsp;<br></b>
													</div>
												</div>
											</div>
											<div class="col-xl-8" style="font-family: MinSans-Regular, sans-serif">
												<div class="d-block align-items-center m-2">
													<h3 style="display: inline-block">${userInfo.uiNickname}&nbsp;님의&nbsp;&nbsp;<b
															style="color: #558f65;">Challenge !</b>
													</h3>
													<button class="btn btn-primary mb-1"
														onclick="addChallenge()" style="float: right;">추가하기</button>
													<textarea class="form-control mb-3" id="ucChallenge"
														style="resize: none;" placeholder="New Challenge"></textarea>
													<table class="table" style="text-align: center;">
														<tr>
															<th>번호</th>
															<th>도전 과제</th>
															<th>작성일</th>
															<th>수정일</th>
															<th>삭제</th>
														</tr>
														<tbody id="tBody" class="tbodyArea"></tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="widget widget-categories">
								<div id="confirm" style="display: none">
									<input type="password" class="form-control mb-2" id="uiPwd"
										placeholder="비밀번호">
									<button class="btn btn-dark mb-2" onclick="passwordConfirm()">비밀번호
										확인</button>
								</div>
								<ul class="list-unstyled widget-list">
									<li class="mb-2"><a onclick="showConfirm('update')">회원정보
											수정</a></li>
									<li class="mb-2"><a onclick="showConfirm('delete')">회원
											탈퇴</a></li>
									<li class="mb-2"><a onclick="location.href='/'">홈으로</a></li>
								</ul>
							</div>
							<div class="accordion" id="accordionPanelsStayOpenExample">
								<div class="accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button-update collapsed acc-tit"
											type="button">
											${userInfo.uiNickname}님의&nbsp;&nbsp;활동</button>
									</h2>
								</div>
								<div class="accordion-item">
									<h2 class="accordion-header" id="panelsStayOpen-headingTwo">
										<button class="accordion-button collapsed acc-tit"
											type="button" data-bs-toggle="collapse"
											data-bs-target="#panelsStayOpen-collapseTwo"
											aria-expanded="false"
											aria-controls="panelsStayOpen-collapseTwo">
											가입한&nbsp;&nbsp;소모임</button>
									</h2>
									<div id="panelsStayOpen-collapseTwo"
										class="accordion-collapse collapse"
										aria-labelledby="panelsStayOpen-headingTwo">
										<div class="accordion-body">
											<span id="myParty" class="sp-color-b"></span>
										</div>
									</div>
								</div>
								<div class="accordion-item">
									<h2 class="accordion-header" id="panelsStayOpen-headingThree">
										<button class="accordion-button collapsed acc-tit"
											type="button" data-bs-toggle="collapse"
											data-bs-target="#panelsStayOpen-collapseThree"
											aria-expanded="false"
											aria-controls="panelsStayOpen-collapseThree">
											♥한&nbsp;&nbsp;소모임</button>
									</h2>
									<div id="panelsStayOpen-collapseThree"
										class="accordion-collapse collapse"
										aria-labelledby="panelsStayOpen-headingThree">
										<div class="accordion-body">
											<span id="likeParty" class="sp-color-b"></span>
										</div>
									</div>
								</div>
								<div class="accordion-item">
									<h2 class="accordion-header" id="panelsStayOpen-headingfour">
										<button class="accordion-button collapsed acc-tit"
											type="button" data-bs-toggle="collapse"
											data-bs-target="#panelsStayOpen-collapsefour"
											aria-expanded="false"
											aria-controls="panelsStayOpen-collapsefour">
											♥한&nbsp;&nbsp;산</button>
									</h2>
									<div id="panelsStayOpen-collapsefour"
										class="accordion-collapse collapse"
										aria-labelledby="panelsStayOpen-headingfour">
										<div class="accordion-body">
											<span id="likeMountain" class="sp-color-b"></span>
										</div>
									</div>
								</div>
								<div class="accordion" id="accordionPanelsStayOpenExample">
									<div class="accordion-item">
										<h2 class="accordion-header" id="panelsStayOpen-headingfive">
											<button class="accordion-button collapsed acc-tit"
												type="button" data-bs-toggle="collapse"
												data-bs-target="#panelsStayOpen-collapsefive"
												aria-expanded="false"
												aria-controls="panelsStayOpen-collapsefive">
												♥한&nbsp;&nbsp;게시글</button>
										</h2>
										<div id="panelsStayOpen-collapsefive"
											class="accordion-collapse collapse"
											aria-labelledby="panelsStayOpen-headingfive">
											<div class="accordion-body">
												<table class="table" style="text-align: center;">
													<tr>
														<th>제목</th>
													</tr>
													<tbody id="myLikeBoard"></tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
								<div class="accordion" id="accordionPanelsStayOpenExample">
									<div class="accordion-item">
										<h2 class="accordion-header" id="panelsStayOpen-headingsix">
											<button class="accordion-button collapsed acc-tit"
												type="button" data-bs-toggle="collapse"
												data-bs-target="#panelsStayOpen-collapsesix"
												aria-expanded="false"
												aria-controls="panelsStayOpen-collapsesix">작성 게시글</button>
										</h2>
										<div id="panelsStayOpen-collapsesix"
											class="accordion-collapse collapse"
											aria-labelledby="panelsStayOpen-headingsixs">
											<div class="accordion-body">
												<table class="table" style="text-align: center;">
													<tr>
														<th>제목</th>
													</tr>
													<tbody id="myBoard"></tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container"></div>
	</section>
<%@ include file= "/resources/common/footer.jsp" %>
	
	
<!-- Challenge Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">챌린지 정보</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       <table class="table">
		<tr>
			<th>도전 목표</th>
			<th>생성일</th>
		</tr>
		<tbody id="challengeTBody"></tbody>
	</table>
	<br>
	<textarea class="form-control" id="ucChangeChallenge" style="resize: none"></textarea>
	<br>
      </div>
      <div class="modal-footer">
<!-- 	      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">돌아가기</button>
	      <button type="button" id="upBtn" class="btn btn-primary">수정</button>
	      <button type="button" id="delBtn" class="btn btn-primary">도전성공</button> -->
      </div>
    </div>
  </div>
</div>
	<script>
	
	//윈도우 시작시 자동시작함수
	window.onload = function() {
		if ('${userInfo.uiImgPath}' != '') {
			document.querySelector(".profile-img").src = '/userImg/${userInfo.uiImgPath}';
		}
		getChallengeList();
		getMyPartyList();
		getLikePartyList();
		getLikeMountainList();
		getMyBoardList();
		getLikeBoardList();
	}
	
		
	
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

			 
			fetch('/user-info/${userInfo.uiNum}', {
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
		

		
		/* 프로필 설정 함수*/

function displayFileInput(obj) {
	document.querySelector(".fileWrap").style.display = "";
	obj.style.display = "none";
}
		
function cancleChange(obj) {
	document.getElementById('displayBtn').style.display = "";
	document.querySelector(".fileWrap").style.display = 'none';
	document.getElementById('image').value = "";
	if ('${userInfo.uiImgPath}' != '') {
		document.querySelector(".profile-img").src = '/userImg/${userInfo.uiImgPath}';
		return;
	}
	document.querySelector(".profile-img").src = "/resources/images/user/user-base-img.png";
}
		
const sel_file = [];
const maxSize = 5242880; //5MB
		
$("input[type='file']").on("change", handleImgFileSelect);

function handleImgFileSelect(e){
	const inputTarget = e.target;
	const file = inputTarget.files[0];
	
	if (!checkExtension(file)) {
		inputTarget.value = "";
		return;
	}
	
	sel_file.push(file);
	
	//파일을 읽어주는 객체 생성
	let reader = new FileReader();
	reader.onload = function(e){
		document.querySelector(".profile-img").src = e.target.result;
	}
	reader.readAsDataURL(file);
}

function deleteFile() {
	document.getElementById('image').value = "";
	document.querySelector(".profile-img").src = "/resources/images/user/user-base-img.png";
}

//확장자, 크기 체크
function checkExtension(file){
	console.log(file.size);
	if(file.size >= maxSize){
		alert("5MB까지 업로드 가능합니다.");
		return false;
	}
	
	if(!file.type.match("image.*")){
		alert("이미지 파일만 업로드 가능합니다.");
		return false;
	}
	return true;
}

function changeImg(){
	const formData = new FormData();
	const inputObj = document.getElementById('image');
	if(inputObj.files.length==1){
		const file = inputObj.files[0];
		if(!checkExtension(file)){
			return;
		}
		formData.append('multipartFile',file);
	} else {
		if (!confirm('기본 이미지로 등록하시겠습니까?')){
			return;
		}
	}
	formData.enctype='multipart/form-data'; 
	const xhr = new XMLHttpRequest();
	xhr.open('POST', '/user-info/file/${userInfo.uiNum}');
	xhr.onreadystatechange = function() {
		if(xhr.readyState === xhr.DONE) {
			if(xhr.status === 200) {
				alert('사진이 등록되었습니다.');
				location.reload();
			} else {
				alert('사진 등록에 실패했습니다.');
			}
		}
	}
	xhr.send(formData);
}
			
		

		/* 개인정보 칸 함수 끝 */

		/*리스트 함수 칸*/

		/* 챌린지 불러오기 */
		function getChallengeList() {
			fetch("/challenge/list/${userInfo.uiNum}")
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
									html += '<td style="font-size:1.11rem; font-weight:600" onclick="getChallenge(\'' + userChallenge[i].ucNum + '\')"><a style="color: #558f65;" href="/views/challengeList/view?ucNum='
											+ userChallenge[i].ucNum
											+ '" data-bs-toggle="modal" data-bs-target="#exampleModal" style="cursor:pointer">'
											+ userChallenge[i].ucChallenge
											+ '</td>';
									html += '<td>' + userChallenge[i].ucCredat
											+ '</td>';
									html += '<td>' + userChallenge[i].ucLmodat
											+ '</td>';
									html += '<td><button class="xbox btn btn-light" onclick="reply_click(this.value)" value=' + userChallenge[i].ucNum + '>x</button></td>';
									html += '</tr>'
									
								}
								document.querySelector('#tBody').innerHTML = html;
								
							});
		}	

		function getChallenge(ucNum) {

			fetch('/challenge/' + ucNum)
			.then(function(res) {
				return res.json();
				console.log(res);
			}).then(function(data) {
				let html = '';
				html += '<tr>';
				html += '<td>' + data.ucChallenge + '</td>';
				html += '<td >' + data.ucCredat + '</td>';
				html += '</tr>';
				document.querySelector('#challengeTBody').innerHTML = html;
				console.log(document.getElementById("upBtn"));
				
				
				let buttonHtml = '';
				buttonHtml += '<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">돌아가기</button>'
				buttonHtml += '<button type="button" class="btn btn-primary"  onclick="updateUserChallenge(' + ucNum + ')">수정</button>'
				buttonHtml += '<button type="button" class="btn btn-primary" onclick="deleteUserChallenge(' + ucNum + ')">도전성공</button>'
		        
				document.querySelector('.modal-footer').innerHTML = buttonHtml;
		        
			})

		}
		
		function updateUserChallenge(ucNum) {

			const param = {
				ucChallenge : document.querySelector('#ucChangeChallenge').value
			}

			console.log(param);
			fetch('/challenge/Update/'+ ucNum, {
				method : 'PATCH',
				headers : {
					'Content-Type' : 'application/json'
				},
				body : JSON.stringify(param)
			}).then(function(res) {
				return res.json();
			}).then(function(data) {
				if (data === 1) {
					alert('수정 완료');
					location.href = '/views/user/mypage';
				}
			});
		}

		/*챌린지 리스트 삭제 함수 */
		function deleteUserChallenge(ucNum) {
			fetch('/challenge/Clear/' + ucNum, {
				method : 'DELETE'
			}).then(function(res) {
				return res.json();
			}).then(function(data) {
				if (data === 1) {
					alert('앞으로도 화이팅!');
					location.href = '/views/user/mypage';
				}
			});
		}
		
		
		/* 새로운 챌린지 추가하기 */
		function addChallenge() {

			const ucChallenge = document.querySelector('#ucChallenge').value;
			
			if(ucChallenge == ''){
				alert('챌린지를 추가해보세요!');
				return;
			}

			if(ucChallenge.trim().length > 20){
				alert('챌린지의 길이는 20자를 초과할 수 없습니다!');
				return;
			}
			
			const param = {
					ucChallenge : document.querySelector('#ucChallenge').value
				}
				console.log(param);
			
			fetch('/challenge/add', {
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

		
		
		//챌린지 삭제....
	/* $(".xbox btn btn-light").click(function(){
			alert(document.getElementsByClassName(".xbox btn btn-light")[this].value);
		});
		
		document.getElementsByClassName(".xbox btn btn-light")[this].value;
		
		var click_class = $(this).attr('class');
		var click_val = $(".") */ 
		
		/* $("button[name=num]").click(function (){
			alert($(this).val());
		}); */
			
	
		function reply_click(click_button){
			console.log(click_button)
			fetch('/challenge/Clear/' + click_button, {
				method : 'DELETE'
			}).then(function(res) {
				return res.json();
			}).then(function(data) {
				if (data === 1) {
					alert('챌린지가 삭제되었습니다!');
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
					html += '<li class="d-flex widget-post align-items-center" style="cursor:pointer;" onclick="location.href=\'/views/party/view?piNum=' + list[i].piNum + '\'">' + list[i].piName;
					if(list[i].pmGrade==1){
						html += ' (★)' 
					}
					html += '</li>';
					html += '<hr>'
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
					html += '<hr>'
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
					html += '<hr>'
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
					html += '<td style="cursor:pointer; text-align: left;" onclick="location.href=\'/views/community/view?cbNum=' + list[i].cbNum + '\'">' + list[i].cbTitle + '</td>';
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
					html += '<td style="cursor:pointer; text-align: left;" onclick="location.href=\'/views/community/view?cbNum=' + list[i].cbNum + '\'">' + list[i].cbTitle + '</td>';
					html += '</tr>';
				}
				document.querySelector('#myBoard').innerHTML = html;
			})
		}
		

	</script>
</body>
</html>