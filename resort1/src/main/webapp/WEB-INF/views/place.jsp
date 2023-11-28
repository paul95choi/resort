<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신흥상회에 오신걸 환영합니다</title>
<style>
  .data-table {
    width: 100%;
    border-collapse: collapse;
  }
  .data-table th, .data-table td {
    border: 1px solid black;
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
		
			 <!-- [ 영국 런던을 중심으로 구글지도 만들기 ] -->
<div id="googleMap" style="width: 100%;height: 700px;"></div>

<div class="body">
      <div id="googleMap" style="width: 600px; height: 400px;"></div>
      <script>
         function myMap() {
            var mapOptions = {
               center : new google.maps.LatLng(36.118101,
                       125.981944),
               zoom : 17
            };

            var map = new google.maps.Map(document
                  .getElementById("googleMap"), mapOptions);

            var marker = new google.maps.Marker({
               position : new google.maps.LatLng(36.118101,
                     125.981944),
               title : "Hello World!"
            });

            // To add the marker to the map, call setMap();
            marker.setMap(map);
         }
      </script> 
      </div>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBHRFMIJtArYoKq5qW3MF6Gcf1er5rT7mM&callback=myMap"></script>
</body>
</html>