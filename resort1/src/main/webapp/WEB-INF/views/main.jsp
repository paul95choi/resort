<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>어청도 신흥상회에 오신걸 환영합니다</title>
<style>
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
  <div style="width: 100%; height: 20px;"></div>
  <div style="width: 1050px;">
    <table id='main' cellpadding='0' cellspacing='0' width='100%' height='800'>
      <tr>
        <td><img src="${pageContext.request.contextPath}/resources/img/shinheung.jpg" alt="MainImg"></td>
      </tr>
    </table>
  </div>
</body>
</html>