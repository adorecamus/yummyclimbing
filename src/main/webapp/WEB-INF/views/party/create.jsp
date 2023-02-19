<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소소모임 만들기</title>
<%@ include file="/resources/common/header.jsp"%>
<body>
<section class="homepage_tab position-relative" style="margin: 0 auto;">
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-lg-8 mt-5 mb-3">
				<div class="text-center">
					<p class="text-primary text-uppercase fw-bold ">Create a meeting</p>
					<h2>소소모임 정보</h2>
				</div>
			</div>
			<div class="col-lg-10">
				<div class="rounded shadow bg-white p-5 tab-content mb-3"
					id="pills-tabContent">
					<div class="tab-pane fade show active"
						id="pills-how-much-can-i-recive" role="tabpanel"
						aria-labelledby="pills-how-much-can-i-recive-tab">
						<div class="content-block" style="width: 87%; margin: 0 auto">
							<div class="row mb-2 pb-2">
								<label for="piName" class="col-sm-3 col-form-label">모임 이름</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="piName">
								</div>
							</div>

							<div class="row mb-2 pb-2">
								<label for="mntnm" class="col-sm-3 col-form-label">산 이름</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="mntnm" onclick="displaySearchDiv()"
										value="${param.mntnm}" readonly>
								</div>
								<!-- <button onclick="displaySearchDiv()" class="btn btn-primary" style= "width: 8.3%; min-width: 72px";>검색</button> -->
							</div>
							<div id="searchMountain" style="display: none; padding: 10px 10px 10px 10px;">
								<div style="border: 1px solid; margin: auto; margin-bottom: 3%; padding: 20px 20px 20px 20px;
								 width: 83%; min-width: 328px; height: 260px; overflow-x: hidden;">
								<div class="input-group mb-3">
									<input type="text" id="searchText" onkeyup="checkReg(this)"
										placeholder="산 또는 지역으로 검색" class="form-control">
									<button onclick="closeSearchDiv()" style="float: right;" class="btn btn-primary">닫기</button>
									<div id="searchResult" style="margin-top: 3%"></div>
								</div>
								</div>
							</div>

							<div class="row mb-2 pb-2">
								<label for="piExpdat" class="col-sm-3 col-form-label">모임 날짜</label>
								<div class="col-sm-8">
									<input type="date" class="form-control" id="piExpdat">
								</div>
							</div>

							<div class="row mb-2 pb-2">
								<label for="piMeetingTime" class="col-sm-3 col-form-label">모임 시간</label>
								<div class="col-sm-8">
									<input type="time" class="form-control" step="900"
										id="piMeetingTime">
								</div>
							</div>

							<div class="row mb-2 pb-2">
								<label for="piMemberCnt" class="col-sm-3 col-form-label">정원</label>
								<div class="col-sm-8">
									<input type="number" class="form-control" max=50 min=2
										id="piMemberCnt">
								</div>
							</div>

							<div class="mb-3">
								<textarea class="form-control" id="piProfile" placeholder="모임 설명" rows="4"></textarea>
							</div>
							<button onclick="location.href='/views/party/main'" class="btn btn-secondary" >소모임 메인</button>
							<button onclick="createParty()" class="btn btn-primary" style="float: right;">만들기</button>
						</div>
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
			      	<svg class="shape shape-right text-light" width="474" height="511" viewBox="0 0 474 511" fill="none"
			        xmlns="http://www.w3.org/2000/svg">
				        <path
				          d="M601.776 325.899C579.043 348.894 552.727 371.275 520.74 375.956C478.826 382.079 438.015 355.5 412.619 321.6C387.211 287.707 373.264 246.852 354.93 208.66C336.584 170.473 311.566 132.682 273.247 114.593C220.12 89.5159 155.704 108.4 99.7772 90.3769C53.1531 75.3464 16.3392 33.2759 7.65012 -14.947"
				          stroke="currentColor" stroke-miterlimit="10" />
				        <path
				          d="M585.78 298.192C564.28 319.945 539.378 341.122 509.124 345.548C469.472 351.341 430.868 326.199 406.845 294.131C382.805 262.059 369.62 223.419 352.278 187.293C334.936 151.168 311.254 115.417 275.009 98.311C224.74 74.582 163.815 92.4554 110.913 75.3971C66.8087 61.1784 31.979 21.3767 23.7639 -24.2362"
				          stroke="currentColor" stroke-miterlimit="10" />
				        <path
				          d="M569.783 270.486C549.5 290.99 526.04 310.962 497.501 315.13C460.111 320.592 423.715 296.887 401.059 266.641C378.392 236.402 365.963 199.965 349.596 165.901C333.24 131.832 310.911 98.1265 276.74 82.0034C229.347 59.6271 171.895 76.4848 122.013 60.4086C80.419 47.0077 47.5905 9.47947 39.8431 -33.5342"
				          stroke="currentColor" stroke-miterlimit="10" />
				        <path
				          d="M553.787 242.779C534.737 262.041 512.691 280.809 485.884 284.722C450.757 289.853 416.568 267.586 395.286 239.173C373.993 210.766 362.308 176.538 346.945 144.535C331.581 112.533 310.605 80.8723 278.502 65.7217C233.984 44.6979 180.006 60.54 133.149 45.4289C94.0746 32.8398 63.2303 -2.41965 55.9568 -42.8233"
				          stroke="currentColor" stroke-miterlimit="10" />
				        <path
				          d="M537.791 215.073C519.964 233.098 499.336 250.645 474.269 254.315C441.41 259.126 409.422 238.286 389.513 211.704C369.594 185.13 358.665 153.106 344.294 123.17C329.923 93.2337 310.293 63.6078 280.258 49.4296C238.605 29.7646 188.105 44.5741 144.268 30.4451C107.714 18.6677 78.8538 -14.3229 72.0543 -52.1165"
				          stroke="currentColor" stroke-miterlimit="10" />
			      	</svg>
			    </div>
			</div>
		</div>
	</div>
