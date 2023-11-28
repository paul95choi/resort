<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어청도 신흥상회에 오신 것을 환영합니다</title>
<style>
.info {
	width: 1050px;
	height: 100px;
	text-align: center;
}

#photo {
	width: 100%;
	height: 100%;
	display: flex;
	flex-direction: column; /* Stack images vertically */
	align-items: center;
	overflow: hidden;
}

#photo img {
	max-width: 70%;
	max-height: 70%;
	margin: 20px 0; /* Add margin between images */
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
	<div class="info">
		<p>
			<b>3호실</b><br /> 최대 1인<br /> <br /> 신흥 게스트하우스 3호실 시설 입니다. ^^ <br />
			3호실은 바다를 향한 창문 1개 냉장고 1대 TV 1대 에어콘 1대 화장실 1개 그리고 싱글침대1개로 이루어진 방입니다. <br />
			호실 시설 사진과 사진 전경은 아래 사진을 참고하세요 ^^ <br />
		</p>
	</div>
	<div style="width: 100%; height: 50px;"></div>
	<div style="width: 1050px;">
		<table id='photo' cellpadding='0' cellspacing='0' width='100%'
			height='800'>
			<tr>
				<td><img
					src="${pageContext.request.contextPath}/resources/img/room3.jpg"
					alt="room3"></td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td><img
					src="${pageContext.request.contextPath}/resources/img/room3-1.jpg"
					alt="room3-1"></td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td><img
					src="${pageContext.request.contextPath}/resources/img/room3-2.jpg"
					alt="room3-2"></td>
			</tr>
		</table>
	</div>
	<div class="info"></div>
</body>
</html>