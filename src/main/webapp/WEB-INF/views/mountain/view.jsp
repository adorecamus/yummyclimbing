<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>산</title>
<%@ include file="/resources/common/header.jsp"%>
<link href="/resources/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${kakaoMapKey}&libraries=services,clusterer,drawing"></script>
</head>
<body>
<div class="container">
<div id="mountainPageWrap" style="text-align: center;">
	<!-- header -->
	<div class="row col-8 mx-auto text-center mt-10">
		<h2 class="text-capitalize" onclick="location.href='/views/mountain/list'" style="cursor: pointer">
		</h2>
		<div id="mountainName" style="width: 100%;"></div>
		<div id="mountainSubTitle" class="mb-5 mountainSubTitle"></div>
		<div id="likeWrap" class="position-absolute" style="cursor: pointer; margin-left:-78px;">
			<div id="mountainLike" class="mountainLikeIcon " style="width: 50px;" onclick="setMountainLike()">
				<img src="/resources/images/user/empty-heart.png">
				<div class="m-md-3" id="likeCount"></div>
			</div>
		</div>
	</div>
</div>	
<div id="mountainHeaderWrap" class="row" style="color:#2d2d2d;">
	<div id="mountainInfoWrap" class="col-lg-6 mb-3" >
		<div id="mountainImg" class="mb-4" style="width: 100%; height: 400px; overflow: hidden; margin-bottom: 0.25rem">
		</div>
		<div style="margin: 0 auto;">
			<div id="heightWrap">
				<div style="width: 20%; float: left; text-align: center"><span class="border-tit">높이</span></div>
				<div id="mountainHeight"
					style="width: 80%; float: left; text-align: left;"></div>
			</div>
			<div id="areaWrap"
				style="width: 100%; display: inline-block; float: left; margin: 0.25rem auto">
				<div style="width: 20%; float: left; text-align: center"><span class="border-tit">지역</span></div>
				<div id="mountainArea"
					style="width: 80%; float: left; text-align: left;"></div>
			</div>
		</div>
	</div>
	<div id="envirmentWrap" class="col-lg-6 mb-3">
		<div id="map" style="height: 25rem;"></div>
		<div id="weatherWrap" class="mt-3" style="width: 100%; display: flex;  align-items: center; justify-content: center;">
			<img id="weatherIcon" style="width: 15%; height: 15%; object-fit: fill;">
			<div id="weatherDiv"
				style="width: 60%; margin-left: 0.25rem; text-align: left; text-align:center; vertical-align: middle;"></div>
		</div>
	</div>
</div>
 </div>

	<!-- article -->
