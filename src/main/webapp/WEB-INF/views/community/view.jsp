<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세화면</title>
<%@ include file= "/resources/common/header.jsp" %>
</head>
<body>
	<div class="row col-8 mx-auto text-center mt-5">
		<p class="text-primary text-uppercase fw-bold">community</p>
		<h2 class="text-capitalize mb-4" onclick="location.href='/views/community/list'" style="cursor: pointer">커뮤니티
		</h2>
	</div>
	<div class="form-group mb-4 pb-2">
		<div class="container board-border">
			<div id="detail" class="mb-4"></div>
			<div class="row">
				<div class="w-50" style="display:none; display: flex; justify-content: flex-start">
					<input type="button" id="likeBtn" value="♡ 좋아요" onclick="updateLike()" class="btn" style="color:#000">
					<div id="likeBox"></div>
				</div>
				<div id="btnDiv" style="display:none;" class="w-50 mb-2">
					<div style="display:flex; justify-content: flex-end">
						<button onclick="location.href='/views/community/update?cbNum=${param.cbNum}'" class="btn btn-light mx-1">수정</button>
						<button onclick="deleteBoard()" class="btn btn-dark	">삭제</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container commentBox">
		<div class="commentCnt">
			<span>댓글</span>
			<span id="commentCnt"></span>
			<hr>
		</div>
		<div class="commentContentBox">
			<div id="comment">
			</div>
			<div class="paging-div justify-content-center" style=" display:flex; padding-bottom: 10px; align-items:center;"> 
				<ul class="paginationComment" id="paginationComment"></ul>
			</div>
			<textarea class=" form-control" id="cbcContent" placeholder="댓글은 최대 150자까지 가능합니다." maxlength="150" style="resize:none;"></textarea>
			<div id="editor" contenteditable="true"></div>
			<div class="insertBtn mt-3 mb-3" >
				<button onclick="insertComment()" class="btn btn-primary float-end">등록</button>
			</div>
		</div>
	</div>
<%@ include file= "/resources/common/footer.jsp" %>
<script>
window.addEventListener('load', async function() {
	await getBoard();
	await getFiles();
	if (uiNum !== '') {
		await getLikeInfo();
	}
	await getlikeCnt();
	await renderingCommentList();
});

const uiNum = '${userInfo.uiNum}';
const likeBtn = document.getElementById('likeBtn');
let commentFlag = true;


// 게시글 보기
async function getBoard() {
	const boardResponse = await fetch('/community-boards/${param.cbNum}');
	if (!boardResponse.ok) {
		const errorResult = await boardResponse.json();
		alert('게시글을 불러올 수 없습니다.');
		location.href = '/views/community/list';
		return;
	}
	const communityBoard = await boardResponse.json();
	let html = '';
	html += '<div>';
	html += '<div class="row card-header">';
	html += '<div class="board-text border-nickname">' + communityBoard.uiNickname + '</div>';
	html += '<div class="board-text">' + communityBoard.cbCredat+ '</div>';
	html += '<div class="board-text">' + communityBoard.cbCretim+ '</div>';
	html += '<div class="board-text">조회&nbsp;&nbsp;' + communityBoard.cbViewCnt + '<br></div></div>';	
	html += '</div>';
	html += '<h4 class="mt-3" style="display:inline-block">' + communityBoard.cbTitle + '</h4>';
	html += '<div style="float:right"> no. ' + communityBoard.cbNum + '</div><hr>';
	html += '<div id="cbContent" class="tc-s">' + communityBoard.cbContent + '</div>';
	if('${userInfo.uiNum}' == communityBoard.uiNum){
		document.getElementById('btnDiv').style.display='';
	};
	document.getElementById('detail').insertAdjacentHTML('afterbegin', html);
	document.getElementById('commentCnt').insertAdjacentHTML('beforeend', '<span>['+communityBoard.commentCnt +']</span>');
}