</section>
<%@ include file= "/resources/common/footer.jsp" %>
<script>
const today = new Date();
const dateString = today.getFullYear() + '-' + Number(today.getMonth()+1) + '-' + today.getDate();
document.getElementById('piExpdat').min = dateString;

function displaySearchDiv() {
	document.getElementById('searchMountain').style.display = '';
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

function checkReg(obj) {
	const regExp = /[a-z0-9]|[\[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
	if (regExp.test(obj.value)) {
		obj.value = obj.value.replace(regExp, '');
	}
	searchMountain();
}

function selectMountain(mntnm) {
	document.getElementById('mntnm').value = mntnm;
	closeSearchDiv();
}

function closeSearchDiv() {
	document.getElementById('searchText').value = '';
	document.getElementById('searchResult').innerHTML = '';
	document.getElementById('searchMountain').style.display = 'none';
}

async function createParty() {
	let partyInfoParameter = {
			piName : document.getElementById('piName').value.trim(),
			mntnm : document.getElementById('mntnm').value.trim(),
			piExpdat : document.getElementById('piExpdat').value,
			piMeetingTime : document.getElementById('piMeetingTime').value,
			piMemberCnt : document.getElementById('piMemberCnt').value,
			piProfile : document.getElementById('piProfile').value.trim()
	};
	if (checkInput(partyInfoParameter) === false) {
		return;
	}
	
	const createResponse = await fetch('/party-info', {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json'
		},
		body: JSON.stringify(partyInfoParameter)
	});
	if (!createResponse.ok) {
		const errorResult = await createResponse.json();
		alert(errorResult.message);
		location.href = '/views/user/login';
		return;
	}
	const piNum = await createResponse.json();
	if (piNum !== 0) {
		alert('소소모임이 등록되었습니다.');
		location.href = '/views/party/view?piNum=' + piNum;
	}
}

function checkInput(partyInfo) {
	for (const key of Object.keys(partyInfo)) {
		const value = partyInfo[key];
		if (value === null || value === '') {
			alertAndFocus('빈칸을 채워주세요.', key);
			return false;
		}
		if (key === 'piExpdat' && new Date(value) < new Date(dateString)) {
			alertAndFocus('오늘 이전 날짜를 모임날짜로 설정할 수 없습니다.', key);
			return false;
		}
		if (key === 'piMemberCnt' && (value < 2 || value > 50)) {
			alertAndFocus('정원은 2명 이상 50명 이하여야 합니다.', key);
			return false;
		}
		
	}
	return true;
}

function alertAndFocus(msg, id) {
	alert(msg);
	document.getElementById(id).focus();
}
</script>
</body>
</html>