<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛등산 : 소소모임</title>
<%@ include file= "/resources/common/header.jsp" %>
<link href="/resources/css/style2.css" rel="stylesheet" type="text/css">
<link href="/resources/css/style.css" rel="stylesheet" type="text/css">
<meta name=”viewport” content=”width=device-width, initial-scale=1”>
</head>
<body>
	<div class="col-8 mx-auto text-center mt-5">
		<div class="section-title">
			<p class="text-primary text-uppercase fw-bold">SOSOMOIM</p>
			<h2 class="mb-3 text-capitalize" onclick="location.href='/views/party/main'"style="cursor: pointer">소소모임</h2>
		</div>
	</div>
<section>
	<div class="container mb-3">
		<div class="col-8 mx-auto text-center">
			<hr><h4 style="font-family: 'LeeSeoyun', sans-serif; font-size:1.61rem;">★&nbsp;&nbsp;금주의 소소모임&nbsp;&nbsp;★</h4><hr>
		</div>
		<div id="recommendedParty" class="row cur-po" style="max-width: 1182px; justify-content:center; margin: 0 auto; font-family: 'LeeSeoyun', sans-serif"></div>
	</div>
</section>
<div class="container">
	<div class="mt-3">
		<div class="input-group shadow-none bg-white search">
			<select id="searchType" class="searchBoxOption" style="border-color: lightgrey; width: 100px; text-align: center;">
				<option value="MNTNM">산 이름</option>
				<option value="PI_NAME">모임 이름</option>
				<option value="PI_EXPDAT">모임 날짜</option>
			</select> 
			<input type="text" id="searchText" class="form-control shadow-none bg-white" style="width: 245px;" placeholder="검색어를 입력하세요.."
			value="" onkeypress="renderingParties()">
		<div class="searchBtn" style="width: 77px;">
			<button class="btn btn-primary w-100 " onclick="renderingParties()" style="padding: 14px; margin-inline:8px;">검색</button>
		</div>
	</div>
	<div class="mb-2" style="margin-top:3px;">
		<select id="sortType" class="searchBoxOption" style="border-color: lightgrey; width: 100px; text-align: center;"onchange="renderingParties()">
			<option value="LIKE_NUM">좋아요</option>
			<option value="PI_CREDAT">등록일</option>
			<option value="PI_EXPDAT">마감일</option>
		</select>
		<select id="sortOrder" class="searchBoxOption" style="border-color: lightgrey; width: 100px; text-align: center;" onchange="renderingParties()">
			<option value="DESC">내림차순</option>
			<option value="ASC">오름차순</option>
		</select>
		<input type="checkbox" onclick="changeCompleteStatus(this)">완료된 모임 포함
		</div>	
	</div>
</div>	

<section>
	<div class="row cur-po mb-3" id="partyList" style="max-width: 1182px; margin: 0 auto;">
		<div class="makeParty"></div>
	</div>
	<div class="paging-div justify-content-center" style=" display:flex; padding-bottom: 10px; align-items:center;"> 
		<ul class="paginationParty" id="paginationParty"></ul>
	</div>
</section>
<%@ include file= "/resources/common/footer.jsp" %>
<script>
window.addEventListener('load', async function(){
	await renderingParties();
	await getRecommendedPartyList();
});

let includeCompletedParty = false;
let partyFlag = true;

async function changeCompleteStatus(obj) {
	includeCompletedParty = obj.checked;
	await renderingParties();
}

async function getPartyList(partyPageNum) {
	if(partyPageNum === undefined){
		partyPageNum = 1;
	}
	
	let parameter = "?searchType=" + document.querySelector('#searchType').value
				  + "&searchText=" + document.querySelector('#searchText').value
				  + "&sortType=" + document.querySelector('#sortType').value
				  + "&sortOrder=" + document.querySelector('#sortOrder').value
				  + "&includeComplete=" + includeCompletedParty + "&pageNo=" + partyPageNum;
	
	const response = await fetch('/party-infos' + parameter);
	const partyList = await response.json();
	partyFlag = false;
//	console.log(partyList);
	return partyList;
}


