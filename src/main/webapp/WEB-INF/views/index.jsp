<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛등산</title>
<%@ include file= "/resources/common/header.jsp" %>
<%@ include file= "/resources/common/banner.jsp" %>
</head>
<body>
<section class="page-header1">
	<div class="container">
		<div class="row position-relative">
			<div class="col-8 mx-auto text-center">
				<p class="text-primary text-uppercase fw-bold">Recommended  Mountains of the Week</p>
				<h2 class="mb-4" style="font-family:LeeSeoyun, sans-seri;">금주의 추천 산</h2>
			</div>
		</div>
	</div>
</section>
<section class="section-sm bg-primary-light mt-4">
	<div class="container recommendMountaingab">
		<div id="recommendedMountainDiv" style= "text-align:center; margin:0 auto; width:78%;">
			<div id="mountainInfoDiv" class="row">
				<p>추천 산리스트</p>
			</div>
		</div>
	</div>
</section>
<section class="page-header2">
	<div class="container nearMountainHeader" style="display:none;">
		<div class="row position-relative">
			<div class="col-8 mx-auto text-center">
				<p class="text-primary text-uppercase fw-bold">List of near mountains</p>
				<h2 class="mb-4" style="font-family:LeeSeoyun, sans-seri;">가까운 산(현재위치 기준)</h2>
			</div>
		</div>
	</div>
</section>
<section class="section-sm bg-primary-light mt-4">
	<div class="container nearMountaingab">
		<div id="NearMountainDiv" style= "text-align:center; margin:0 auto; width:78%; display:none;">
			<div id="nearMountainInfoDiv" class="row">
				<p>가까운 산 리스트</p>
			</div>
		</div>
	</div>
