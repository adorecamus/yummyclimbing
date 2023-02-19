<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소소모임 방장 관리 페이지</title>
<%@ include file="/resources/common/header.jsp"%>
</head>
<body>
<section class="homepage_tab position-relative" style="margin:0 auto;">
  <div class="section container mt-5">
    <div class="row justify-content-center">
      <div class="col-lg-8">
        <div class="text-center">
          <p class="text-primary text-uppercase fw-bold ">Difference Of Us</p>
          <h2>소소모임 정보</h2>
        </div>
      </div>
      <div class="col-lg-10">
        <ul class="payment_info_tab nav nav-pills justify-content-center mb-4" id="pills-tab" role="tablist">
          <li class="nav-item m-2" role="presentation"> <a
              class="nav-link btn btn-outline-primary effect-none text-dark " id="pills-how-do-i-repay-tab"
              data-bs-toggle="pill" href="#pills-how-do-i-repay" role="tab" aria-controls="pills-how-do-i-repay"
              aria-selected="true" onclick="deleteParty()">소소모임 삭제</a>
          </li>          
          <li class="nav-item m-2" role="presentation"> 
          <a class="nav-link btn btn-outline-primary effect-none text-dark active" id="pills-how-much-can-i-recive-tab"
              data-bs-toggle="pill" href="#pills-how-much-can-i-recive" role="tab"
              aria-controls="pills-how-much-can-i-recive" aria-selected="true" onclick="updateParty()">수정 완료</a>
          </li>
        </ul>
        <div class="rounded shadow bg-white p-5 tab-content mb-3" id="pills-tabContent">
          <div class="tab-pane fade show active" id="pills-how-much-can-i-recive" role="tabpanel"
            aria-labelledby="pills-how-much-can-i-recive-tab">
              <div class="content-block" style="max-width:77%; margin:0 auto">
				<div id="partyInfoDiv">
					<div class="form-group mb-2 pb-2">
						<input type="text" id="mntnm" class="form-control" readonly>
					</div>
					<div class="form-group mb-2 pb-2">
						<input type="text" id="piName" placeholder="모임 이름" class="form-control ">
					</div>
					<div class="form-group mb-2 pb-2 " style="display:flex;">
						<input type="date" id="piExpdat" placeholder="모임 날짜" class="form-control w-50">
						<input type="time" id="piMeetingTime" step="900" placeholder="모임 시간" class="form-control w-50">
					</div>
					<div class="form-group mb-2 pb-2">
						<input type="number" id="piMemberCnt" max=50 min=2 placeholder="정원" class="form-control">
					</div>
					<textarea id="piProfile" placeholder="모임 설명" class="form-control"></textarea>
	            	<p>&#9888; 삭제 후에는 복구할 수 없습니다.</p>
	            	</div>
	            </div>
            </div>
        </div>
        <div id="membersDiv">
			<div class="row col-8 mx-auto text-center mt-10">
				<h2 class="text-center">부원 관리</h2>
			</div>
			<div class="row">
				<div class="row  col-4" style="margin:0 auto; text-align:center;">
			  		<a class="col-6" style="min-width:135px;" onclick="getMemberInfos()">부원 목록</a>
			  		<a class="col-6" style="min-width:135px;" onclick="getBlockedMembers()">차단 목록</a>
				</div>				
			</div>
			<hr>
			<div id="memberInfosDiv" style="text-align:center; width: 80%; margin-left: 10%;">
				<table class="table table-borderless">
					<tbody id="memberTbody">
					</tbody>
				</table>
				<br>
				<div style="min-width:220px;">
					<button onclick="changeMemberStatus()" class="btn btn-primary">탈퇴</button>
					<button onclick="changeMemberStatus('block')" class="btn btn-secondary">차단</button>
				</div>
				<br>
				<p>&#9888; 차단한 회원은 재가입할 수 없습니다.</p>
			</div>
			<div id="blockedMembersDiv" style="display:none; text-align:center;width: 60%; margin-left: 20%;">
				<table class="table table-borderless">
					<tbody id="blockedMemberTbody">
					</tbody>
				</table>
				<br>
				<button onclick="changeMemberStatus('unblock')" class="btn btn-primary">차단 해제</button>
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
window.addEventListener('load', async function() {
	await getPartyInfos();
	await getMemberInfos();
});

