<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.error-class {
	color: red;
}

.error-input {
	border-color: red;
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
			<form method="post" action="/resort1/join">
				<div>
					<label for="loginId">로그인 아이디 : </label> <input type="text"
						name="loginId"
						class="${joinRequestBindingResult.hasFieldErrors('loginId') ? 'error-input' : ''}" />
					<c:if test="${joinRequestBindingResult.hasFieldErrors('loginId')}">
						<div class="error-class">
							<c:forEach items="${joinRequestBindingResult.fieldErrors}"
								var="error">
								<c:if test="${error.field eq 'loginId'}">
									<c:out value="${error.defaultMessage}" />
									<br />
								</c:if>
							</c:forEach>
						</div>
					</c:if>
				</div>
				<br />
				<div>
					<label for="password">비밀번호 : </label> <input type="password"
						name="password" />
				</div>
				<br />
				<div>
					<label for="passwordCheck">비밀번호 체크 : </label> <input
						type="password" name="passwordCheck"
						class="${joinRequestBindingResult.hasFieldErrors('passwordCheck') ? 'error-input' : ''}" />
					<c:if
						test="${joinRequestBindingResult.hasFieldErrors('passwordCheck')}">
						<div class="error-class">
							<c:forEach items="${joinRequestBindingResult.fieldErrors}"
								var="error">
								<c:if test="${error.field eq 'passwordCheck'}">
									<c:out value="${error.defaultMessage}" />
									<br />
								</c:if>
							</c:forEach>
						</div>
					</c:if>
				</div>
				<br />
				<div>
					<label for="name">이름 : </label> <input type="text" name="name" />
				</div>
				<br />
				<div>
					<label for="email">이메일 : </label> <input type="text" name="email" />
				</div>
				<br />

			


				<button type="submit">회원 가입</button>
			</form>
		</div>
	</div>
</body>
</html>