</section>
<section class="section testimonials overflow-hidden bg-tertiary">
	<div class="container">
	    <div class="row justify-content-center">
	      <div class="col-lg-6">
	        <div class="section-title text-center">
	          <p class="text-primary text-uppercase fw-bold">Recommended meeting of the week</p>
	          <h2 style="font-family:LeeSeoyun, sans-seri;">
	          	금주의 소소모임&nbsp;
					<svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="currentColor" class="bi bi-stars" viewBox="0 0 16 16">
					  <path d="M7.657 6.247c.11-.33.576-.33.686 0l.645 1.937a2.89 2.89 0 0 0 1.829 1.828l1.936.645c.33.11.33.576 0 .686l-1.937.645a2.89 2.89 0 0 0-1.828 1.829l-.645 1.936a.361.361 0 0 1-.686 0l-.645-1.937a2.89 2.89 0 0 0-1.828-1.828l-1.937-.645a.361.361 0 0 1 0-.686l1.937-.645a2.89 2.89 0 0 0 1.828-1.828l.645-1.937zM3.794 1.148a.217.217 0 0 1 .412 0l.387 1.162c.173.518.579.924 1.097 1.097l1.162.387a.217.217 0 0 1 0 .412l-1.162.387A1.734 1.734 0 0 0 4.593 5.69l-.387 1.162a.217.217 0 0 1-.412 0L3.407 5.69A1.734 1.734 0 0 0 2.31 4.593l-1.162-.387a.217.217 0 0 1 0-.412l1.162-.387A1.734 1.734 0 0 0 3.407 2.31l.387-1.162zM10.863.099a.145.145 0 0 1 .274 0l.258.774c.115.346.386.617.732.732l.774.258a.145.145 0 0 1 0 .274l-.774.258a1.156 1.156 0 0 0-.732.732l-.258.774a.145.145 0 0 1-.274 0l-.258-.774a1.156 1.156 0 0 0-.732-.732L9.1 2.137a.145.145 0 0 1 0-.274l.774-.258c.346-.115.617-.386.732-.732L10.863.1z"/>
					</svg>
	          	</h2>
	        </div>
	      </div>
	    </div>
	    <div class="position-relative">
	    	<div id="recommendedParties" class="recommendedParties row mt-5" style="display:flex; justify-content: center;"></div>
	   	</div>
	</div>
	<div class="has-shapes">
    <svg class="shape shape-left text-light" width="290" height="709" viewBox="0 0 290 709" fill="none"
      xmlns="http://www.w3.org/2000/svg">
      <path
        d="M-119.511 58.4275C-120.188 96.3185 -92.0001 129.539 -59.0325 148.232C-26.0649 166.926 11.7821 174.604 47.8274 186.346C83.8726 198.088 120.364 215.601 141.281 247.209C178.484 303.449 153.165 377.627 149.657 444.969C144.34 546.859 197.336 649.801 283.36 704.673"
        stroke="currentColor" stroke-miterlimit="10" />
      <path
        d="M-141.434 72.0899C-142.111 109.981 -113.923 143.201 -80.9554 161.895C-47.9878 180.588 -10.1407 188.267 25.9045 200.009C61.9497 211.751 98.4408 229.263 119.358 260.872C156.561 317.111 131.242 391.29 127.734 458.631C122.417 560.522 175.414 663.463 261.437 718.335"
        stroke="currentColor" stroke-miterlimit="10" />
      <path
        d="M-163.379 85.7578C-164.056 123.649 -135.868 156.869 -102.901 175.563C-69.9331 194.256 -32.086 201.934 3.9592 213.677C40.0044 225.419 76.4955 242.931 97.4127 274.54C134.616 330.779 109.296 404.957 105.789 472.299C100.472 574.19 153.468 677.131 239.492 732.003"
        stroke="currentColor" stroke-miterlimit="10" />
      <path
        d="M-185.305 99.4208C-185.982 137.312 -157.794 170.532 -124.826 189.226C-91.8589 207.919 -54.0118 215.597 -17.9666 227.34C18.0787 239.082 54.5697 256.594 75.4869 288.203C112.69 344.442 87.3706 418.62 83.8633 485.962C78.5463 587.852 131.542 690.794 217.566 745.666"
        stroke="currentColor" stroke-miterlimit="10" />
    </svg>
    <svg class="shape shape-right text-light" width="731" height="429" viewBox="0 0 731 429" fill="none"
      xmlns="http://www.w3.org/2000/svg">
      <path
        d="M12.1794 428.14C1.80036 390.275 -5.75764 349.015 8.73984 312.537C27.748 264.745 80.4729 237.968 131.538 231.843C182.604 225.703 234.032 235.841 285.323 239.748C336.615 243.64 391.543 240.276 433.828 210.964C492.452 170.323 511.701 91.1227 564.607 43.2553C608.718 3.35334 675.307 -9.81661 731.29 10.323"
        stroke="currentColor" stroke-miterlimit="10" />
      <path
        d="M51.0253 428.14C41.2045 392.326 34.0538 353.284 47.7668 318.783C65.7491 273.571 115.623 248.242 163.928 242.449C212.248 236.641 260.884 246.235 309.4 249.931C357.916 253.627 409.887 250.429 449.879 222.701C505.35 184.248 523.543 109.331 573.598 64.0588C615.326 26.3141 678.324 13.8532 731.275 32.9066"
        stroke="currentColor" stroke-miterlimit="10" />
      <path
        d="M89.8715 428.14C80.6239 394.363 73.8654 357.568 86.8091 325.028C103.766 282.396 150.788 258.515 196.347 253.054C241.906 247.578 287.767 256.629 333.523 260.099C379.278 263.584 428.277 260.567 465.976 234.423C518.279 198.172 535.431 127.525 582.62 84.8317C621.964 49.2292 681.356 37.4924 731.291 55.4596"
        stroke="currentColor" stroke-miterlimit="10" />
      <path
        d="M128.718 428.14C120.029 396.414 113.678 361.838 125.837 331.274C141.768 291.221 185.939 268.788 228.737 263.659C271.536 258.515 314.621 267.008 357.6 270.282C400.58 273.556 446.607 270.719 482.028 246.16C531.163 212.111 547.275 145.733 591.612 105.635C628.572 72.19 684.375 61.1622 731.276 78.0432"
        stroke="currentColor" stroke-miterlimit="10" />
      <path
        d="M167.564 428.14C159.432 398.451 153.504 366.107 164.863 337.519C179.753 300.046 221.088 279.062 261.126 274.265C301.164 269.452 341.473 277.402 381.677 280.465C421.88 283.527 464.95 280.872 498.094 257.896C544.061 226.035 559.146 163.942 600.617 126.423C635.194 95.1355 687.406 84.8167 731.276 100.612"
        stroke="currentColor" stroke-miterlimit="10" />
    </svg>
  </div>
</section>
<%@ include file= "/resources/common/footer.jsp" %>
<script>
	
window.addEventListener('load', async function(){
	await getRecommendedMountainList();
	await getRecommendedPartyList();
 	await loadCoords();
});

