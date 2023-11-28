<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어청도 신흥상회에 오신 것을 환영합니다</title>
<style>
.center {
	width: 700px;
	margin: 0 auto;
}

.input-field {
	/* input 요소에 전체 적용 */
	border: none;
	outline: none;
	background-color: transparent;
	float: left;
}

.highlight-bg {
	background-color: #FFFFE0; /* 밝은 노란색 배경 색상 */
}

#loginbox {
	float: right;
}
</style>
<script language="JavaScript">
	function submitForm() {
		const form = document.getElementById('BoardUpdatePageForm');

		form.action = "userBoard_updatepage";
		form.submit();
	}

	function deletePost() {
		if (confirm('정말로 삭제하시겠습니까?')) {
			location.href = '/resort1/userBoard_delete?id=${item.id}';
		}
	}

	function CommentSubmit() {
		const id = document.getElementsByName('id')[0].value;
		const form = document.getElementById('Comment');
		form.action = "userBoard_reinsert?id=" + id;
		form.submit();
	}
	
	function deleteComment(commentId) {
		const id = document.getElementsByName('id')[0].value;
		const form = document.getElementById('CommentUD');
		
		form.action = "userBoard_deleteComment?ComId="+commentId+"&id="+id;
		form.submit();
	}
	
	function updateComment(commentId) {
		const id = document.getElementsByName('id')[0].value;
		const form = document.getElementById('CommentUD');
		
		form.action = "userBoard_updateComment?ComId="+commentId+"&id="+id;
		form.submit();
	}
	
	function showEditForm(commentId) {
	      // 모든 기존 수정 폼을 숨깁니다 (있는 경우)
	      var editForms = document.getElementsByClassName('edit-form');
	      for (var i = 0; i < editForms.length; i++) {
	         editForms[i].style.display = 'none';
	      }

	      // 선택한 댓글에 대한 수정 폼을 보여줍니다
	      var editForm = document.getElementById('edit-form-' + commentId);
	      editForm.style.display = "table-row";
	   }
</script>

</head>
<body>
	<div style="width: 90%;">
		<div id="loginbox">
			<span> <c:choose>
					<c:when test="${empty loginId}">
						<a href="/resort1/adm_login">로그인</a>
					</c:when>
					<c:otherwise>
						<a href="/resort1/adm_logout">로그아웃</a>
					</c:otherwise>
				</c:choose>
			</span> | <span><a href="/resort1/adm_join"> 회원가입</a></span> | <span><a
				href="/resort1/resortBoard_list"> 고객라운지</a></span>
		</div>
	</div>
	<table>
		<%@ include file="./top.jsp"%>
	</table>
	<div style="width: 100%; height: 20px;"></div>
	<div style="width: 1050px; overflow: auto;">
		<div class="center">
			<div>
				<h2 align="center">
					SHINHEUNG CONTACT <br /> <br />
				</h2>
			</div>
			<div class="center">
				<h6 align="left">No.${item.id}</h6>
			</div>
			<form method='post' id='BoardUpdatePageForm'>
				<input type="hidden" name="id" value="${item.id}">
				<table cellspacing="0" width="700" border="1" align="center">
					<tr>
						<td><b>일자</b></td>
						<td><input type="text" name="date" value="${item.date}"
							class="input-field" readonly></td>
					</tr>
					<tr>
						<td><b>작성자</b></td>
						<td><p align="left">
								<input type="text" name="writer" value="${item.writer}"
									class="input-field" readonly></td>
					</tr>
					<tr>
						<td><b>조회수</b></td>
						<td><input type="text" name="viewcnt" value="${item.viewcnt}"
							size=20; class="input-field" readonly></td>
					</tr>
					<tr>
						<td style="width: 80px"><b>제목</b></td>
						<td><textarea name="title" rows="1" cols="100"
								style="width: 95%; height: 50%; resize: none; overflow: auto;"
								class="input-field" readonly>${item.title}</textarea></td>
					</tr>
					<tr>
						<td><b>내용</b></td>
						<td><textarea name="content" rows="10" cols="100"
								style="width: 95%; height: 95%; resize: none; overflow: auto;"
								class="input-field" readonly>${item.content}</textarea></td>
					</tr>
				</table>
			</form>
			<br />

			<!----------------------------- 목록 + 수정 + 삭제 버튼 -------------------------------->
			<div class="center">
				<table width="700">
					<tr>
						<td style="float: right;"><input type="button" value="목록"
							onClick="location.href='/resort1/userBoard_list'">&nbsp;&nbsp;&nbsp;<input
							type="button" value="수정" onClick="submitForm()">&nbsp;&nbsp;&nbsp;<input
							type="button" value="삭제" onClick="deletePost()"></td>
					</tr>
				</table>
			</div>
			<br />

			<!----------------------------- 댓글 있다면 출력 -------------------------------->

			<c:if test="${not empty item.userBoardComments}">
				<table cellspacing="0" width="700" border="1" align="center">
					<form method='post' id='CommentUD'>
						<tr>
							<td><b>작성자</b></td>
							<td><b>내용</b></td>
						</tr>
						<c:forEach var="ubc" items="${item.userBoardComments}">
							<tr>
								<td><p align="left">
										<input type="text" value="${ubc.writer}" class="input-field"
											size="15" readonly></td>
								<td><textarea rows="1" cols="300"
										style="width: 400px; height: 30px; resize: none; overflow: auto;"
										class="input-field" readonly>${ubc.content}</textarea> <input
									type="button" value="수정" style="float: right;"
									onClick="showEditForm(${ubc.id})"> <input type="button"
									value="삭제" style="float: right;"
									onClick="deleteComment(${ubc.id})"></td>
							</tr>
					</form>
					<form action="/resort1/userBoard_updateComment/${ubc.id}"
						method="post" onsubmit="return confirm('댓글을 수정하시겠습니까?');">
						<tr style="display: none;" class="edit-form"
							id="edit-form-${ubc.id}">

							<td><input type="hidden" name="rootId" value="${item.id}">
								<label for="edit-writer-${ubc.id}"></label> <input type="text"
								name="editWriter" value="${ubc.writer}"
								class="input-field, highlight-bg" size="15"></td>
							<td><label for="edit-content-${ubc.id}"></label> <textarea
									name="editContent" rows="1" cols="300"
									style="width: 400px; height: 30px; resize: none; overflow: auto;"
									class="input-field, highlight-bg">${ubc.content}</textarea> <input
								type="submit" value="확인" style="float: right;"></td>
						</tr>
					</form>
					</c:forEach>
				</table>
				<br />
			</c:if>



			<!----------------------------- 댓글 -------------------------------->

			<form method='post' id='Comment'>
				<table cellspacing="0" width="700" border="1" align="center">
					<tr>
						<td><b>작성자</b></td>
						<td><b>내용</b></td>
					</tr>
					<tr>
						<td><p align="left">
								<input type="text" name="commentWriter" value=""
									class="input-field" size="15"></td>
						<td><textarea name="commentContent" rows="1" cols="300"
								style="width: 450px; height: 30px; resize: none; overflow: auto;"
								class="input-field"></textarea> <input type="button" value="등록"
							onClick="CommentSubmit()" style="float: right;"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="info"></div>
</body>
</html>