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
	<div style="width: 1050px; height: 50px;"></div>
	<div class="info">
		<p>
			<b>신흥상회에 오신 것을 환영합니다</b><br /> 주차 및 Wi-Fi가 항상 무료로 제공되므로
			언제든지 차량을 입출차할 수 있으며 연락을 취하실 수 있습니다. 군산 어청도에 위치한 본 숙소는 관광 명소 입니다.
			떠나기 전 유명한 어청도를 방문해 보세요. 별 4개를 받은 본 고급 숙소는 투숙객에게
			숙소 내 편의점, 제과제빵 및 스팀룸을/를 제공합니다.
		</p>
	</div>
	<div style="width: 1050px;">
		<table id='photo' cellpadding='0' cellspacing='0' width='1050px'
			height='800'>
			<tr>
				<td><img
					src="${pageContext.request.contextPath}/resources/img/shinheung.jpg"
					alt="resort"></td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td><img
					src="${pageContext.request.contextPath}/resources/img/gubul.jpg"
					alt="resort-4"></td>
			</tr>
			<tr>
				<td><img
					src="${pageContext.request.contextPath}/resources/img/lighthouse.jpg"
					alt="resort-2"></td>
			</tr>
			<tr>
				<td><img
					src="${pageContext.request.contextPath}/resources/img/bread.jpg"
					alt="restaurant"></td>
			</tr>
			<tr>
				<td><img
					src="${pageContext.request.contextPath}/resources/img/convenience.jpg"
					alt="massage"></td>
			</tr>
		</table>
	</div>
	<div class="info"></div>
</body>
</html>