<div class="row justify-content-center mb-4">
     <div class="col-lg-8">
		<div id="mountainInfoArticleWrap" style="position: relative; clear: both; margin: 0 auto;  margin-top:20px;">
			<div id="mountainInfoListWrap">
				<div id="mountainInfoList">
					<div id="mountainReason" class="service-item">
						<div onclick="toggleContent(this)" style=" border:solid; border-width:1px; cursor: pointer;"
							class="accordion-header accordion-button h5 border-0 " id="heading-4b82be4be873c8ad699fa97049523ac86b67a8bd" data-bs-toggle="collapse"
            				data-bs-target="#collapse-4b82be4be873c8ad699fa97049523ac86b67a8bd" aria-expanded="false"
             				aria-controls="collapse-4b82be4be873c8ad699fa97049523ac86b67a8bd">
             				<h4>100대 명산 선정이유</h4>
           				</div>
						<div class="contents lh-lg p-sm-5" style="display:none;"></div>
					</div>
					<div id="mountainDetails" class="service-item">
					<div onclick="toggleContent(this)" style="border:solid; border-width:1px; cursor: pointer;"
						class="accordion-header accordion-button h5 border-0 " id="heading-4b82be4be873c8ad699fa97049523ac86b67a8bd" data-bs-toggle="collapse"
           				data-bs-target="#collapse-4b82be4be873c8ad699fa97049523ac86b67a8bd" aria-expanded="false"
             			aria-controls="collapse-4b82be4be873c8ad699fa97049523ac86b67a8bd">
             			<h4>세부정보</h4>
           			</div>
					<div class="contents lh-lg p-sm-5" style="display:none;"></div>
					</div>
					<div id="mountainOverview" class="service-item">
						<div onclick="toggleContent(this)" style="border:solid; border-width:1px; cursor: pointer;"
							class="accordion-header accordion-button h5 border-0 " id="heading-4b82be4be873c8ad699fa97049523ac86b67a8bd" data-bs-toggle="collapse"
	            			data-bs-target="#collapse-4b82be4be873c8ad699fa97049523ac86b67a8bd" aria-expanded="false"
	             			aria-controls="collapse-4b82be4be873c8ad699fa97049523ac86b67a8bd">
	            			<h4>산 요약</h4>
	           			</div>
						<div class="contents lh-lg p-sm-5" style="display:none;"></div>
					</div>
					<div id="mountainEtcCourse" class="service-item">
					<div onclick="toggleContent(this)" style="border:solid; border-width:1px; cursor: pointer;"
						class="accordion-header accordion-button h5 border-0 " id="heading-4b82be4be873c8ad699fa97049523ac86b67a8bd" data-bs-toggle="collapse"
            			data-bs-target="#collapse-4b82be4be873c8ad699fa97049523ac86b67a8bd" aria-expanded="false"
             			aria-controls="collapse-4b82be4be873c8ad699fa97049523ac86b67a8bd">
             			<h4>등산코스</h4>
           			</div>
				<div class="contents lh-lg p-sm-5" style="display:none;"></div>
			</div>
			<div id="mountainTourism" class="service-item">
				<div onclick="toggleContent(this)" style="width:100%;border:solid; border-width:1px; cursor: pointer;"
				class="accordion-header accordion-button h5 border-0 " id="heading-4b82be4be873c8ad699fa97049523ac86b67a8bd"  data-bs-toggle="collapse"
            		data-bs-target="#collapse-4b82be4be873c8ad699fa97049523ac86b67a8bd" aria-expanded="false"
             		aria-controls="collapse-4b82be4be873c8ad699fa97049523ac86b67a8bd"><h4>숙식 및 기타정보 / 이용문의</h4></div>
				<div class="contents lh-lg p-sm-5" style="display:none;"></div>
			</div>
			
			<div id="mountainTransport" class="service-item">
				<div onclick="toggleContent(this)" style="width:100%;border:solid; border-width:1px; cursor: pointer;"
				class="accordion-header accordion-button h5 border-0 " id="heading-4b82be4be873c8ad699fa97049523ac86b67a8bd" data-bs-toggle="collapse"
            		data-bs-target="#collapse-4b82be4be873c8ad699fa97049523ac86b67a8bd" aria-expanded="false"
             		aria-controls="collapse-4b82be4be873c8ad699fa97049523ac86b67a8bd"><h4>대중교통정보</h4></div>
				<div class="contents lh-lg p-sm-5" style="display:none;"></div>
			</div>
		</div>
		<div id="partyOfMountainWrap">
			<div id="partyTitleWrap" class="service-item"> 
				<div onclick="toggleContent(this)" style="width:100%;border:solid; border-width:1px; cursor: pointer;"
				class="accordion-header accordion-button h5 border-0 " id="heading-4b82be4be873c8ad699fa97049523ac86b67a8bd" data-bs-toggle="collapse"
             	data-bs-target="#collapse-4b82be4be873c8ad699fa97049523ac86b67a8bd" aria-expanded="false"
              	aria-controls="collapse-4b82be4be873c8ad699fa97049523ac86b67a8bd"><h4>소소모임</h4></div>
			<div id="partyDivWrap" class="contents lh-lg p-sm-5" style="display:none;">
				<div id="partyDivBody" class="row cur-po mb-3" style="max-width:1182px; margin:0 auto; justify-content:center;">
				</div>
				<div class="paging-div justify-content-center" style=" display:flex; padding-bottom: 10px; align-items:center;"> 
					<ul class="paginationParty" id="paginationParty"></ul>
				</div>
			</div>
		</div>
	</div>
