<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
      <b>1호실</b><br /> 최대 2인
    </p>
  </div>
  <div style="width: 1050px;">
    <table id='photo' cellpadding='0' cellspacing='0' width='100%' height='800'>
      <tr>
        <td><img src="${pageContext.request.contextPath}/resources/img/room1.jpg" alt="room1"></td>
      </tr>
      <tr><td></td></tr>
      <tr>
        <td><img src="${pageContext.request.contextPath}/resources/img/room1-2.jpg" alt="room1-2"></td>
      </tr>
      <tr><td></td></tr>
      <tr>
        <td><img src="${pageContext.request.contextPath}/resources/img/room1-3.jpg" alt="room1-3"></td>
      </tr>
    </table>
  </div>
  <div class="info"></div>
</body>
</html>