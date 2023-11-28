<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUNRISE RESORT에 오신 것을 환영합니다</title>
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
	function checkForm() {
		const form = document.getElementById('BoardUpdateForm');
		const Title = form.elements.title.value.trim();
		const Content = form.elements.content.value.trim();

		if (Title.length > 100) {
			alert("제목은 100자 이내로 가능합니다");
			return false;
		} else if (Content.length > 1000) {
			alert("본문은 1000자 이내로 가능합니다");
			return false;
		} else {
			if (confirm("정말로 수정하시겠습니까?")) {
				form.action = "userBoard_update";
				form.submit();
				return true;
			} else {
				return false;
			}
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
		<%@ include file="./top.jsp"%>
	</table>
	<div style="width: 100%; height: 20px;"></div>
	<div style="width: 1050px;">
		<div class="center">
			<div>
				<h2 align="center">
					SHINHEUNG CONTACT <br /> <br />
				</h2>
			</div>
			<div class="center">
				<h6 align="left">No.${item.id}</h6>
			</div>
			<form method='post' id='BoardUpdateForm'
				onsubmit="return checkForm()">
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
						<td class="highlight-bg"><textarea name="title" rows="1"
								cols="100"
								style="width: 95%; height: 50%; resize: none; overflow: auto;"
								class="input-field">${item.title}</textarea></td>
					</tr>
					<tr>
						<td><b>내용</b></td>
						<td class="highlight-bg"><textarea name="content" rows="10"
								cols="100"
								style="width: 95%; height: 95%; resize: none; overflow: auto;"
								class="input-field">${item.content}</textarea></td>
					</tr>
				</table>
				<br />

				<!----------------------------- 목록 + 수정 + 삭제 버튼 -------------------------------->
				<div class="center">
					<table width="700">
						<tr>
							<td style="float: right;"><input type="button" value="취소"
								onClick="location.href='/resort1/userBoard_view?id=${item.id}'">&nbsp;&nbsp;&nbsp;<input
								type="submit" value="수정"></td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
</body>
</html>