async function getNearMountainList(){
	const loadedCoords = localStorage.getItem(COORDS); // localStorage에서 위치정보 가져옴
	  if (!loadedCoords){
		  document.querySelector(".nearMountainHeader").style.display = 'none';
		  document.querySelector("#NearMountainDiv").style.display = 'none';
		  return;
	  } else {
		  document.querySelector(".nearMountainHeader").style.display = 'block';
		  document.querySelector("#NearMountainDiv").style.display = 'block';
	  }

	const parseCoords = JSON.parse(loadedCoords); // json형식으로 저장되어있어 파싱해야함
	const position = {
		lat : parseCoords.latitude,
		lot : parseCoords.longitude
	}
	const response = await fetch('/mountain/near',{
		method : 'POST',
		headers : {
			'Content-Type' : 'application/json'			
		},
		body : JSON.stringify(position)
	});
	const nearMountainList = await response.json();
	
	if(nearMountainList!==null){
		let html = '';
		for(let i=0;i<3;i++){ // 3개만
			const nearMountain = nearMountainList[i];
			html += '<div class="col-xl-4 mb-5 difference-of-us-item" style="display:flex; flex-direction: column; cursor:pointer;" onclick="location.href=\'/views/mountain/view?miNum=' + nearMountain.miNum + '\'">';
			html += '<div style="position: relative; width:100%; height:200px; overflow:hidden; max-width: 422px; margin: 0 auto;">'
			 	 + '<img class="mountainImgDivWrap" style="width:100%; height:200px; object-fit:fill"' + 'src="' + nearMountain.mntnattchimageseq + '"' + 'onerror="this.src=\'/resources/images/mountain/mountain-no-img.png\'">'
				 + '</div>'
			html += '<div style="padding-top:10px;">' + '<h5 align="center">' + nearMountain.mntnm + '<br>(약  ' +  nearMountain.dist.toFixed(0) + 'km 거리)' + '</h5>' + '</div>';
			html += '</div>';			
		}
		document.querySelector('#nearMountainInfoDiv').innerHTML = html;
	}
}

function getRecommendedMountainList(){ //산 정보
	const mountainURI = '/mountain/recommended';

	fetch(mountainURI,{
		method:'GET',
		headers : {
			'Content-Type' : 'application/json'
		}			
	})
	.then(async function(res){
		if(res.ok){
			return res.json();
		}else{
			const err = await res.text();
			throw new Error(err);
		}
	})
	.then(function(mountainList){
		if(mountainList!==null){
			let html= '';
			for(const mountainInfo of mountainList){
				html += '<div class="col-xl-4 mb-5 difference-of-us-item" style="display:flex; flex-direction: column; cursor:pointer;" onclick="location.href=\'/views/mountain/view?miNum=' + mountainInfo.miNum + '\'">';
				html += '<div style="position: relative; width:100%; height:200px; overflow:hidden; max-width: 422px; margin: 0 auto;">'
				 	 + '<img class="mountainImgDivWrap" style="width:100%; height:200px; object-fit:fill"' + 'src="' + mountainInfo.mntnattchimageseq + '"' + 'onerror="this.src=\'/resources/images/mountain/mountain-no-img.png\'">'
					 + '</div>'
				html += '<div style="padding-top:10px;">' + '<h5 align="center">' + mountainInfo.mntnm + '</h5>' + '</div>';
				html += '</div>';
				//등산 아이콘 제작자 : Freepik
			}
			document.querySelector('#mountainInfoDiv').innerHTML = html;
		}
	});
}
	
function getRecommendedPartyList() {
	fetch('/party-infos/recommended')
	.then(response => response.json()) 
	.then(list => {
		let html = '';
		for(partyInfo of list) {
			html += '<div class="col-xxl-4 mb-4" style="border-radius:15px; text-align-last:center; font-family: LeeSeoyun, sans-seri"'; 
			html += 'onclick="location.href=\'/views/party/view?piNum=' + partyInfo.piNum + '\'">';
			html += '<div class="bg-white difference-of-us-item" style="width:84%; margin:0 auto; border-top-right-radius: 68px; border-top-left-radius: 68px; border:1px solid #c8ccc9">';
			html += '<br><div class="border-box-tit mb-4" style="background: #a9ffca;">'+partyInfo.mntnm + '</div>';
			html += '<img class="partyIcon_main" style="width:99px; height:96px"; display:block; margin:auto;" src="/resources/images/party/' + partyInfo.piIcon + '.png"><br>';
			html += '<br><div class="index-body-font"><span style="font-size:1.45rem; color:#000">'+partyInfo.piName + '</span><br>';
			html += '날짜 : ' + partyInfo.piExpdat + '<br>';
			html += '시간 : ' + partyInfo.piMeetingTime + '<br>';
			html += '부원 : ' + partyInfo.memNum + " / " + partyInfo.piMemberCnt + '<br>';
			html += '❤ ' + partyInfo.likeNum + '<br></div></div>';
			html += '</div>';
		}
		document.querySelector('#recommendedParties').innerHTML = html;
	})
}
	
const weatherDiv = document.querySelector("#weatherDiv");
const weatherIcon = document.querySelector("#weatherIcon");
const COORDS = 'coords';