async function renderingParties(partyPageNum){
	const partyList = await getPartyList(partyPageNum);
	if(partyList!==null){
		let html = '';
		$("#paginationParty").twbsPagination("destroy");
		$('#paginationParty').twbsPagination({
	  		  totalPages: (partyList.pages<=0)?1:[[partyList.pages]], // 전체 페이지
		 	  startPage: (partyList.prePage<=0)?1:parseInt([[partyList.prePage+1]]), // 시작(현재) 페이지
		 	  initiateStartPageClick: false,
			  prev: "‹", // Previous Button Label
			  next: "›", // Next Button Label
			  first: '«', // First Button Label
			  last: '»', // Last Button Label
			  onPageClick: function (event, page) { // Page Click event
			       console.info("current page : " + page);
			    }
			}).on('page', function (event, page) {
				if(!partyFlag){
					renderingParties(page);
				}
				partyFlag = true;
		});
		
		html += '<div class="col-lg-4" style="margin:13px 1px 13px 2px;"><div class="card difference-of-us-item"><div class="card-header" style="text-align:center; padding-top:91px; border-top-left-radius: 20px; border-top-right-radius: 20px;"><img class="card-img-top" style="width:86px; margin:0 auto;"onclick="location.href=\'/views/party/create\'" src="/resources/images/banner/plus2.png"><br><b class="mt-3"></b></div><div class="card-body" style="padding-bottom:127px; text-align:center;">소모임 만들기</div></div></div>';
		for(let i=0;i<partyList.list.length;i++) {
			if (partyList.list[i].piComplete === 1) {
				html += '<div class="col-lg-4 recommendedParty" style="background-color:lightgrey;"';
			} else {
				html += '<div class="col-lg-4 recommendedParty" style="margin:13px 1px 13px 2px;"'; 
			}
		  
			html += 'onclick="location.href=\'/views/party/view?piNum=' + partyList.list[i].piNum + '\'"><div class="card difference-of-us-item">';
			html += '<div class="p-3 card-header" style="text-align:center; over-flow:hidden; height:158px; border-top-left-radius: 20px; border-top-right-radius: 20px;"><div class="border-box-tit mb-4" style="font-size:1.22rem;font-family: LeeSeoyun, sans-serif">' +partyList.list[i].mntnm +'</div>';
			html += '<img class="partyIcon_main mb-4" style="margin-top: -2%; width:70px; height:68px" src="/resources/images/party/' + partyList.list[i].piIcon + '.png">';
			
			html += '</div><div class="card-body party-list-f" style="background: #d9eee1;">';
			html += '<div style="text-align:center;"><b class="mt-3">' + partyList.list[i].piName + '</b></div></div>';
			html += '<div style="list-style-type: none;">'
			html += '<div class="p-3 party-list-f"><li class="list-group-item">날짜 :&nbsp;&nbsp;&nbsp;&nbsp;' + partyList.list[i].piExpdat + '</li>';
			html += '<li class="list-group-item">시간 :&nbsp;&nbsp;&nbsp;&nbsp;' + partyList.list[i].piMeetingTime + '</li>';
			html += '<li class="list-group-item">부원 :&nbsp;&nbsp;&nbsp;&nbsp;' + partyList.list[i].memNum + " / " + partyList.list[i].piMemberCnt + '</li>';
			html += '<li class="list-group-item">좋아요 :&nbsp;&nbsp;' + partyList.list[i].likeNum + '</li>';
			html += '</div></div></div></div>';
		}
		document.querySelector('#partyList').innerHTML = html;
	}
}

async function getRecommendedPartyList() {
	const response = await fetch('/party-infos/recommended');
	const partyInfoList = await response.json();
	
	if(partyInfoList!==null){
		let html = '';
		for(partyInfo of partyInfoList) {
			if (partyInfo.piComplete === 1) {
				html += '<div class="col-xl-4 p-4" style="background-color:lightgrey;" ';
			} else {
				html += '<div class="col-xl-4 p-4"'; 
			}
			html += 'onclick="location.href=\'/views/party/view?piNum=' + partyInfo.piNum + '\'">';
			html += '<div class="recommendedParty difference-of-us-item" >';
			html += '<div class="border-box-tit mb-4">' + partyInfo.mntnm + '</div>';
			html += '<img class="partyIcon_main mt-2 mb-4" style="margin-top: -2%; width:80px; height:75px" src="/resources/images/party/' + partyInfo.piIcon + '.png">';
			html += '<b class="border-sm-tit mt-3" style="font-size:1.4rem; color:#323d34;">' + partyInfo.piName + '</b>';
			html += '<div class="row mt-2" style="justify-content:center; padding-inline: 15px; color:#2f2f2f;"><div class="w-66"><b>[날짜]</b> ' + partyInfo.piExpdat + '<br>';
			html += '<b>[시간]</b> ' + partyInfo.piMeetingTime + '<br>';
			html += '<b>[부원]</b> ' + partyInfo.memNum + " / " + partyInfo.piMemberCnt + '<br>';
			html += '<img src="/resources/images/banner/like2.png" style="width:25px; height:25px;"> ' + partyInfo.likeNum + '</div>';
			html += '</div></div></div></div></div>';
		}
		document.querySelector('#recommendedParty').innerHTML = html;
	}
}
</script>
</body>
</html>