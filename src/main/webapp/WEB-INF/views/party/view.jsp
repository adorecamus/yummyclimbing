<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소소모임 상세페이지</title>
<%@ include file="/resources/common/header.jsp"%>
<link href="/resources/css/style2.css" rel="stylesheet" type="text/css">
<link href="/resources/css/style.css" rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<section style="background-color: #ddebd7a8;">
		<div class="container" style="padding-top: 66px;">
			<div class="row ">
				<div class="leftWrap col-xl-3 pt-5">
					<div class="partyWidget party-f mb-5">
						<div class="partyNameBox">
							<div id="mntnm" class="border-box-tit"
								style="font-family: LeeSeoyun, sans-serif; margin-bottom: 3%;"></div>
							<div id="piName" class="partyName"></div>
						</div>
						<div class="partyIcon_view">
							<img id="piIcon">
						</div>
						<div id="leftPartyInfoDiv" class="partyMemberBox">
							<div class="partyCap" style="background: #e8f8f1; padding: 12px">
								<div id="uiNickname">대장  </div>
								<div id="piMember" onclick="getMemberInfos()">
									<svg xmlns="http://www.w3.org/2000/svg" width="1.1em"height="1.1em" fill="#51B56D" class="bi bi-zoom-in" viewBox="0 0 16 16">
										<path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z" />
										<path d="M10.344 11.742c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1 6.538 6.538 0 0 1-1.398 1.4z" />
									 	<path fill-rule="evenodd" d="M6.5 3a.5.5 0 0 1 .5.5V6h2.5a.5.5 0 0 1 0 1H7v2.5a.5.5 0 0 1-1 0V7H3.5a.5.5 0 0 1 0-1H6V3.5a.5.5 0 0 1 .5-.5z" />
									</svg>
								</div>
							</div>
							<div class="dim-layer modal">
								<div class="dimBg"></div>
								<div id="membersDiv" class="pop-layer">
									<div class="pop-container">
										<button id="closeLayerBtn"
											class="btn btn-outline-primary btn-pd" style="flaot: right;">닫기</button>
										<div id="memberInfosDiv" style="text-align: -webkit-center;">
											<table style="width: 68%; text-align: -webkit-center;">
												<tbody id="memberTbody"></tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							<div id="likeBox" class="likeBox">
								<div id="likeBtn" onclick="updateLike()">
									<img src="/resources/images/banner/seed.png">
									<div class="row justify-content-center">
										<div id="likeInfo" style="color: red;" class="col-2">♡</div>
										<div id="likeCnt" class="col-5"></div>
									</div>
								</div>
								<br>
							</div>
							<br>
							<button id="partyBtn" style="margin-top: 5%;"></button>
						</div>
					</div>
				</div>
				<div class="rightWrap col-xl-9" style="margin: 0;">
					<div class="row justify-content-center">
						<div class="col-lg-8"></div>
						<div class="col-lg-10 mb-3">
							<ul
								class="payment_info_tab nav nav-pills justify-content-center mb-4"
								id="pills-tab" role="tablist" >
								<li class="nav-item m-2" role="presentation">
								<a class="nav-link btn btn-outline-primary effect-none text-dark active" style="font-size:1.24rem; font-weight:600;"
									id="pills-how-much-can-i-recive-tab" data-bs-toggle="pill"
									href="#pills-how-much-can-i-recive" role="tab"
									aria-controls="pills-how-much-can-i-recive"
									aria-selected="true">모임 소개</a></li>
								<li class="nav-item m-2" role="presentation">
								<a class="nav-link btn btn-outline-primary effect-none text-dark " style="font-size:1.24rem; font-weight:600;"
									id="pills-how-much-does-it-costs-tab" data-bs-toggle="pill"
									href="#pills-how-much-does-it-costs" role="tab"
									aria-controls="pills-how-much-does-it-costs"
									aria-selected="true">알림장</a></li>
							</ul>
							<div class="rounded shadow bg-white p-5 tab-content"
								id="pills-tabContent">
								<div class="tab-pane fade show active"
									id="pills-how-much-can-i-recive" role="tabpanel"
									aria-labelledby="pills-how-much-can-i-recive-tab">
									<div class="col-md-12 order-1 order-md-0">
										<div class="content-block">
											<div class="title">
												<h3>소소모임 소개</h3>
											</div>
											<div class="content">
												<div id="partyInfoDiv" class="partyInfos" style="color:#2d3a32">
													<p id="piExpdat" style="font-size:1.33rem">[모임날짜] </p>
													<p id="piMeetingTime" style="font-size:1.33rem">[모임시간] </p><br>
													<b id="piProfile" style="font-size:1.45rem; text-align:center;">"</b>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-pane fade " id="pills-how-much-does-it-costs"
									role="tabpanel"
									aria-labelledby="pills-how-much-does-it-costs-tab">
									<div class="col-md-12 order-1 order-md-0">
										<div class="content-block">
											<div class="title">
												<h3>알림장</h3>
											</div>
											<div class="content" style="margin: 2% 0 0 1%;">
												<div id="noticeList" class="noticeList"></div>
												<div class="inputBoxContainer-n" id="inputNoticeBox"
													style="display: none;">
													<div class="inputBox form-control w-100" id="pnContent" contenteditable="true"></div>
													<button class="btn btn-primary btn-pd " style="font-weight:600;"
														onclick="insertNotice()">등록</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>			
						<div class="col-lg-10 mb-3">
							<div class="rounded shadow bg-white p-5 tab-content"
								id="pills-tabContent">
								<div class="title">
									<h3>소근소근</h3>
								</div>
								<div class="commentBox">
									<div id="commentList"></div>
									<div class="inputBoxContainer-c" id="inputCommentBox" style="display:none;">
										<div id="inputComment" class="inputBox form-control" style="width:97%" contenteditable="true"></div>
										<div class="row">
											<div class="w-50">
												<button class="btn btn-primary btn-pd" onclick="insertPartyComment()" style="display:flex; font-weight:600; margin-left: -0.5%; justify-content:flex-start;">등록</button>
											</div>
											<div class="w-50">
												<div class="paging" ><ul class="pagination" style="list-style:none; display:flex; justify-content:flex-end;"></ul></div>
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
	</section>
	<%@ include file= "/resources/common/footer.jsp" %>
	<script>