async function loadCoords() {
  const loadedCoords = localStorage.getItem(COORDS); // localStorage에서 위치정보 가져옴
  if (loadedCoords === null) { // 위치 정보가 없으면
  	askForCoords(); // 위치 정보 요청 함수
  } else {
	  const parseCoords = await JSON.parse(loadedCoords); // json형식을 객체 타입으로 바꿔서 저장
	  const weatherInfo = await getWeather(parseCoords.latitude, parseCoords.longitude); 
	  await renderingLocalWeather(weatherInfo); // 날씨 요청 함수
	  await getNearMountainList();
	  return;
  }
}

function askForCoords() { // 사용자 위치 요청 (요청 수락, 요청 거절)
	navigator.geolocation.getCurrentPosition(handleGeoSucces, handleGeoError);
}

async function handleGeoSucces(position) { // 요청 수락
	const latitude = position.coords.latitude; 
	const longitude = position.coords.longitude;
	const coordsObj = {
		latitude,
	    longitude,
	};
	await saveCoords(coordsObj); // localStorage에 저장하는 함수
	await renderingLocalWeather(await getWeather(latitude, longitude));
	await getNearMountainList();
}

async function saveCoords(coordsObj) { // localStorage에 저장
	await localStorage.setItem(COORDS, JSON.stringify(coordsObj));
}
 
function handleGeoError() { // 요청 거절
	console.log('위치 정보 요청 거절');
}

async function getWeather(lat, lon){
	const weatherURI = '?lat=' + lat + '&lon=' + lon + '&appid=${openWeatherMapAPI}&units=metric';	// units=metric : 섭씨로 설정
	const celsius = '℃';
	const response = await fetch('https://api.openweathermap.org/data/2.5/weather' + weatherURI);
	const weatherInfo = await response.json();
	
	const weatherParam = {
		place : weatherInfo.name,
		temp : weatherInfo.main.temp.toFixed(1) + celsius,
		weathers : weatherInfo.weather[weatherInfo.weather.length -1]
	}
	return weatherParam;
}

async function renderingLocalWeather(weatherParam){
	document.querySelector('.weatherdText h4').innerText = '나의 지역 날씨';
	weatherIcon.src = 'https://openweathermap.org/img/wn/' + weatherParam.weathers.icon + '@2x.png';
	weatherDiv.innerHTML = weatherParam.place + '&nbsp&nbsp&nbsp&nbsp' + weatherParam.temp;	
}

async function renderingMountainWeather(mountainParam, weatherParam){
	document.querySelector('.weatherdText h4').innerText = mountainParam.mntnm + '의 날씨';
	weatherIcon.src = 'https://openweathermap.org/img/wn/' + weatherParam.weathers.icon + '@2x.png';
	weatherDiv.innerHTML = weatherParam.place + '&nbsp&nbsp&nbsp&nbsp' + weatherParam.temp;	
}

async function displaySearchDiv() {
	document.getElementById('searchMountain').style.display = '';
	await searchMountain();
}

function closeSearchDiv() {
	document.getElementById('searchText').value = '';
	document.getElementById('searchResult').innerHTML = '';
	document.getElementById('searchMountain').style.display = 'none';
}

function checkReg(obj) {
	const regExp = /[a-z0-9]|[\[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
	if (regExp.test(obj.value)) {
		obj.value = obj.value.replace(regExp, '');
	}
	searchMountain();
}

async function searchMountain() {
	const mountainResponse = await fetch('/mountain/search?searchText=' + document.getElementById('searchText').value);
	if (!mountainResponse.ok) {
		const errorResult = await mountainResponse.json();
		alert(errorResult.message);
		location.href = '/views/user/login';
		return;
	}
	const mountainList = await mountainResponse.json();
	let html = '';
	for (mountainInfo of mountainList) {
		html += '<p style="cursor:pointer;" onclick="selectMountain(\'' + mountainInfo.mntnm + '\')"><b>' + mountainInfo.mntnm + '</b> ' + mountainInfo.areanm + '</p>';
	}
	document.getElementById('searchResult').innerHTML = html;
}
async function selectMountain(mntnm) {
	document.getElementById('mntnm').value = mntnm;
	await closeSearchDiv();
	const mountainParam = await getMountainInfo(mntnm);
	const weatherParam = await getWeather(mountainParam.lat, mountainParam.lot);
	await renderingMountainWeather(mountainParam, weatherParam);
}

async function getMountainInfo(mntnm){
	const mountainURL = '/mountain' + '?mntnm=' + mntnm;
	const response = await fetch(mountainURL);
	const mountainInfo = await response.json();
	const lat = mountainInfo[0].lat;
	const lot = mountainInfo[0].lot;
	const mountainParam = {
		mntnm : mntnm,
		lat : lat,
		lot : lot
	}
	return mountainParam;
}

</script>
</body>
</html>