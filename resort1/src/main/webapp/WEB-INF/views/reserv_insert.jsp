<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어청도 신흥상회에 오신걸 환영합니다.</title>
<style>
.button {
	width: 450px;
	height: 100px;
	text-align: center;
}

.insert {
	width: 450px;
	height: 400px;
	border-collapse: collapse;
	margin: 0 auto; /* Center the table horizontally */
	margin-bottom: 20px;
}

.insert td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: center;
}

.required {
	color: red;
	float: left;
	margin-right: 5px;
}

#loginbox {
	float: right;
}
</style>

<script language="JavaScript">
	function submitForm() {
		const form = document.getElementById('reservInsertForm');
		const Name = form.elements.name.value.trim(); // 앞뒤 공백 제거
		const Depname = form.elements.depname.value.trim(); // 앞뒤 공백 제거
		const Tel = form.elements.tel.value.trim(); // 앞뒤 공백 제거
		const Comment = form.elements.comment.value.trim(); // 앞뒤 공백 제거

		//이메일 합치기
		const user_email = form.elements.user_email.value.trim(); // 앞뒤 공백 제거
		const email_address = form.elements.email_address.value.trim(); // 앞뒤 공백 제거
		const totalemail = user_email + '@' + email_address;
		form.elements.totalemail.value = totalemail;

		if (Name.length > 30 || Depname.length > 30) {
			alert("예약자명 또는 입금자명을 30자 이내로 입력하세요");
			return false;
		} else if (/[^가-힣]/.test(Name) || /[^가-힣]/.test(Depname)) {
			alert("예약자명 또는 입금자명에는 한글만 입력 가능합니다.");
			return false;
		} else if (!/^\d+$/.test(Tel) || !Tel.length == 11
				|| /[!@#$%^&*()_+{}\[\]:;<>,.?~\\/`"'-]/.test(Tel)) {
			alert("전화번호는 11자리 숫자로만 입력 가능합니다.");
			return false;
		} else if (!/^[A-Za-z0-9]+$/.test(user_email)
				|| !/^[A-Za-z0-9.-]+$/.test(email_address)) {
			alert("이메일은 영어와 숫자 조합으로만 작성해주세요.");
			return false;
		} else if (Comment.length > 1000) {
			alert("남기실 말은 1000자 이내로 작성해주세요.");
			return false;
		} else {
			form.action = "/resort1/reserv_insert";
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
	<div style="width: 100%; height: 50px;"></div>

	<div style="width: 1050px;">
		<div class="insert">
			<span class="required">*</span> 필수입력
			<form method="post" id="reservInsertForm"
				onsubmit="return submitForm()">
				<table class="insert">
					<tr>
						<td style="width: 100px;"><p align="left">
								<b>날짜</b>
							</p></td>
						<td><input type="text" name="date" value="${Date}" size=20;
							style='float: left;' readonly></td>
					</tr>
					<tr>
						<td><p align="left">
								<b>룸 타입</b>
							</p></td>
						<td><input type="text" name="room" value="${roomType}"
							size=20; style='float: left;' readonly></td>
					</tr>
					<tr>
						<td><p align="left">
								<b><span class="required">*</span> 예약자명</b>
							</p></td>
						<td><input type="text" name="name" value="${name}" size=20;
							style='float: left;' readonly></td>
					</tr>
					<tr>
						<td><p align="left">
								<b><span class="required">*</span> TEL</b>
							</p></td>
						<td><input type="text" name="tel" value="" size=20;
							style='float: left;' required></td>
					</tr>
					<tr>
						<td><p align="left">
								<b><span class="required">*</span> E-mail</b>
							</p></td>
						<td><input type="text" id="user_email" size=15
							style='float: left;' required><span>@</span><input
							type="text" id="email_address" size=15 list="user_email_address"
							required> <datalist id="user_email_address">
								<option value="naver.com"></option>
								<option value="daum.com"></option>
								<option value="google.com"></option>
								<option value="직접입력"></option>
							</datalist> <input type="hidden" id="totalemail" name="email" value=""></td>
					</tr>
					<tr>
						<td><p align="left">
								<b><span class="required">*</span> 입금자명</b>
							</p></td>
						<td><input type="text" name="depname" value="" size=20;
							style='float: left;' required></td>
					</tr>
					<tr>
						<td><p align="left">
								<b>남기실 말</b>
							</p></td>
						<td><textarea name="comment" rows="11" cols="100"
								style="width: 300px; height: 50px; resize: none; overflow: auto; float: left;"></textarea>
						</td>
					</tr>
				</table>
				<div class="button">
					<input type="submit" value="예약"><input type="button"
						value="취소" onClick="location.href='/calendar'">
				</div>
			</form>
		</div>
	</div>
	<div class="info"></div>

</body>
</html>