const partyBtn = document.getElementById('partyBtn');
const party = {};

window.addEventListener('load', async function() {
	await getPartyInfos();
	const memberOnlyHtml = '<h4 style="text-align:center; color="#363636">지금 <b class="font-lee">"' + party.piName + '"</b> 소소모임에 가입해보세요 !</h4>';
	await checkPartyLikeInfo();
	await getPartyLikeCnt();
	if ('${memberAuth.pmActive}' == 1) {
		await getPartyNotice();
		await getPartyComment();
		document.getElementById('inputCommentBox').style.display='';
	} else {
		document.getElementById('noticeList').insertAdjacentHTML('beforeend', memberOnlyHtml);
		document.getElementById('commentList').insertAdjacentHTML('beforeend', memberOnlyHtml);
	}
});

function changePartyBtn(text, btnClass, clickEvent) {
	partyBtn.innerText = text;
	partyBtn.setAttribute('class', 'btn btn-' + btnClass);
	partyBtn.addEventListener('click', clickEvent);
}

// 소소모임 정보 받아오기
async function getPartyInfos(){
	const partyInfoResponse = await fetch('/party-info/${param.piNum}');
	if (!partyInfoResponse.ok) {
		const errorResult = await partyInfoResponse.json();
		alert(errorResult.message);
		return;
	}
	const partyInfo = await partyInfoResponse.json();
	for (const key of Object.keys(partyInfo)) {
		const value = partyInfo[key];
		if (value != null) {
			party[key] = partyInfo[key];
		}
	}
	fillPartyInfos();
}