const today = new Date();
const dateString = today.getFullYear() + '-' + Number(today.getMonth()+1) + '-' + today.getDate();
document.getElementById('piExpdat').min = dateString;

const party = {};

async function getPartyInfos(){
	const partyInfoResponse = await fetch('/party-info/${param.piNum}');
	if (!partyInfoResponse.ok) {
		const errorResult = await partyInfoResponse.json();
		alert(errorResult.message);
		return;
	}
	const partyInfo = await partyInfoResponse.json();
	for (const key of Object.keys(partyInfo)) {
		if (document.getElementById(key)) {
			document.getElementById(key).value = partyInfo[key];
		}
	}
	party.memNum = partyInfo.memNum;
}

async function updateParty() {
	let partyInfoParameter = {
			piName : document.getElementById('piName').value.trim(),
			piExpdat : document.getElementById('piExpdat').value,
			piMeetingTime : document.getElementById('piMeetingTime').value,
			piMemberCnt : document.getElementById('piMemberCnt').value,
			piProfile : document.getElementById('piProfile').value.trim()
	};
	console.log(partyInfoParameter);
	if (checkInput(partyInfoParameter) === false) {
		return;
	}
	
	const updateResponse = await fetch('/captain/party-info?piNum=${param.piNum}', {
		method: 'PATCH',
		headers: {
			'Content-Type': 'application/json'
		},
		body: JSON.stringify(partyInfoParameter)
	});
	if (!updateResponse.ok) {
		const errorResult = await updateResponse.json();
		alert(errorResult.message);
		return;
	}
	const updateResult = await updateResponse.json();
	if (updateResult === true) {
		alert('수정되었습니다.');
		location.href = '/views/party/view?piNum=${param.piNum}';
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
		if (key === 'piMemberCnt') {
			if (value < 2 || value > 50) {
				alertAndFocus('정원은 2명 이상 50명 이하여야 합니다.', key);
				return false;
			} else if (value < party.memNum) {
				alertAndFocus('모임 정원을 현재 부원 수보다 적게 설정할 수 없습니다.', key);
				return false;
			}
		}
	}
	return true;
}

function alertAndFocus(msg, id) {
	alert(msg);
	document.getElementById(id).focus();
}

async function getMemberInfos() {
	document.getElementById('blockedMembersDiv').style.display = 'none';
	document.getElementById('memberInfosDiv').style.display = '';
	
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
	if (members.length > 1) {
		html += '<tr><td><input type="checkbox" name="allCheck" style="zoom: 1.5;" onclick="toggleCheck(this)"></td></tr>';
	}
	for (const member of members) {
		if (member.pmGrade === 1) {
			continue;
		}
		html += '<tr style="border-bottom: 1px solid lightgray;">';
		html += '<td style="width:5%;padding-top:3%;"><input type="checkbox" name="pmNum" style="zoom: 1.5;" value="' + member.pmNum + '"></td>';
		if (member.uiImgPath) {
			html += '<td style="width:2%;padding:1%;"><img src="/userImg/' + member.uiImgPath + '" class="userImage"></td>';
		} else {
			html += '<td style="width:2%;padding:1%;"><img src="/resources/images/user/user-base-img.png" class="userImage"></td>';
		}		
		html += '<td style="width:8%;padding-top:3%;"> ' + member.uiNickname + ' </td>';
		html += '<td style="width:4%;padding-top:3%;"> ' + member.uiAge + ' </td>';
		html += '<td style="width:4%;padding-top:3%;">' + member.uiGender + '  </td>';
		html += '</tr>';
	}
	document.getElementById('memberTbody').innerHTML = html;
}