// 게시글에 등록한 파일 불러오기
async function getFiles() {
	const filesResponse = await fetch('/community-board-file/${param.cbNum}');
	if (!filesResponse.ok) {
	 	alert('등록된 파일을 불러올 수 없습니다.');
	 	return;
	}
	const filesResult = await filesResponse.json();
	if (filesResult.length > 0) {
		let html = '';
		html += '<div class="board-text">첨부 이미지</div>';
		for (const file of filesResult) {
			html += '<img src="/files/' + file.cbfUuid + '" alt="1.jpg">';
		}
		document.getElementById('detail').insertAdjacentHTML('beforeend', html);
	}
}

//좋아요 여부 불러오기
async function getLikeInfo() {
	const likeInfoResponse = await fetch('/board-like/${param.cbNum}');
	if (!likeInfoResponse.ok) {
	 	alert('좋아요 여부를 불러올 수 없습니다.');
	 	return;
	}
	const likeInfoResult = await likeInfoResponse.json();
	if (likeInfoResult === true) {
		likeBtn.value = '♥  좋아요 취소';
	}
}

// 좋아요 수 불러오기
async function getlikeCnt() {
	const likeCntResponse = await fetch('/board-likes/${param.cbNum}');
	if (!likeCntResponse.ok) {
	 	alert('좋아요 수를 불러올 수 없습니다.');
	 	return;
	}
	const likeCntResult = await likeCntResponse.json();
	if (likeCntResult != null) {
		likeBtn.value += '\u00A0\u00A0'+likeCntResult;
	}
}

// 좋아요&좋아요 취소
async function updateLike(){
	if (uiNum === ''){
		alert('로그인이 필요한 서비스입니다.');
		location.href="/views/user/login";
		return;
	}
	const param = {
		cbNum : '${param.cbNum}',
		uiNum : uiNum
	}
	const likeResponse = await fetch('/board-like', {
		method:'POST',
		headers : {
			'Content-Type' : 'application/json'
		},
		body : JSON.stringify(param)
	});
	if (!likeResponse.ok) {
	 	alert('좋아요 여부를 불러올 수 없습니다.');
	 	return;
	}
	const likeResult = await likeResponse.json();
	if(likeResult == 0){
		likeBtn.value = '♥  좋아요 취소';
	} else {
		likeBtn.value = '♡  좋아요';
	}
	await getlikeCnt();
}
		
// 댓글 목록 불러오기
async function getCommentList(pageNo) {
	if(pageNo===undefined){
		pageNo=1;
	}
	const commentsResponse = await fetch('/community-comments/${param.cbNum}/' + pageNo);
	if (!commentsResponse.ok) {
	 	alert('댓글을 불러올 수 없습니다.');
	 	return;
	}
	const commentsResult = await commentsResponse.json();
	commentFlag = true;
	return commentsResult;
}

// 화면 렌더링 + 페이징
async function renderingCommentList(pageNo){
	if(pageNo===undefined){
		pageNo=1;
	}
	const commentsResult = await getCommentList(pageNo);
	console.log(commentsResult);
	
	if(commentsResult !== null){
		$("#paginationComment").twbsPagination("destroy");
		$('#paginationComment').twbsPagination({
	  		  totalPages: (commentsResult.pages<=0)?1:[[commentsResult.pages]], // 전체 페이지
		 	  startPage: (commentsResult.prePage<=0)?1:parseInt([[commentsResult.prePage+1]]), // 시작(현재) 페이지
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
					renderingCommentList(page);
				}
				commentFlag = false;
			});

		let html = '';
		for (let i=0; i<commentsResult.list.length; i++) {
			const comment = commentsResult.list[i];
			html += '<tr>';
	 		html += '<input type="hidden" id="commentUiNum" value='+ comment.uiNum +'>';
			html += '<span class="border-id">' + comment.uiNickname + '</span>';
			html += '<span> &nbsp;' + comment.cbcCredat + '</span>';
			html += '<span> &nbsp;' + comment.cbcCretim + '</span><br>';
			html += '<div id="textcomment'+ comment.cbcNum +'" disabled="" class="mt-3 " style="padding-inline: 30px;">' + comment.cbcContent + '</div>';
			if(uiNum == comment.uiNum){
				html += '<button id="deleteCommentBtn" class="btn btn-primary float-end" onclick="deleteComment('+comment.cbcNum+')">삭제</button><button id="updateCommentBtn1" class="btn btn-primary float-end mx-1" onclick="updateComment('+comment.cbcNum+', this)">수정</button>';
			}
			html += '</tr><br>';
			html += '<hr>';
		}
//		document.getElementById('comment').insertAdjacentHTML('beforeend', html);
		document.getElementById('comment').innerHTML = html;
	}
}