</div>
	<div id="mountainCommentWrap" style="clear:both;" class="mt-10 mb-2">
		<div id="mountainComment">
			<div class="container">
				<div class="commentCnt">
					<h4>댓글</h4>
					<span id="commentCnt"></span>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container border-top">
		<div id="mountainCommentWrap" style="display: block; clear:both; margin:20px 0 20px 0;" >
			<div id="mountainComment">
				<div id="commentDivBody" style="diplay:flex;"></div>
				<div class="paging-div justify-content-center" style=" display:flex; padding-bottom: 10px; align-items:center;"> 
  					<ul class="paginationComment" id="paginationComment"></ul>
				</div>
				<c:if test="${userInfo ne null}">
					<div id="mountainCommentInsertWrap" style="clear:both; margin:0 auto;" class="w-100">
						<textarea class=" form-control" id="montainCommentory" placeholder="댓글을 입력하세요...(최대 300자)" style="resize: none;"></textarea>
							<div class="insertBtn mt-3 mb-3" >
								<button onclick="insertMountainComment()" class="btn btn-primary float-end">등록</button>
							</div>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</div>
</div>
</div>
<%@ include file= "/resources/common/footer.jsp" %>
	
<script>
window.addEventListener('load', async function(){	
	await renderingMountainInfo();
});
let commentFlag=true;
let partyFlag=true;


//sibling div class(.contents) display toggle
function toggleContent(obj){
	const divObj = obj;
	const divParent = divObj.parentNode;
	const divContent = divParent.getElementsByClassName("contents")[0];
	
	if(divContent.style.display==='none'){
		divObj.style.backgroundColor = '#EAEAEA';
		divContent.style.display='block';
	} else {
		divObj.style.backgroundColor = '';
		divContent.style.display='none';
	}
	return;
}

//선택한 산의 정보를 불러오기
async function getSelectedMountainInfo(){
	const miNum = '${param.miNum}';
	const mountainURL = '/mountain/' + miNum;
	const response = await fetch(mountainURL);
	const mountainInfo = await response.json();

	return mountainInfo;
}