async function getBlockedMembers() {
	document.getElementById('memberInfosDiv').style.display = 'none';
	document.getElementById('blockedMembersDiv').style.display = '';
	
	let html = '';
	const blockedMembersResponse = await fetch('/captain/party-info/members/blocked?piNum=${param.piNum}');
	if (!blockedMembersResponse.ok) {
		const errorResult = await blockedMembersResponse.json();
		console.log(errorResult);
		html += '<p>' + errorResult.message + '</p>';
		document.getElementById('blockedMembersDiv').innerHTML = html;
		return;
	}
	const blockedMembers = await blockedMembersResponse.json();
	if (blockedMembers.length !== 0) {
		html += '<tr><td><input type="checkbox" name="allCheck" style="zoom: 1.5;" onclick="toggleCheck(this)"></td></tr>';
	}
	for (const blockedMember of blockedMembers) {
		html += '<tr style="border-bottom: 1px solid lightgray;">';
		html += '<td style="width:5%;padding-top:3%;"><input type="checkbox" style="zoom: 1.5;" name="pmNum" value="' + blockedMember.pmNum + '"></td>';
		if (blockedMember.uiImgPath) {
			html += '<td style="width:2%;padding:1%;"><img src="/userImg/' + blockedMember.uiImgPath + '" class="userImage"></td>';
		} else {
			html += '<td style="width:2%;padding:1%;"><img src="/resources/images/user/user-base-img.png" class="userImage"></td>';
		}
		html += '<td style="width:8%;padding-top:3%;">  ' + blockedMember.uiNickname + '  </td>';
		html += '</tr>';
	}
	document.getElementById('blockedMemberTbody').innerHTML = html;
}

function toggleCheck(obj) {
	const checkObjs = document.querySelectorAll('input[name="pmNum"]');
	for (const checkObj of checkObjs) {
		checkObj.checked = obj.checked;
	}
}

async function changeMemberStatus(type) {
	let msg = '탈퇴';
	if (type === 'block') {
		msg = '차단';
	} else if (type === 'unblock') {
		msg = '차단 해제';
	}
	const pmNumObjs = document.querySelectorAll('input[name="pmNum"]:checked');
	let pmNums = [];
	for (const pmNumObj of pmNumObjs) {
		pmNums.push(pmNumObj.value);
	}
	if(pmNums.length===0) {
		alert('선택된 부원이 없습니다.');
		return;
	}
	console.log(pmNums);
	if(confirm('선택한 부원을 ' + msg + '하시겠습니까?')) {
		let memberParameter = {
				pmNums : pmNums,
				pmActive : 0
		};
		if (type === 'block') {
			memberParameter.pmActive = -1;	
		} else if (type === 'unblock') {
			memberParameter.pmActive = 0;
		}
		console.log(memberParameter);
		
		const changeResponse = await fetch('/captain/party-info/members?piNum=${param.piNum}', {
			method:'PATCH',
			headers: {
				'Content-Type' : 'application/json'
			},
			body: JSON.stringify(memberParameter)
		});
		if (!changeResponse.ok) {
			const errorResult = await changeResponse.json();
			alert(errorResult.message);
			return;
		}
		const changeResult = await changeResponse.json();
		if (changeResult === true) {
			alert('선택한 부원을 ' + msg + '했습니다.');
			location.reload();
			return;
		}
		alert('다시 시도해주세요.');
	}
}

async function deleteParty() {
	if (confirm('삭제된 소모임은 복구할 수 없습니다.\r\n정말 삭제하시겠습니까?')) {
		const deleteResponse = await fetch('/captain/party-info?piNum=${param.piNum}', {
			method: 'DELETE'
		});
		if (!deleteResponse.ok) {
			const errorResult = await deleteResponse.json();
			alert(errorResult.message);
			return;
		}
		const deleteResult = await deleteResponse.json();
		if (deleteResult === true) {
			alert('소소모임이 삭제되었습니다.');
			location.href = '/views/party/main';
		}
	}
}

</script>
</body>
</html>