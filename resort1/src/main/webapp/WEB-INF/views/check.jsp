<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어청도 신흥상회 예약</title>
<style>
.button {
	width: 1050px;
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

#loginbox {
	float: right;
}
</style>
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
<h2>내 예약 확인하기</h2>
	<div style="width: 1050px;">
		<c:forEach var="resv" items="${reservations}">
			<table class="insert">
				<tr>
					<td style="width: 100px;"><p align="left">
							<b>날짜</b>
						</p></td>
					<td><input type="text" name="date" value="${resv.date}" size=20;
						style='float: left;' readonly></td>
				</tr>
				<tr>
					<td><p align="left">
							<b>룸 타입</b>
						</p></td>
					<td><input type="text" name="room" value="${resv.room}"
						size=20; style='float: left;' readonly></td>
				</tr>
				<tr>
					<td><p align="left">
							<b>예약자명</b>
						</p></td>
					<td><input type="text" name="name" value="${resv.name}" size=20;
						style='float: left;' readonly></td>
				</tr>
				<tr>
					<td><p align="left">
							<b>Tel</b>
						</p></td>
					<td><input type="text" name="tel" value="${resv.tel}" size=20;
						style='float: left;' readonly></td>
				</tr>
				<tr>
					<td><p align="left">
							<b>Email</b>
						</p></td>
					<td><input type="text" name="email" value="${resv.email}" size=20;
						style='float: left;' readonly></td>
				</tr>
				<tr>
					<td><p align="left">
							<b>입금자명</b>
						</p></td>
					<td><input type="text" name="depname" value="${resv.depname}"
						size=20; style='float: left;' readonly></td>
				</tr>
				<tr>
					<td><p align="left">
							<b>남기실 말</b>
						</p></td>
					<td><textarea name="comment" rows="11" cols="100"
							style="width: 300px; height: 50px; resize: none; overflow: auto; float: left;"
							readonly>${resv.comment}</textarea></td>
				</tr>
			</table>
			<div class="button">
					<input type="button"value="예약취소" onClick="location.href='/resort1/calendar'">
				</div>
			<br />
		</c:forEach>

	</div>
	<div class="info"></div>

</body>
</html>