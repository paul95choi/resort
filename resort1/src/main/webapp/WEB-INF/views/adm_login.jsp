<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어청도 신흥상회에 오신 것을 환영합니다</title>
<style>
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
	<div style="width: 100%; height: 20px;"></div>
	<div style="width: 1050px;">
		<div>
			<form method="post"
				action="/resort1/login">
				<div>
					<label for="loginId">로그인 아이디 : </label> <input type="text"
						name="loginId" />
				</div>
				<br />
				<div>
					<label for="password">비밀번호 : </label> <input type="password"
						name="password" />
				</div>
				<div>
					<c:if test="${not empty loginRequestBindingResult}">
						<br />
						<div class="error-class">
							<c:forEach items="${loginRequestBindingResult.fieldErrors}"
								var="error">
								<c:out value="${error.defaultMessage}" />
								<br />
							</c:forEach>
						</div>
					</c:if>
				</div>
				<br />
				<button type="submit">로그인</button>
			</form>
		</div>
	</div>
	<c:if test="${not empty message}">
		<script>
			alert('<c:out value="${message}" />');
		</script>
	</c:if>
</body>
</html>