async function renderingMountainInfo(){
	const mountainInfo = await getSelectedMountainInfo();
	if(mountainInfo!==null){
		/* header part*/
		document.querySelector("title").innerText = mountainInfo.mntnm;
		document.querySelector("#mountainName").innerHTML = '<h1>' + mountainInfo.mntnm + '</h1>'; // 산이름
		document.querySelector("#mountainArea").innerHTML = '<span>' + mountainInfo.areanm + '</span>'// 산지역명
		document.querySelector("#mountainHeight").innerText =  mountainInfo.mntheight + 'm'; // 산높이
		document.querySelector("#mountainSubTitle").innerHTML = '<h5>' + mountainInfo.subnm + '</h5>'; // 산 부제
		document.querySelector("#mountainImg").innerHTML = '<img style="width:100%; height:100%; object-fit:fill;" src="'
														 + mountainInfo.mntnattchimageseq + '"'
														 + ' onerror="this.src=\'/resources/images/mountain/mountain-no-img.png\'">'; // 산이미지 url

		/* article part*/
		document.querySelector("#mountainReason .contents").innerHTML = '<div class="aeatreason" align="left">' + mountainInfo.aeatreason + '</div>'; // 100대산 선정 이유
		document.querySelector("#mountainDetails .contents").innerHTML = '<div class="details" align="left">' + mountainInfo.details + '</div>'; // 세부설명
		document.querySelector("#mountainEtcCourse .contents").innerHTML =  '<div class="etccourse" align="left">' + mountainInfo.etccourse + '</div>'; // 기타코스
		document.querySelector("#mountainOverview .contents").innerHTML = '<div class="overview" align="left">' + mountainInfo.overview + '</div>'; // 요약
		document.querySelector("#mountainTourism .contents").innerHTML =  '<div class="tourisminf" align="left">' + mountainInfo.tourisminf + '</div>'; // 주변관광정보
		document.querySelector("#mountainTransport .contents").innerHTML =  '<div class="transport" align="left">' + mountainInfo.transport + '</div>'; // 교통정보
		
		let mountainPlace = {
			x : mountainInfo.lot, // 산 데이터 경도
			y : mountainInfo.lat, // 산 데이터 위도
			place_name : mountainInfo.mntnm // 산 이름
		} // 산 위치 관련 정보를 저장한 구조체
		
	
		await getLikesMountain(mountainInfo.miNum);
		await renderingComments(mountainInfo.miNum);
		await renderingParties(mountainPlace.place_name);	

		
		if('${userInfo}'!==''){ // 로그인 안되있으면 실행x
			checkMountainLike('${userInfo.uiNum}', mountainInfo.miNum);
		}
		
		const keyword = '100대명산 ' + mountainPlace.place_name; // '100대명산'을 명시해줘야 다른 키워드가 붙지 않음(xx산 음식점 등)
		
		if(mountainPlace.x===0 || mountainPlace.y==0){ // 둘중 하나라도 0이면 좌표값을 불러오지 못했거나 없는것. 좌표값이 없을 경우 키워드 검색으로 이동
//			alert('아이고 좌표가 없네');
			ps.keywordSearch(keyword, placesSearchCB); // 카카오맵 키워드 검색
		} else{
			setCenter(mountainPlace.y, mountainPlace.x); // 좌표 기준 중앙정렬
			displayMarker(mountainPlace); // 마커생성
		}
		await getWeather(mountainPlace.y, mountainPlace.x, '${openWeatherMapAPI}');
	}
	
}

//산의 소소모임 불러오기
async function getPartyOfMountain(mountainName, partyPageNum){
	if (partyPageNum === undefined) {
		partyPageNum = 1;
	}	
	const PartyOfMountainURL = '/party-infos/mountain/' + mountainName + '/' + partyPageNum;
	const response = await fetch(PartyOfMountainURL);
	const parties = await response.json();
	partyFlag = true;
	return parties;
}

async function renderingParties(mountainName, partyPageNum){
	if (partyPageNum === undefined) {
		partyPageNum = 1;
	}
	const parties = await getPartyOfMountain(mountainName, partyPageNum);
	
	let html='';
	console.log(parties.list.length);
	if(parties === null || parties.list.length===0){
		html += '<p>' + '해당 산의 소소모임이 없습니다.' + '</p>';
	} else {
		$("#paginationParty").twbsPagination("destroy");
		$('#paginationParty').twbsPagination({
	  		  totalPages: (parties.pages<=0)?1:[[parties.pages]], // 전체 페이지
		 	  startPage: (parties.prePage<=0)?1:parseInt([[parties.prePage+1]]), // 시작(현재) 페이지
		 	  initiateStartPageClick: false,
			  prev: "‹", // Previous Button Label
			  next: "›", // Next Button Label
			  first: '«', // First Button Label
			  last: '»', // Last Button Label
			  onPageClick: function (event, page) { // Page Click event
			       console.info("current page : " + page);
			    }
			}).on('page', function (event, page) {
				if(partyFlag){
					renderingParties(mountainName, page);
				}
				partyFlag = false;
		});
			
//		for(const party of parties){
		for(let i=0; i<parties.list.length; i++){
			html += '<div class="col-lg-3 card" style="margin:0px 5px 13px 5px; padding:0; cursor:pointer; over-flow:hidden;" onclick="location.href=\'/views/party/view?piNum=' + parties.list[i].piNum + '\'">';
			html += '<div class="p-3 card-header" style="text-align:center; overflow:hidden; height:158px; border-top-left-radius: 20px; border-top-right-radius: 20px;"><div class="border-box-tit mb-4">' + parties.list[i].mntnm +'</div>';
			html += '<img class="partyIcon_main mb-4" style="margin-top:-2%; width:88px; height:65px" src="/resources/images/party/' + parties.list[i].piIcon + '.png">';
			html += '</div><div class="card-body party-list-f" style="background: #d9eee1; ">';
			html += '<div style="text-align:center;"><b class="mt-3">' + parties.list[i].piName + '</b></div></div>';
			html += '<div style="list-style-type: none;">'
			html += '<div class="p-3 party-list-f"><li class="list-group-item">날짜 :&nbsp;&nbsp;&nbsp;&nbsp;' + parties.list[i].piExpdat + '</li>';
			html += '<li class="list-group-item">시간 :&nbsp;&nbsp;&nbsp;&nbsp;' + parties.list[i].piMeetingTime + '</li>';
			html += '<li class="list-group-item">멤버 :&nbsp;&nbsp;&nbsp;&nbsp;' + parties.list[i].memNum + " / " + parties.list[i].piMemberCnt + '</li>';
			html += '<li class="list-group-item">좋아요 :&nbsp;' + parties.list[i].likeNum + '</li>';
			html += '생성일 :&nbsp;' + parties.list[i].piCredat;
			html += '</div></div></div>';
		}
//		document.querySelector("#partyDivBody").insertAdjacentHTML('afterbegin',html);
	}
	document.querySelector("#partyDivBody").innerHTML=html;
}
	
