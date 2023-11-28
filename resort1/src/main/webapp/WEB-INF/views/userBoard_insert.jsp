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
	function checkForm() {

		const form = document.getElementById('BoardInsertForm');
		const Title = form.elements.title.value.trim();
		const Content = form.elements.content.value.trim();

		if (Title.length > 100) {
			alert("제목은 100자 이내로 가능합니다");
			return false;
		} else if (Content.length > 1000) {
			alert("본문은 1000자 이내로 가능합니다");
			return false;
		} else {
			// 폼이 유효하면 write.jsp로 제출
			form.action = "/resort1/userBoard_write";
			form.submit();
			return true;
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
		</div>
		<div class="center">
			<h6 align="left">User</h6>
		</div>
		<form method="post" id="BoardInsertForm" onsubmit="return checkForm()">
			<table cellspacing="0" width="700" border="1" align="center">
				<tr>
					<td style="width: 80px"><b>작성자</b></td>
					<td><input type="text" name="writer" value="" size=20;
						class="input-field" required></td>
				</tr>
				<tr>
					<td><b>제목</b></td>
					<td><textarea name="title" rows="1" cols="110"
							style="width: 95%; height: 50%; resize: none; overflow: auto;"
							class="input-field" required></textarea></td>
				</tr>
				<tr>
					<td><b>일자</b></td>
					<td><input type="text" name="date" value="${date}" size=20;
						class="input-field" readonly></td>
				</tr>
				<tr>
					<td><b>조회수</b></td>
					<td><input type="text" name="viewcnt" value="0" size=20;
						class="input-field" readonly></td>
				</tr>
				<tr>
					<td><b>내용</b></td>
					<td><textarea name="content" rows="10" cols="110"
							style="width: 95%; height: 95%; resize: none; overflow: auto;"
							class="input-field" required></textarea></td>
				</tr>
			</table>
			<br />

			<!----------------------------- 취소 + 등록 버튼 -------------------------------->
			<div class="center">
				<table width="700">
					<tr>
						<td style="float: right;"><input type="button" value="취소"
							onClick="location.href='/resort1/userBoard_list'">&nbsp;&nbsp;&nbsp;<input
							type="submit" value="쓰기"></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</body>
</html>