// 소소모임 정보 채우기
async function fillPartyInfos() {
	document.getElementById('mntnm').innerText = party.mntnm;
	document.getElementById('piName').innerText = '"' + party.piName + '"';
	document.getElementById('uiNickname').insertAdjacentHTML('beforeend', '<b>' + party.uiNickname + '&nbsp&nbsp</b>');
	document.getElementById('piMember').insertAdjacentHTML('afterbegin', '부원  <b>' + party.memNum + "</b> / " + party.piMemberCnt);
	document.getElementById('piExpdat').insertAdjacentHTML('beforeend', '&nbsp<b>' + party.piExpdat + '</b>');
	document.getElementById('piMeetingTime').insertAdjacentHTML('beforeend', '&nbsp<b>' + party.piMeetingTime + '</b>');
	document.getElementById('piProfile').innerText += party.piProfile + " \"";
	document.getElementById('piIcon').src = '/resources/images/party/' + party.piIcon + '.png';
	if(party.piComplete === 1) {
		if ('${memberAuth.pmActive}' != 1) {
			changePartyBtn('완료', 'secondary', function() {
				alert('모집완료된 소소모임입니다 T_T');
			});
			return;
		}
	}
	if ('${memberAuth.pmActive}' == 1) {
		if ('${memberAuth.pmGrade}' == 1) {
			changePartyBtn('관리', 'primary', function() {
				location.href = '/views/party/edit?piNum=${param.piNum}';
			});
			document.getElementById('inputNoticeBox').style.display='';
			return;
		}
		changePartyBtn('탈퇴', 'light', quitParty);
		return;
	}
	changePartyBtn('가입', 'primary', joinParty);
}

const membersDiv = document.getElementById('membersDiv');
const memberTbody = document.getElementById('memberTbody');

//부원 정보 불러오기
async function getMemberInfos() {	
	let html = '';
	const membersResponse = await fetch('/party-info/members/${param.piNum}');
	if (!membersResponse.ok) {
		const errorResult = await membersResponse.json();
		console.log(errorResult);
		html += '<p>' + errorResult.message + '</p>';
		document.getElementById('memberInfosDiv').innerHTML = html;
		return;
	}
	const members = await membersResponse.json();
	console.log(members);
	for (const member of members) {
		html += '<tr>';
		if (member.pmGrade === 1) {
			html += '<td style="width:8%;">  대장  </td>'
		} else {
			html += '<td>    </td>'
		}
		if (member.uiImgPath) {
			html += '<td style="width:3%;"><img src="/userImg/' + member.uiImgPath + '" class="userImage" onerror="this.src=\'/resources/images/user/user-base-img.png\'"></td>';
		} else {
			html += '<td style="width:3%;"><img src="/resources/images/user/user-base-img.png" class="userImage"></td>';
		}		
		html += '<td style="width:21%;">  ' + member.uiNickname + '  </td>';
		html += '<td style="width:6%;">  ' + member.uiAge + '  </td>';
		html += '<td style="width:6%;">  ' + member.uiGender + '  </td>';
		html += '</tr>';
	}
	document.getElementById('memberTbody').innerHTML = html;
	showMembersPopup();
}

function showMembersPopup(){
	const membersDiv = $('#membersDiv');
    let isDim = membersDiv.prev().hasClass('dimBg'); //dimmed 레이어를 감지하기 위한 boolean 변수

    isDim ? $('.dim-layer').fadeIn() : membersDiv.fadeIn();

    let membersDivWidth = ~~(membersDiv.outerWidth()),
        membersDivHeight = ~~(membersDiv.outerHeight()),
        docWidth = $(document).width(),
        docHeight = $(document).height();

    // 화면의 중앙에 레이어를 띄운다.
    if (membersDivHeight < docHeight || membersDivWidth < docWidth) {
        membersDiv.css({
            marginTop: -membersDivHeight /2,
            marginLeft: -membersDivWidth/2
        })
    } else {
        membersDiv.css({top: 0, left: 0});
    }

    membersDiv.find('#closeLayerBtn').click(function(){
        isDim ? $('.dim-layer').fadeOut() : membersDiv.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
		return false;
    });

    $('.dimBg').click(function(){
        $('.dim-layer').fadeOut();
        return false;
    });
}

const likeBtnImg = document.querySelector("#likeBtn img");
const likeInfoDiv = document.getElementById('likeInfo');
let likeInfo = 0;
const likeCntDiv = document.getElementById('likeCnt');

// 좋아요 되어 있는지 체크
async function checkPartyLikeInfo() {
	const likeInfoResponse = await fetch('/party-like/check/${param.piNum}');
	if (!likeInfoResponse.ok) {
		const errorResult = await likeInfoResponse.json();
		alert(errorResult.message);
		return;
	}
	const likeInfoResult = await likeInfoResponse.json();
	if (likeInfoResult === 1) {
		changeLikeBtn(1);
		return;
	}
	changeLikeBtn(0);
	return;
}