//산 좋아요 수 체크
function getLikesMountain(mountainNum){
	const mountainLikeURL = '/mountain-likes/';
	
	fetch(mountainLikeURL + mountainNum)
	.then(function(res){
		return res.json();
	})
	.then(function(cnt){
		if(cnt!==null){
			let html='';
			if(cnt===0){
				document.querySelector('#likeCount').style.display='none';
				return;
			} else {
				document.querySelector('#likeCount').style.display='block';
				html += '<h5>' + cnt + '</h5>'
				document.querySelector('#likeCount').innerHTML = html;
			}
		}
	});
}

//산코멘트 불러오기
async function getMountainComments(mountainNum, commentPageNum){
	if (commentPageNum === undefined) {
		commentPageNum = 1;
	}	
	const mountainCommentURI = '/mountain-comments/'+ mountainNum + '/' + commentPageNum;
	const response = await fetch(mountainCommentURI);
	const comments = await response.json();
	commentFlag = true;
	
	return comments;
}

async function renderingComments(mountainNum, commentPageNum){
	const comments = await getMountainComments(mountainNum, commentPageNum);
	console.log(comments);
	
	if(comments!==null){
		$("#paginationComment").twbsPagination('destroy');
		$('#paginationComment').twbsPagination({
	  		  totalPages: (comments.pages<=0)?1:[[comments.pages]], // 전체 페이지
		 	  startPage: (comments.prePage<=0)?1:parseInt([[comments.prePage+1]]), // 시작(현재) 페이지
		 	  initiateStartPageClick: false,
			  prev: "‹", // Previous Button Label
			  next: "›", // Next Button Label
			  first: '«', // First Button Label
			  last: '»', // Last Button Label
			  onPageClick: function (event, page) { // Page Click event
			       console.info("current page : " + page);
			    }
			}).on('page', function (event, page) {
				if(commentFlag){
					renderingComments('${param.miNum}', page);
				}
				commentFlag = false;
		});
		
		let html='';
		console.log(comments.list.length);
		if(comments === null || comments.list.length===0){
			html += '<p style="padding:50px; text-align: center;"> ' + '댓글이 없습니다.' + '<br>' + '처음으로 글을 남겨보세요!' + '</p>';
		} else {
//			for(const comment of comments){
			for(let i=0; i<comments.list.length; i++){
				html += '<div class="commentDiv pb-3" style="display:flex;">'
					html += '<div class="profileWrap col-3 pt-3" style=" display:inline-block; text-align:center; border-radius: 13px; margin-right:5px; background-color:rgba(0, 0, 0, 0.03);">'
						html += '<div class="imgDiv mb-2" style="width:40px; height:40px; overflow:hidden; margin:0 auto;">';
						html += '<img class="uiImgPath" style="width:100%; height:100%; object-fit:fill; margin:0 auto;" src="' + comments.list[i].uiImgPath + '" onerror="this.src=\'/resources/images/user/user-base-img.png\'">';
						html += '</div>';
						html += '<div class="nickNameDiv" style="width:100%; margin:0 auto;">';
							html += '<p class="niNickname border-m-id " style="width:30%;">' + comments.list[i].uiNickname + '</p>';
						html += '</div>';
						html += '<div class="dateDiv" style="width:100%; margin:0 auto; margin-bottom:0;">';
							html += '<p class="commentDate" style="margin-bottom:0;">' + comments.list[i].mcCredat.replace(/(\d{4})(\d{2})(\d{2})/g, '$1-$2-$3'); + '</p>';
							html += '<p class="commentTime" style="margin-bottom:0;">' + comments.list[i].mcCretim.replace(/(\d{2})(\d{2})(\d{2})/g, '$1:$2:$3'); + '</p>';
						html += '</div>';
				html += '</div>';
				html += '<textarea class="w-75 mcComment' + comments.list[i].uiNum + '-' + comments.list[i].mcNum + '" name="comment" style="resize:none; border:none; padding:13px; border-radius: 13px;" disabled>' + comments.list[i].mcComment + '</textarea>';					
				html += '<div class="commentButtonWrap ms-sm-2" style="display:none; width:70px" data-uiNum="' + comments.list[i].uiNum + '">'
				html += '<button type="button" class="commentChange btn btn-light mb-1" style="min-width:61px; margin-top:68px;" data-uiNum="' + comments.list[i].uiNum + '"data-mcNum="' + comments.list[i].mcNum +'">수정' + '</button>';
				html += '<button type="button" class="commentDelete btn btn-dark" style="min-width:61px;"data-uiNum="' + comments.list[i].uiNum + '"data-mcNum="' + comments.list[i].mcNum +'">삭제' + '</button>';
				html += '</div>';
				html += '</div>';
				
			}
			
		}
		document.querySelector("#commentDivBody").innerHTML = html;
		await setCommentButtonEvent();
		await setButtonVisiable();
	}
}

	
//버튼이벤트 등록
function setCommentButtonEvent(){
	const changeButtons = document.querySelectorAll(".commentChange");
	
	for(const changeButton of changeButtons){
		changeButton.addEventListener('click', updateMountainComment);
	}
	const deleteButtons = document.querySelectorAll(".commentDelete");
	for(const deleteButton of deleteButtons){
		deleteButton.addEventListener('click', deleteMountainComment);
	}
}

