<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>어청도 신흥상회에 오신 것을 환영합니다</title>

<!-- bootstrap css -->
<!--  <link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">-->

<style type='text/css'>
td {
	font-size: 12;
	text-align: center;
}

a:link {
	text-decoration: none;
}

a:visitied {
	text-decoration: none;
}

a:hover {
	text-decoration: none;
}

a:active {
	text-decoration: none;
}
</style>
<script language='javascript' type='text/javascript'> //<![CDATA[
   
   function fncShow(pos) {
      var muCnt = 5; // 메뉴 개수에 맞게 수정
      var i = 0;
      for(i; i < muCnt; i++) {
         var obj = document.getElementById("menu"+i);
         var obj2 = document.getElementById("m"+i);
         if(i==pos) {
            obj.style.display = '';
            obj2.style.color="#ff0000";
         } else {
            obj.style.display = 'none';
            obj2.style.color = "#000000";
         }
      }
   }
   function fncHide() {
      var obj = document.getElementById(bottommenu);
      obj.style.display = 'none';
   }
   
//]]></script>
</head>
<body>

<table cellpadding='0' cellspacing='1' border='0' width='100%'>
	<!-- 상단 메뉴 -->
	<td width='180'><a href='./'><img
			src="${pageContext.request.contextPath}/resources/img/shin.png"
			alt="logo" width='120' height='100' border='0'></a></td>
	<td>
		<table cellpadding='0' cellspacing='1' border='0' width='100%'
			height='60'>
			<tr height='50'>
				<td width='150' onmouseover='fncShow(0);' id='m0'
					style='padding-top: 10px;'><a class="navbar-brand" href='introduce'><b>민박
							소개</b></a></td>
				<td width='150' onmouseover='fncShow(1);' id='m1'
					style='padding-top: 10px;'><a class="navbar-brand" href='room1'><b>객실 안내</b></a></td>
				<td width='150' onmouseover='fncShow(2);' id='m2'
					style='padding-top: 10px;'><a class="navbar-brand" href='calendar'><b>예약
							안내</b></a></td>
				<td width='150' onmouseover='fncShow(3);' id='m3'
					style='padding-top: 10px;'><a class="navbar-brand" href='around_01'><b>주변
							관광지</b></a></td>
				<td width='150' onmouseover='fncShow(4);' id='m4'
					style='padding-top: 10px;'><a class="navbar-brand" href='resortBoard_list'><b>신흥상회
							소식</b></a></td>
				<td width='150'></td>
			</tr>
			

			<!-- 하단 메뉴 -->
			<tr height='50' id='bottommenu' onmouseout='fncHide();'>
				<td colspan='6'>
					<table id='menu0' style='display: none;' cellpadding='0'
						cellspacing='0' width='1050' height='50'>
						<tr>
							<td width='0'></td>
							<td width='1040' style='text-align: left;'
								onmouseout='fncHide(0);'><a href='introduce'><span
									onmouseover=this.style.color=
									'#ff0000' onmouseout=this.style.color='#000000'>신흥상회</span></a>
									<a href='place'><span onmouseover=this.style.color=
									'#ff0000' onmouseout=this.style.color='#000000'> | 오시는
										길</span></a></td>
						</tr>
					</table>
		<table id='menu1' style='display: none;' cellpadding='0'
			cellspacing='0' width='1050' height='50'>
			<tr>
			<td width='170'></td>
			<td width='1050' style='text-align: left;'><a href='room1'><span
					onmouseover=this.style.color=
					'#ff0000' onmouseout=this.style.color='#000000'>1호실</span></a>
				<a href='room2'><span onmouseover=this.style.color='#ff0000' onmouseout=this.style.color='#000000'> | 2호실</span></a>
				<a href='room3'><span onmouseover=this.style.color='#ff0000' onmouseout=this.style.color='#000000'> | 3호실</span></a>
				</td>
			</tr>
		</table>
						<table id='menu2' style='display: none;' cellpadding='0'
							cellspacing='0' width='1050' height='50'>
							<tr>
								<td width='370'></td>
								<td width='680' style='text-align: left;'><a
									href='calendar'><span onmouseover=this.style.color=
										'#ff0000' onmouseout=this.style.color='#000000'> 예약하기</span></a><a
									href='check'><span onmouseover=this.style.color=
										'#ff0000' onmouseout=this.style.color='#000000'> | 예약확인</span></a></td>
							</tr>
						</table>
						<table id='menu3' style='display: none;' cellpadding='0'
							cellspacing='0' width='1050' height='50'>
							<tr>
								<td width='450'></td>
								<td width='450' style='text-align: left;'><a href='around_01'><span
										onmouseover=this.style.color=
										'#ff0000' onmouseout=this.style.color='#000000'>  등대</span></a><a
									href='around_02'><span onmouseover=this.style.color=
										'#ff0000' onmouseout=this.style.color='#000000'> | 봉수대</span></a><a
									href='around_03'><span onmouseover=this.style.color=
										'#ff0000' onmouseout=this.style.color='#000000'> | 구불길</span></a></td>
							</tr>
						</table>
						<table id='menu4' style='display: none;' cellpadding='0'
							cellspacing='0' width='1050' height='50'>
							<tr>
								<td width='700'></td>
								<td width='350' style='text-align: left;'><a
									href='resortBoard_list'><span onmouseover=this.style.color=
										'#ff0000' onmouseout=this.style.color='#000000'>신흥상회 소식</span>
								</a><a href='/resort1/userBoard_list'><span onmouseover=this.style.color=
										'#ff0000' onmouseout=this.style.color='#000000'> | 방문객
											후기 </span></a></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			
</body>
</html>