function changeLikeBtn(likeStatus) {
	if (likeStatus === 1) {
		likeInfo = 1;
		likeInfoDiv.innerText = '♥';
		likeBtnImg.src = '/resources/images/banner/tree.png';
		return;
	}
	likeInfo = 0;
	likeBtnImg.src = '/resources/images/banner/seed.png';
	likeInfoDiv.innerText = '♡';
}

// 좋아요 개수 불러오기
async function getPartyLikeCnt() {
	const likeCntResponse = await fetch('/party-like/${param.piNum}');
	if (!likeCntResponse.ok) {
		const errorResult = await likeCntResponse.json();
		alert(errorResult.message);
		return;
	}
	const likeCntResult = await likeCntResponse.json();
	likeCntDiv.innerText = likeCntResult;
}

// 좋아요 & 좋아요 취소
async function updateLike(){
	const info = {
			piNum : ${param.piNum}
	}
	const updateResponse = await fetch('/party-like',{
		method: 'POST',
		headers: {
			'Content-Type' : 'application/json'
		},
		body: JSON.stringify(info)
	});
	if (!updateResponse.ok) {
		const errorResult = await updateResponse.json();
		alert(errorResult.message);
		return;
	}
	const updateResult = await updateResponse.json();
	if (updateResult === 1) {
		const likeStatus = (likeInfo === 1)? 0 : 1;
		changeLikeBtn(likeStatus);
		await getPartyLikeCnt();
		return;
	}
	alert('다시 시도해주세요.');
}

// 소소모임 가입
async function joinParty(){
	const joinResponse = await fetch('/party-info/members', {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json'
		},
		body: JSON.stringify({
			piNum: ${param.piNum}
		})
	});
	if (!joinResponse.ok) {
		const errorResult = await joinResponse.json();
		alert(errorResult.message);
		return;
	}
	const joinResult = await joinResponse.text();
	alert(party.piName + ' ' + joinResult);
	location.reload();
}

// 소소모임 탈퇴
async function quitParty(){
	const check = confirm(party.piName + ' ' + '소소모임을 탈퇴하시겠습니까?');
	if (check) {
		const quitResponse = await fetch('/party-member?piNum=${param.piNum}',{
			method: 'DELETE',
			headers: {
				'Content-Type': 'application/json'
			}
		});
		if (!quitResponse.ok) {
			const errorResult = await quitResponse.json();
			alert(errorResult.message);
			return;
		}
		const quitResult = await quitResponse.json();
		if(quitResult === true){
			alert(party.piName + ' ' + '소소모임을 탈퇴하였습니다.');
			location.href='/views/party/main';
			return;
		}
		alert('다시 시도해주세요.');
	}
}

// 알림장 내용 가져오기
async function getPartyNotice(){
	const noticeResponse = await fetch('/party-member/notice?piNum=${param.piNum}');
	if (!noticeResponse.ok) {
		const errorResult = await noticeResponse.json();
		alert(errorResult.message);
		return;
	}
	const noticeList = await noticeResponse.json();
	fillPartyNotices(noticeList);
}

//알림장 내용 채우기
function fillPartyNotices(noticeList) {
	let html = '';
	for(const notice of noticeList){
		html += '<div><div class="fixed"><b class="border-gr-tit" style="width:100%;">' + notice.pnCredat +'</b></div>';	
		html += '<div class="mt-3" contenteditable="false" style="overflow:hidden; word-break:break-all; margin-left:18px;" id="notice'+ notice.pnNum +'"><pre style="font-family: MinSans-Regular, sans-serif; color:#2d3a32; font-size:1.23rem; margin: 0px 1px 12px; font-weight:600;">' + notice.pnContent + '</pre></div></div>';
		if('${memberAuth.pmGrade}' == 1){
			html += '&nbsp<div class="float-end mb-2"><button class="btn btn-light btn-pd" style="font-weight:600;" onclick="updateNotice('+notice.pnNum+', this)">수정</button>&nbsp<button class="btn btn-dark btn-pd" style="font-weight:600; " onclick="deleteNotice('+notice.pnNum+')">삭제</button></div>'; 
		}
		html += '<hr style="border: solid 1px gray;width:100%">';
	}
	document.getElementById('noticeList').insertAdjacentHTML('beforeend', html);
}