//버튼 표시
function setButtonVisiable(){
	const buttonWraps = document.querySelectorAll(".commentButtonWrap");
	
	for(const buttonWrap of buttonWraps){
		if(buttonWrap.getAttribute("data-uiNum")=='${userInfo.uiNum}'){
			buttonWrap.style.display="";
		} else {
			buttonWrap.style.display="none";
		}
	}
}

//좋아요 수 체크
function checkMountainLike(uiNum, miNum){
	checkMountainLikeURL = '/mountain-like/check';
	const checkLikeParam = {
		uiNum: uiNum,
		miNum: miNum
	};
	
	fetch(checkMountainLikeURL,{
		method: 'POST',
		headers: {
			'Content-Type': 'application/json'
		},
		body: JSON.stringify(checkLikeParam)
	})
	.then(function(response){
			return response.json();
	})
	.then(result => {
		if(result===1){
//			console.log(result);
			document.querySelector("#mountainLike img").src = '/resources/images/user/red-heart.png';
			return;
		} 
		document.querySelector("#mountainLike img").src = '/resources/images/user/empty-heart.png';
		return;
	})
}

//좋아요 설정(클릭)
function setMountainLike(){
	const setMountainLikeURL = '/mountain-like/set'
	const uiNum = '${userInfo.uiNum}';
	const miNum = '${param.miNum}';
	const checkLikeParam = {
		uiNum: uiNum,
		miNum: miNum
	};
	
	fetch(setMountainLikeURL,{
		method: 'POST',
		headers: {
			'Content-Type': 'application/json'
		},
		body: JSON.stringify(checkLikeParam)
	})
	.then(function(response){
		return response.json();
	})
	.then(result => {
		if(result===1){
			checkMountainLike(uiNum, miNum);
			getLikesMountain(miNum);
		}
	});
}
//산 코멘트 입력
async function insertMountainComment(){
	const insertMountainCommentURI = '/mountain-comment';
	const insertParam = {
		miNum : '${param.miNum}',
		uiNum : '${userInfo.uiNum}',
		mcComment : document.querySelector("#montainCommentory").value
	};
	
	//--validation--//
	if(insertParam.mcComment.trim().length>300){
		alert('코멘트는 300자 이하');
		document.querySelector("#montainCommentory").focus();
		return;
	}
	
	if(insertParam.mcComment.trim().length===0){
		alert('내용을 입력하세요');
		document.querySelector("#montainCommentory").focus();
		return;
	}	
	//--validation end--//
	
	const response = await fetch(insertMountainCommentURI,{
			method: 'PUT',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify(insertParam)
		})
	
	const result = await response.json();

	if(result === 1){
		alert('댓글 등록완료');
		document.querySelector("#montainCommentory").value = '';
		commentFlag = true;
		await renderingComments(insertParam.miNum);
		return;
	}
	alert('댓글 등록실패');
}
// 코멘트 수정
async function updateMountainComment(){
	const updateMountainCommentURI = '/mountain-comment/update';
	const uiNum = this.getAttribute("data-uiNum");
	const mcNum = this.getAttribute("data-mcNum");
	
//	console.log(document.querySelector(".mcComment"+uiNum));
	document.querySelector('.mcComment'+uiNum+'-'+mcNum).style.border = '1px solid';
	document.querySelector('.mcComment'+uiNum+'-'+mcNum).disabled = false;
	
	this.innerText = "확인"
	
	this.addEventListener('click', async function(){
		const updateParam = {
				miNum : '${param.miNum}',
				uiNum : uiNum,
				mcNum : mcNum,
				mcComment : document.querySelector('.mcComment'+uiNum).value
		};
		
		//--validation--//
		if(updateParam.mcComment.trim().length>300){
			alert('코멘트는 300자 이하');
			document.querySelector("#montainCommentory").focus();
			return;
		}
		
		if(updateParam.mcComment.trim().length===0){
			alert('내용을 입력하세요');
			document.querySelector("#montainCommentory").focus();
			return;
		}	
		//--validation end--//
		
		const response = await fetch(updateMountainCommentURI,{
				method: 'PATCH',
				headers: {
					'Content-Type': 'application/json'
				},
				body: JSON.stringify(updateParam)
			})
		const result = await response.json();

		if(result === 1){
			alert('댓글 수정완료');
			commentFlag = true;
			await renderingComments(updateParam.miNum);
			return;
		}
		alert('댓글 수정실패');
	});
}
// 산 코멘트 삭제(비활성화)
async function deleteMountainComment(){
	const deleteMountainCommentURI = '/mountain-comment/delete';
	const uiNum = this.getAttribute("data-uiNum");
	const mcNum = this.getAttribute("data-mcNum");
	
	const deleteParam = {
		miNum : '${param.miNum}',
		uiNum : uiNum,
		mcNum : mcNum
	};
	
	const response = await fetch(deleteMountainCommentURI,{
		method: 'PATCH',
		headers: {
			'Content-Type': 'application/json'
		},
		body: JSON.stringify(deleteParam)
	});
	const result = await response.json();
		
	if(result===1){
		alert('댓글 삭제완료');
		commentFlag = true;
		await renderingComments(deleteParam.miNum);
		return;
	}
	alert('댓글 삭제실패');
}

