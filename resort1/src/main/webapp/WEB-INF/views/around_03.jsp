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
    max-width: 100%;
    max-height: 100%;
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
			<span><a href="/resort1/adm_login">로그인</a></span> | <span><a
				href="/resort1/adm_join"> 회원가입</a></span> | <span><a
				href="/resort1/resortBoard_list"> 고객라운지</a></span>
		</div>
	</div>
  <table>
    <%@ include file="./top.jsp"%>
  </table>
  <div style="width: 100%;  height: 50px;"></div>
  <div class="info">
    <p>
      <b>구불길</b><br />
      한반도 지형의 모습을 감상할 수 있는 3코스 안산넘길의 등산로는 이용하는 데 큰 불편이 없다는 것이 김성래 이장의 설명이다.
      팔각정 쉼터에서 등산로를 걸어가다가 해막넘 쉼터에서 안산(106.6m)과 검산봉(103.1m) 방향을 바라다보면, 잘록한 허리를 드러내는 한반도 모양의 능선을 만날 수 있다. 
      드론을 날려 조금 더 위에서 보면 한반도 모양이 훨씬 선명하게 보인다.
    </p>
    
  </div>
  <div style="width: 100%;">
    <table id='photo' cellpadding='0' cellspacing='0' width='100%' height='800'>
      <tr>
        <td><img src="${pageContext.request.contextPath}/resources/img/gubul.jpg" alt="gubul"></td>
      </tr>
      <tr><td></td></tr>
      <tr>
        <td><img src="${pageContext.request.contextPath}/resources/img/gubul2.jpg" alt="gubul2"></td>
      </tr>
      <tr><td></td></tr>
      <tr>
        <td><img src="${pageContext.request.contextPath}/resources/img/gubul3.jpg" alt="gubul3"></td>
      </tr>
    </table>
  </div>
  <div class="info"></div>
</body>
</html>