//알림장에 공지 등록(최대10개)
async function insertNotice() {
	const pnContent = document.getElementById('pnContent').innerText.trim();
	if (pnContent == '') {
		alert('내용을 입력해주세요.');
		return;
	}
	
	const notice = {
			pnContent : pnContent
	};
	const insertResponse = await fetch('/captain/party-notice?piNum=${param.piNum}', {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json'
		},
		body: JSON.stringify(notice)
	});
	if (!insertResponse.ok) {
		const errorResult = await insertResponse.json();
		alert(errorResult.message);
		return;
	}
	const insertResult = await insertResponse.text();
	alert(insertResult);
	location.reload();
}

//알림장 공지 수정
async function updateNotice(pnNum, obj) {
	const notice = document.getElementById('notice'+pnNum);
	notice.style.border = '1px solid';
	notice.contentEditable = true;
	obj.innerText = "확인";
	obj.onclick = async function(){
		if (notice.innerText.trim() == '') {
			alert('내용을 입력해주세요.');
			return;
		}
		const updateResponse = await fetch('/captain/party-notice/'+pnNum + '?piNum=${param.piNum}', {
			method: 'PATCH',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({
				pnNum : pnNum,
				pnContent : notice.innerText.trim()
			})
		});
		if (!updateResponse.ok) {
			const errorResult = await updateResponse.json();
			alert(errorResult.message);
			return;
		}
		const updateResult = await updateResponse.json();
		if(updateResult === 1){
			alert('공지가 수정되었습니다.');
			location.reload();
			return;
		}
		alert('다시 시도해주세요');
	};
}

// 알림장 공지 삭제
async function deleteNotice(pnNum) {
	const check = confirm('공지를 삭제하시겠습니까?');
	if(check){
		const deleteResponse = await fetch('/captain/party-notice/'+pnNum + '?piNum=${param.piNum}', {
			method : 'DELETE'
		});
		if (!deleteResponse.ok) {
			const errorResult = await deleteResponse.json();
			alert(errorResult.message);
			return;
		}
		const deleteResult = await deleteResponse.json();
		if(deleteResult === 1){
			alert('공지가 삭제되었습니다.');
			location.reload();
			return;
		}
		alert('다시 시도해주세요');
	}
}

// 소근소근 내용 가져오기 & 페이징
let totalData;
const dataPerPage = 5;
let pageCount = 5;
let globalCurrentPage = 1;
const commentsList = [];

async function getPartyComment() {
	const commentsResponse = await fetch('/party-member/comments?piNum=${param.piNum}');
	if (!commentsResponse.ok) {
		const errorResult = await commentsResponse.json();
		alert(errorResult.message);
		return;
	}
	const commentsResult = await commentsResponse.json();
	for (const comments of commentsResult) {
		commentsList.push(comments);
	}
	totalData = commentsList.length;
	displayData(1);
	paging(totalData, pageCount, 1);
}

function displayData(currentPage) {
	currentPage = Number(currentPage);
	let maxpnum = (currentPage - 1) * dataPerPage + dataPerPage; 
	if (maxpnum>totalData) { maxpnum=totalData; }

	let html = "";
	for (let i=(currentPage-1)*dataPerPage; i<maxpnum; i++) { 
		html += '<div class="fixed"><b class="border-id" style="color:#000;">' + commentsList[i].uiNickname + '</b></div>';	
		html += '<div class="mt-3" contenteditable="false" style="overflow:hidden; word-break:break-all; margin-left:18px;" id="comment'+ commentsList[i].pcNum +'"><pre style="font-family: MinSans-Regular, sans-serif; color:#2d3a32; font-size:1.19rem; font-weight:600;">'+ commentsList[i].pcComment + '</pre></div>';
		if('${userInfo.uiNum}' == commentsList[i].uiNum){
			html += '&nbsp<div class="float-end"><button class="btn btn-light btn-pd" style="font-weight:600;" onclick="updatePartyComment('+commentsList[i].pcNum+', this)">수정</button>&nbsp<button class="btn btn-dark btn-pd" onclick="deletePartyComment('+commentsList[i].pcNum+')">삭제</button></div>'; 
		}
		html += '<hr style="border: solid 1px gray; width:100%;"><br>';
	}
	document.getElementById('commentList').innerHTML = html;
}