//-----kakao map-----//
var mapContainer = document.getElementById('map'), // 지도를 표시할 div
mapOption = { 
	center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표(기본값)
	level: 7 // 지도의 확대 레벨
};
var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1}); // infowindow
var mapTypeControl = new kakao.maps.MapTypeControl(); //일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl(); //지도 확대 축소를 제어할 수 있는 줌 컨트롤을 생성합니다
var ps = new kakao.maps.services.Places(); // 장소 검색 객체를 생성합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT); //kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT); // 줌컨트롤
function setCenter(lat, lot) {            
    var moveLatLon = new kakao.maps.LatLng(lat, lot); // 이동할 위도 경도 위치를 생성합니다
    map.setCenter(moveLatLon); // 지도 중심을 이동 시킵니다
}
//키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        var bounds = new kakao.maps.LatLngBounds(); // LatLngBounds 객체에 좌표를 추가합니다
        
        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       
        map.setBounds(bounds);  // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setLevel(7);
    } 
}
//지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });
    kakao.maps.event.addListener(marker, 'mouseover', function() {    // 마커에 이벤트를 등록합니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;text-align:center;">' + place.place_name + '</div>'); // 장소명이 인포윈도우에 표출됩니다
        infowindow.open(map, marker);
    });
    kakao.maps.event.addListener(marker, 'mouseout', function() {    // 마커에 이벤트를 등록합니다
        infowindow.close();
    });
}
//-----kakaomap end-----//

