<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/resources/common/header.jsp"%>
<link href="/resources/css/style1.css" rel="stylesheet" type="text/css">
<link href="/resources/css/style.css" rel="stylesheet" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</head>
<body>

<h3 data-bs-toggle="modal" data-bs-target="#exampleModal" style="cursor:pointer">
  챌린지 정보
<h3>

<!-- Challenge Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">챌린지 정보</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       <table class="table" style="text-align:center">
		<tr>
			<th>도전 목표</th>
			<th>생성일</th>
		</tr>
		<tbody id="tBody"></tbody>
	</table>
	<br>
	<textarea class="form-control" id="ucChallenge" style="resize: none"></textarea>
	<br>
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">돌아가기</button>
        <button type="button" class="btn btn-primary"  onclick="updateUserChallenge()">수정</button>
        <button type="button" class="btn btn-primary" onclick="deleteUserChallenge()">도전성공</button>
      </div>
    </div>
  </div>
</div>

	<script>
		function getChallenge() {

			fetch('/challenge/${param.ucNum}')
			.then(function(res) {
				return res.json();
				console.log(res);
			}).then(function(data) {
				let html = '';
				html += '<tr>';
				html += '<td>' + data.ucChallenge + '</td>';
				html += '<td >' + data.ucCredat + '</td>';
				html += '</tr>';

				document.querySelector('#tBody').innerHTML = html;
			})

		}

		window.onload = function() {
			getChallenge()
		}

		/*챌린지 리스트 수정 함수 */

		function updateUserChallenge() {

			const param = {
				ucChallenge : document.querySelector('#ucChallenge').value
			}

			console.log(param);
			fetch('/challenge/Update/${param.ucNum}', {
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
		function deleteUserChallenge() {
			fetch('/challenge/Clear/${param.ucNum}', {
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
	</script>

</body>
</html>