function paging(totalData, pageCount, currentPage) {
	totalPage = Math.ceil(totalData / dataPerPage);
	if (totalPage<pageCount) { pageCount=totalPage; }
	let pageGroup = Math.ceil(currentPage / pageCount);
	let last = pageGroup * pageCount;
	if (last > totalPage) { last = totalPage; }

	let first = last - (pageCount - 1);
	let next = last + 1;
	let prev = first - 1;
  
	let pageHtml = "";
	pageHtml += "<li class='page-item'>";
    pageHtml += "<div class='page-link' id='prev' name='Previous'>";
	pageHtml += "<span aria-hidden='true'>&laquo;</span>";
	pageHtml += "</div></li>";
	for (let i = first; i <= last; i++) {
		if (currentPage == i) {
			pageHtml += "<li class='page-item'><div class='page-link'>" + i + "</div></li>";
		} else {
			pageHtml += "<li class='page-item'><div class='page-link'>" + i + "</div></li>";
		}
	}
	pageHtml += "<li class='page-item'>"
    pageHtml += "<div class='page-link' id='next' name='Next'>"
	pageHtml += "<span aria-hidden='true'>&raquo;</span>"
	pageHtml += "</div></li>"
	$(".pagination").html(pageHtml);
	
	$(".pagination li div").click(function () {
		let $id = $(this).attr("id"); 
		selectedPage = $(this).text();
		if ($id == "next") {
    		if((next - 1) === totalPage) {
    			selectedPage = totalPage;
    		} else {
    			selectedPage = next;
    		}
    	}
		if ($id == "prev") {
    		if (prev > 0) {
    			selectedPage = prev;	
    		} else if (prev == 0) {
    			selectedPage = 1;
    		}
    	}
		globalCurrentPage = selectedPage;
		paging(totalData, pageCount, selectedPage);
		displayData(selectedPage);
	});
}

//소근소근 글쓰기
async function insertPartyComment(){
	const pcComment = document.getElementById('inputComment').innerText.trim();
	if (pcComment == '') {
		alert('내용을 입력해주세요.');
		return;
	}

	const comment = {
			pcComment : document.getElementById('inputComment').innerText
	}
	const insertResponse = await fetch('/party-member/comments?piNum=${param.piNum}',{
		method: 'POST',
		headers: {
			'Content-Type': 'application/json'
		},
		body: JSON.stringify(comment)
	});
	if (!insertResponse.ok) {
		const errorResult = await insertResponse.json();
		alert(errorResult.message);
		return;
	}
	const insertResult = await insertResponse.text();
	alert(insertResult);
	location.reload();
}

//소근소근 글 수정
async function updatePartyComment(pcNum, obj){
	const commentObj = document.getElementById('comment'+pcNum);
	commentObj.contentEditable = true;
	commentObj.style.border = '1px solid gray';
	obj.innerText = '확인';
	obj.onclick = async function(){
		if (commentObj.innerText.trim() == '') {
			alert('내용을 입력해주세요.');
			obj.removeEventListener
			return;
		}
		const updateResponse = await fetch('/party-member/comments/' + pcNum + '?piNum=${param.piNum}',{
			method: 'PATCH',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({
				pcComment : commentObj.innerText.trim()
			})
		});
		if (!updateResponse.ok) {
			const errorResult = await updateResponse.json();
			alert(errorResult.message);
			return;
		}
		const updateResult = await updateResponse.json();
		if(updateResult === 1){
			alert('글이 수정되었습니다.');
			location.reload();
			return;
		}
		alert('다시 시도해주세요!');
	};
}

async function sendUpdatedComments() {
	
}

// 소근소근 글 삭제
async function deletePartyComment(pcNum){
	const check = confirm('글을 삭제하시겠습니까?');	
	if (check) {
		const deleteResponse = await fetch('/party-member/comments/' + pcNum + '?piNum=${param.piNum}',{
			method: 'DELETE',
		});
		if (!deleteResponse.ok) {
			const errorResult = await deleteResponse.json();
			alert(errorResult.message);
			return;
		}
		const deleteResult = await deleteResponse.json();
		if (deleteResult === 1) {
			alert('글이 삭제되었습니다.');
			location.reload();
			return;
		}
		alert('다시 시도해주세요');
	}
}

</script>
</body>
</html>