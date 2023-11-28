<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어청도 신흥상회에 오신 것을 환영합니다</title>
<style>
.center {
	width: 800px;
	margin: 0 auto;
}

.searchbox {
	border: 0px;
	height: 20px;
}

.p {
	align: center;
	text-align: center;
	margin: 5px;
}

/* 페이지네이션 스타일 */
.pagination {
	width: 800px;
	text-align: center;
	font-size: 20px;
	margin-bottom: 20px;
}

.pagination a {
	display: inline-block;
	margin: 0 5px;
	padding: 5px 5px;
	border: 0px;
	align: center;
}

#loginbox {
	float: right;
}
</style>
<script language="JavaScript">
	function checkSearch() {
		const form = document.getElementById('BoardSearchForm');
		const searchKeyword = form.elements.search.value.trim(); //검색어

		if (searchKeyword.length === 0) {
			alert("검색어를 입력하세요.");
			return false;
		}
		if (searchKeyword.length > 20) {
			alert("20자 이내로 입력해주세요.");
			return false;
		} else {
			form.action = '/resort1/userBoard_search?search=${boardItem.title}';
			form.submit();
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
		<div>
			<h2 align="center">
				SHINHEUNG CONTACT <br /> <br />
			</h2>
			<div class="center">
				<h6 align="left">총 ${pages.totalElements}건</h6>
			</div>
			<table cellspacing="0" width="800" border="1" align="center">
				<tr>
					<td width="40"><p class="p">No</p></td>
					<td width="460"><p class="p">Title</p></td>
					<td width="100"><p class="p">Posted by</p></td>
					<td width="40"><p class="p">View</p></td>
					<td width="120"><p class="p">Date</p></td>
				</tr>

				<c:forEach var="boardItem" items="${pages.content}">
					<tr>
						<td><p class="p">${boardItem.id}</td>
						<td><p class="p">
								<a href="/resort1/userBoard_view?id=${boardItem.id}">
									<c:choose>
										<c:when test="${fn:length(boardItem.title) > 25}">
                        					${fn:substring(boardItem.title, 0, 25)}...
                    					</c:when>
										<c:otherwise>
	                        					${boardItem.title}
	                    				</c:otherwise>
									</c:choose>
								</a></td>
						<td><p class="p">
								<c:choose>
									<c:when test="${fn:length(boardItem.writer) > 3}">
                        					${fn:substring(boardItem.writer, 0, 3)}...
                    					</c:when>
									<c:otherwise>
	                        					${boardItem.writer}
	                    				</c:otherwise>
								</c:choose></td>
						<td><p class="p">${boardItem.viewcnt}</td>
						<td><p class="p">${boardItem.date}</p></td>
					</tr>
				</c:forEach>
			</table>
			<br />

			<!----------------------------- 페이지네이션 -------------------------------->
			<div class="center">
				<div class="pagination">
					<div class="center">
						<c:if test="${pages.number > 0}">
							<a href="userBoard_list?page=${pages.number - 1}">&lt;</a>
						</c:if>

						<c:forEach items="${pageNumbers}" var="i">
							<c:choose>
								<c:when test="${i eq pages.number}">
									<a href="userBoard_list?page=${i}" style="color: red">${i + 1}</a>
								</c:when>
								<c:otherwise>
									<a href="userBoard_list?page=${i}" style="color: black">${i + 1}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:if test="${pages.number < pages.totalPages - 1}">
							<a href="userBoard_list?page=${pages.number + 1}">&gt;</a>
						</c:if>
					</div>
				</div>
			</div>

			<!----------------------------- 검색 + 글쓰기 버튼 -------------------------------->
			<div class="center">
				<form method="get" id="BoardSearchForm"
					onsubmit="return checkSearch()">
					<table width="800">
						<tr>
							<td style="float: right;"><input type="text" name="search"
								value=""> <input type="submit" value="검색">&nbsp;&nbsp;&nbsp;<input
								type="button" value="글쓰기"
								onclick="location.href='/resort1/userBoard_insert'"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>