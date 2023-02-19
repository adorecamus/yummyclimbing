<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
<!-- CSS -->
<%@ include file="/resources/common/header.jsp"%>
</head>
<body>
	<div class="row col-8 mx-auto text-center mt-10">
		<p class="text-primary text-uppercase fw-bold">community</p>
		<h2 class="text-capitalize"
			onclick="location.href='/views/community/list'"
			style="cursor: pointer">커뮤니티
		</h2>
	</div>
	<section class="section">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<!-- categories -->
					<div class="widget widget-categories">
						<h5 class="widget-title">
							<span>Category</span>
						</h5>
						<ul class="list-unstyled widget-list">
							<li><a onclick="renderingCategoryBoard('infoboard')">정보게시판
							</a></li>
							<li><a onclick="renderingCategoryBoard('freeboard')">자유게시판</a>
							</li>
							<li><a onclick="renderingCategoryBoard('questionboard')">질문게시판</a>
							</li>
							<li><a onclick="renderingCategoryBoard('reviewboard')">후기게시판</a>
							</li>
							<li>
								<c:if test="${userInfo ne null}">
									<hr style="max-width:163px;">
									<a onclick="location.href='/views/community/insert'">글쓰기 ···</a>
								</c:if>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="tableWrap mb-5">
						<table id="table" class="table table-hover" style="width:100%; text-align:center;">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
							<tbody id="tBody" class="tBodyArea"></tbody>
							<tr>
								<td colspan=5>	
									<div class="paging-div justify-content-center" style=" display:flex; padding-bottom: 10px; align-items:center;"> 
			  							<ul class="paginationBoard" id="paginationBoard"></ul>
									</div>
								</td>
							</tr>
						</table>

						<div class="searchBox float-end mt-3">
							<div class="input-group shadow-none bg-white search">
								<select id="conditionSelect" class="searchBoxoption"
									style="border-color: lightgrey; width: 100px; text-align: center;">
									<option value="cbTitle">제목</option>
									<option value="uiNickname">작성자</option>
									<option value="cbContent">내용</option>
								</select> 
								<input type="text" id="conditions" class="form-control shadow-none bg-white"
									placeholder="검색어를 입력하세요.." value="" onkeypress="renderingBoardList()">
								<div class="searchBtn" style="width: 77px;">
									<button class="btn btn-primary w-100 " onclick="renderingBoardList()" style="padding: 14px; margin-inline:8px;">검색</button>
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
window.addEventListener('load', async function(){	
	await renderingBoardList();
});

let boardFlag = true;

async function getBoardInfos(pageNo) {
	if(pageNo===undefined){
		pageNo = 1;
	}
	const getBoardURI = '/community-boards?' + document.querySelector('#conditionSelect').value + '=' + document.querySelector('#conditions').value + '&pageNo=' + pageNo;
	const response = await fetch(getBoardURI);
	const boardList = await response.json();
	boardFlag = true;
	
	return boardList;
};

async function renderingBoardList(pageNo){
	if(pageNo===undefined){
		pageNo = 1;
	}
	
	const boardList = await getBoardInfos(pageNo);
	console.log(boardList);
	if(boardList!==null){
		let html = '';
		$("#paginationBoard").twbsPagination("destroy");
		$('#paginationBoard').twbsPagination({
	  		  totalPages: (boardList.pages<=0)?1:[[boardList.pages]], // 전체 페이지
		 	  startPage: (boardList.prePage<=0)?1:parseInt([[boardList.prePage+1]]), // 시작(현재) 페이지
		 	  initiateStartPageClick: false,
			  prev: "‹", // Previous Button Label
			  next: "›", // Next Button Label
			  first: '«', // First Button Label
			  last: '»', // Last Button Label
			  onPageClick: function (event, page) { // Page Click event
			       console.info("current page : " + page);
			    }
			}).on('page', function (event, page) {
				if(boardFlag){
					renderingBoardList(page);
				}
			boardFlag = false;
		});
				
		for(let i=0;i<boardList.list.length;i++) {
			const communityboard = boardList.list[i];
			html += '<tr style= "cursor:pointer" onclick="location.href=\'/views/community/view?cbNum='
					+ communityboard.cbNum + '\'">';
			html += '<td>' + communityboard.cbNum + '</td>';
			html += '<td style="text-align:left; padding-inline: 2.5%;">' + communityboard.cbTitle + '<span> ['
					+ communityboard.commentCnt+ ']</span></td>';
			html += '<td>' + communityboard.uiNickname + '</td>';
			html += '<td>' + communityboard.cbCredat + '</td>';
			html += '<td>' + communityboard.cbViewCnt + '</td>';
			html += '</tr>';
		}	
		document.querySelector('#tBody').innerHTML = html;
	}
}

async function getBoardInfosByCategory(category, pageNo) {
	if(pageNo === undefined){
		pageNo = 1;
	}
	const response = await fetch('/community-boards/category?cbCategory=' + category + "&pageNo=" + pageNo);
	const categoryBoardList = await response.json();
	boardFlag = true;
	return categoryBoardList;
}

async function renderingCategoryBoard(category, pageNo){
	if(pageNo===undefined){
		pageNo = 1;
	}
	
	const categoryBoardList = await getBoardInfosByCategory(category, pageNo);
	console.log(categoryBoardList);
	
	if(categoryBoardList!==null){
		$("#paginationBoard").twbsPagination("destroy");
		$('#paginationBoard').twbsPagination({
	  		  totalPages: (categoryBoardList.pages<=0)?1:[[categoryBoardList.pages]], // 전체 페이지
		 	  startPage: (categoryBoardList.prePage<=0)?1:parseInt([[categoryBoardList.prePage+1]]), // 시작(현재) 페이지
		 	  initiateStartPageClick: false,
			  prev: "‹", // Previous Button Label
			  next: "›", // Next Button Label
			  first: '«', // First Button Label
			  last: '»', // Last Button Label
			  onPageClick: function (event, page) { // Page Click event
			       console.info("current page : " + page);
			    }
			}).on('page', function (event, page) {
				if(boardFlag){
					renderingCategoryBoard(category, page);
				}
			boardFlag = false;
		});
		
		let html = '';
		for (let i=0; i < categoryBoardList.list.length; i++) {
			const communityboard = categoryBoardList.list[i];
			html += '<tr style= "cursor:pointer" onclick="location.href=\'/views/community/view?cbNum='
					+ communityboard.cbNum + '\'">';
			html += '<td>' + communityboard.cbNum + '</td>';
			html += '<td style="text-align:left; padding-inline: 2.5%;">' + communityboard.cbTitle + '<span> ['
					+ communityboard.commentCnt + ']</span></td>';
			html += '<td>' + communityboard.uiNickname + '</td>';
			html += '<td>' + communityboard.cbCredat + '</td>';
			html += '<td>' + communityboard.cbViewCnt + '</td>';
			html += '</tr>';
		}
		document.querySelector('#tBody').innerHTML = html;
	}
}	

</script>
</body>
</html>