//---openweather api--//
const weatherDiv = document.querySelector("#weatherDiv");
const weatherIcon = document.querySelector("#weatherIcon");
function getWeather(lat, lon, apiKey){
	const weatherAPIURL='https://api.openweathermap.org/data/2.5/weather';
	const weatherURI = '?lat=' + lat + '&lon=' + lon + '&appid=' + apiKey + '&units=metric';	// units=metric : 섭씨로 설정
	const weatherIconURL = 'https://openweathermap.org/img/wn/';
	const weatherIconSurfix = '@2x.png';
	const celsius = '℃';
	fetch(weatherAPIURL + weatherURI)
	.then(response => response.json())
	.then(data => {
//		console.log(data); 
	    const place = data.name;
	    const temp = data.main.temp.toFixed(1) + celsius; // 온도(소수점 1의 자리)
	    const weathers = data.weather[data.weather.length -1]; // 날씨
	    const sunset = new Date(data.sys.sunset*1000); // 일몰 unix timestamp * millisec
	    const sunrise = new Date(data.sys.sunrise*1000); // 일출 unix timestamp * millisec
	    
	    let dailySunsetDate = (sunset.getMonth()+1) + '월 ' + sunset.getDate() + '일';
	    let dailySunriseDate = (sunrise.getMonth()+1) + '월 ' + sunrise.getDate() + '일';
	    let dailySunsetTime = sunset.getHours() + '시 ' + sunset.getMinutes() + '분';
	    let dailySunriseTime = sunrise.getHours() + '시 ' + sunrise.getMinutes() + '분';
	    
	    weatherIcon.src = weatherIconURL + weathers.icon + weatherIconSurfix;
	    weatherDiv.innerHTML = '<span class="border-tit">산 현재기온</span>&nbsp;&nbsp;&nbsp;' + temp + '<br><span class="border-tit">' + dailySunsetDate + ' 일출</span>&nbsp;&nbsp;&nbsp;' + dailySunriseTime + '<br><span class="border-tit">' + dailySunriseDate + ' 일몰</span>&nbsp;&nbsp;&nbsp;'+ dailySunsetTime;
	});
}
//---openweather api end--//
</script>
</body>
</html>