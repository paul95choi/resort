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

#loginbox {
	float: right;
}
</style>
<script language="JavaScript">
	function submitForm() {
		const form = document.getElementById('BoardUpdatePageForm');

		form.action = "resortBoard_updatepage";
		form.submit();
	}

	function deletePost() {
		if (confirm('정말로 삭제하시겠습니까?')) {
			location.href = '/resort1/resortBoard_delete?id=${item.id}';
		}
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
		<%@ include file="../../top.jsp"%>
	</table>
	<div style="width: 100%; height: 20px;"></div>
	<div style="width: 1050px;">
		<div class="center">
			<div>
				<h2 align="center">
					SHINHEUNG NOTICE <br /> <br />
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
				<br />

				<!----------------------------- 목록 + 수정 + 삭제 버튼 -------------------------------->
				<div class="center">
					<table width="700">
						<tr>
							<td style="float: right;"><input type="button" value="목록"
								onClick="location.href='/resort1/resortBoard_list'">&nbsp;&nbsp;&nbsp;<input
								type="button" value="수정" onClick="submitForm()">&nbsp;&nbsp;&nbsp;<input
								type="button" value="삭제" onClick="deletePost()"></td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
</body>
</html>