// 댓글 등록 
async function insertComment() {
	if(uiNum === ''){
		alert('로그인이 필요한 서비스입니다.');
		location.href = "/views/user/login";
		return;
	}
	const cbcContent = document.getElementById('cbcContent');
	if (!cbcContent.value) {
		alert('댓글을 입력해주세요.');
		cbcContent.focus();
		return;
	}
	const param = {
		cbNum : '${param.cbNum}',
		uiNum : uiNum,
		uiNickname : '${userInfo.uiNickname}',
		cbcContent : cbcContent.value
	}
	const insertResponse = await fetch('/community-comment/insert', {
		method : 'POST',
		headers : {
			'Content-Type' : 'application/json'
		},
		body : JSON.stringify(param)
	});
	if (!insertResponse.ok) {
	 	alert('댓글을 불러올 수 없습니다.');
	 	return;
	}
	const insertResult = await insertResponse.json();
	if (insertResult == 1) {
		alert('댓글이 등록되었습니다.');
		window.location.reload();
		return;
	}
	alert('다시 시도해주세요.');
}

// 댓글 수정
async function updateComment(cbcNum, obj) {
	const textcomment = document.getElementById('textcomment'+cbcNum);
	textcomment.contentEditable = true;
	textcomment.focus();
	obj.innerText = '확인';
	obj.addEventListener('click', async function(){
		const check = confirm('댓글 수정하시겠습니까?');	
		if (check) {
			const updateResponse = await fetch('/community-comment/update/'+ cbcNum, {
				method: 'PATCH',
				headers: {
					'Content-Type' : 'application/json'
				},
				body: JSON.stringify({
					cbNum : ${param.cbNum},
					cbcContent: textcomment.innerText
				})
			});
			if (!updateResponse.ok) {
			 	alert('댓글 수정에 실패했습니다.');
			 	return;
			}
			const updateResult = await updateResponse.json();
			if (updateResult === 1) {
				alert('댓글 수정이 완료되었습니다.');
				window.location.reload();
				return;
			}
			alert('다시 시도해주세요.');
		}
	});
}

// 댓글 삭제 (오류..)
async function deleteComment(cbcNum) {
	var check = confirm('댓글을 삭제하시겠습니까?');
	if (check) {
		const deleteResponse = await fetch('/community-comment/delete/' + cbcNum, {
			method : 'DELETE'
		});
		if (!deleteResponse.ok) {
		 	alert('댓글 삭제에 실패했습니다.');
		 	return;
		}
		const deleteResult = await deleteResponse.json();
		if (deleteResult === 1) {
			alert('댓글이 삭제되었습니다.');
			window.location.reload();
			return;
		}
		alert('다시 시도해주세요.');
	}
}

// 게시글 삭제
async function deleteBoard() {
	var check = confirm('게시물을 삭제하시겠습니까?');
	if (check) {
		const deleteResponse = await fetch('/community-board/delete/${param.cbNum}', {
			method : 'DELETE'
		});
		if (!deleteResponse.ok) {
		 	alert('게시물 삭제에 실패했습니다.');
		 	return;
		}
		const deleteResult = await deleteResponse.json();
		if (deleteResult === true) {
			alert('게시물이 삭제되었습니다.');
			location.href = '/views/community/list';
			return;
		}
		alert('다시 시도해주세요.');
	}
}
</script>
</body>
</html>