<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<!-- https://bootswatch.com/paper/  이거보고 하면됨-->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 익스플로어만 적용가능 -->
<link rel="icon" type="image/x-icon" href="resources/main_images/favicon.ico?v=2"/>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" media="all" />
<script src="http://code.jquery.com/jquery-1.5.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js" type="text/javascript"></script>
<script type="text/javascript">
	/*데이트피커  */
	/* datepicker */
	$(function() {
		$("#datePicker").datepicker({
			minDate:0,
			changeMonth: true,
	        changeYear: true,
			dateFormat : "yy-mm-dd",
			onClose: function( selectedDate ) {    
            // 시작일(fromDate) datepicker가 닫힐때
            // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
            
             
            $("#datePicker2").datepicker( "option", "minDate", selectedDate);
            
            setTimeout(function() { $('#datePicker2').focus(); }, 0);
			}
			
		});
	});

	$(function() {
		$("#datePicker2").datepicker({
			minDate:1,
			changeMonth: true,
	        changeYear: true,
			dateFormat : "yy-mm-dd",
			onClose: function( selectedDate ) {
                // 종료일(toDate) datepicker가 닫힐때
                // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                $("#datePicker").datepicker( "option", "maxDate", selectedDate);
            } 
			
		});
	});
	
	
	/*  $("#datePicker").datepicker({
	    format: 'yy-mm-dd',
	    autoclose: true,
	}).on('changeDate', function (selected) {
	    var startDate = new Date(selected.date.valueOf());
	    $('#datePicker2').datepicker('setSearchStart', searchStart);
	}).on('clearDate', function (selected) {
	    $('#datePicker2').datepicker('setSearchStart', null);
	});
	 
	$("#datePicker2").datepicker({
	    format: 'yy-mm-dd',
	    autoclose: true,
	}).on('changeDate', function (selected) {
	    var endDate = new Date(selected.date.valueOf());
	    $('#datePicker').datepicker('setSearchEnd', searchEnd);
	}).on('clearDate', function (selected) {
	    $('#datePicker').datepicker('setSearchEnd', null);
	});  */

	
	
	/*데이트피커  */
	/* datepicker */
	
	
	/* 아이디 찾기 */
	function findid() {
		location.href = 'findID.mem';
	}
	/* 비번찾기 */
	function findpw() {
		location.href = 'findPW.mem';
	}

	/* 예약 */
	function reservation() {
		location.href = 'reservation.res?membernum=' + membernum
				+ '&start_date=' + start_date + '&end_date=' + end_date
				+ '&form-control=' + form - control;
	}

	/* 검색 */
	function search() {
		location.href = "search.hot";
	}

	/*searchview에서 검색 */
	function search2() {
		location.href = 'search.hot?search_p=' + search_p + '&start_date='
				+ start_date + '&end_date=' + end_date + '&roompeople='
				+ roompeople;
	}

	/* comment 삽입 */
	function commentinsert(membernum, hotelnum, hotelscore) {
		var comments = $("#comments").val();
		var score = $("input:radio[id=score]:checked").val();
		location.href = 'commentinsert.roo?membernum=' + membernum
				+ '&hotelnum=' + hotelnum + '&comments=' + comments
				+ '&hotelscore=' + hotelscore + '&score=' + score;
	}

	/* comment 수정 */
	function goUpdate(commentnum) {
		alert("정보 수정 시작하겠습니다.");
		location.href = 'commentupdate.roo?commentnum=' + commentnum;
	}

	/* 썸네일 */
	function thumbnail(image) {

		document.getElementById("image").innerHTML = "<img class='timage' src='resources/"+image+"' alt='받아오는 이미지가 없습니다.'>";
	}

	//title
	document.title = "Trolli에 오신것을 진심으로 환영합니다.";
</script>

<style type="text/css">
div.sc_div {
	width: 20%;
	background-color: blue !important;
}

.col-md-9 {
	width: 75%;
}

@media ( min-width : 992px) bootstrap.min.css:5 .col-md-1 , . col-md-10 , .
		col-md-11 , . col-md-12 , . col-md-2 , . col-md-3 , . col-md-4 , .
		col-md-5 , . col-md-6 , . col-md-7 , . col-md-8 , . col-md-9 {
	float
	:
	 
	left
	;
	
		
}

.navbar-toggler {
	z-index: 1;
}

@media ( max-width : 576px) {
	nav>.container {
		width: 100%;
	}
}

.carousel-item.active, .carousel-item-next, .carousel-item-prev {
	display: block;
}

/* 상세보기 썸네일 */
.container2 {
	position: relative;
	width: 50%;
}

.o-image {
	display: block;
	width: 100%;
	height: auto;
}

.dark-overlay {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	height: 100%;
	width: 100%;
	opacity: 0;
	transition: .5s ease;
	background-color: rgba(0, 0, 0, 0.5);
}

.container2:hover .dark-overlay {
	opacity: 1;
}

.text {
	font-weight: bold;
	font-size: 25px;
	color: white;
	vertical-align: text-bottom;
	position: absolute;
	left: 20%;
	bottom: 20px;
	letter-spacing: 5px;
}

/* 썸네일을 눌렀을때 크게 보여지는 image의 class명(javascript에 있음) */
.container {
	position: relative;
	width: 50%;
}

.o-image {
	display: block;
	width: 100%;
	height: auto;
}

.dark-overlay {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	height: 100%;
	width: 100%;
	opacity: 0;
	transition: .5s ease;
	background-color: rgba(0, 0, 0, 0.5);
}

.container2:hover .dark-overlay {
	opacity: 1;
}

.text {
	font-weight: bold;
	font-size: 25px;
	color: white;
	vertical-align: text-bottom;
	position: absolute;
	left: 20%;
	bottom: 20px;
	letter-spacing: 5px;
}

/* 썸네일을 눌렀을때 크게 보여지는 image의 class명(javascript에 있음) */
.timage {
	position: absolute;
	left: 32%;
	width: 500px;
	height: 400px;
}

#id:active img-action {
	z-index: -1;
}
</style>
<!-- bootstrap -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="resources/bootstrap_search/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="resources/bootstrap_search/css/shop-homepage.css" rel="stylesheet">
<link href="resources/bootstrap_room/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="resources/bootstrap_room/css/modern-business.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" >
<!--동적반응  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<!-- bootstrap.min.js -->
<script src="resources/bootstrap/bootstrap.min.js"></script>
<!-- maincss -->
<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<!-- placeholder -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 제이쿼리 라이브러리 호출 -->
<script src="resources/js/placeholder_ie2.js"></script>
<!-- ie를 위한 스크립트 -->
<script src="resources/js/script_ie9.js"></script>
<!--  ie를 위한 input type 노출 문제 훼이크 스크립트 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- 달력 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 메인스크립트 -->
<script src="resources/js/mainscript.js"></script>


</head>

<body>
	<form action="main.com" method="get">
		<div class="navbar navbar-default navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<a href="main.com" class="navbar-brand"> <label
						class="text-trolli" style="font-weight: bold;">Trolli</label> <label
						style="font-size: 13px;">마음에 꼭 맞는 숙소 찾기</label>
					</a>

					<button class="navbar-toggle" type="button" data-toggle="collapse"
						data-target="#navbar-main">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<div class="navbar-collapse collapse" id="navbar-main">
					<ul class="nav navbar-nav navbar-right">

						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#" id="themes">고객센터 <span
								class="caret"></span></a>
							<ul class="dropdown-menu" aria-labelledby="themes">
								<li><a href="mail.mi">고객서비스<Br> <img
										src="resources/images/koreaflag.png">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span>+82 2 6022 2443</span>
								</a></li>
								<li class="divider"></li>
								<li><a href="showcompany.co">- 회사소개(연혁)</a></li>
								<li><a href="people.co">- 개발자 소개 및 조직도</a></li>
								<li><a href="rule.co">- 개인정보 이용방침 및 이용약관</a></li>
								<li><a href="list.bo">- Q&A(질의응답)</a></li>
								<li><a href="orderpage.ord">- 주문하기(임의위치)</a></li>
								<li><a href="commentlist.cmt">- 후기코멘트(임의위치)</a></li>
							</ul></li>

						<c:choose>
							<c:when test="${loginfo.membername eq null}">
								<li><a data-toggle="modal" data-target="#myModal">로그인</a></li>
								<li><a href="memregister.mem">회원가입</a></li>
							</c:when>
							<c:otherwise>

								<li><a href="logout.mem">로그아웃</a></li>
								<li><a href="member.mem?membernum=${loginfo.membernum}">내정보</a></li>
								<li><a href="favorate.fav">위시리스트</a></li>
									<!--  mypage에서수정  : 원래는 세션으로 객체를 받으면 기거서 데이터 뽑아서 사용해야될듯   --> <!-- 1: 일반   2:숙소제공    3:관리자 -->
									<!-- 이런식으로 mvc모델에서는 바로 호출이 안된다.  <a href="./../mypage/MyPage.jsp">정보보기</a> -->
									<c:if test="${loginfo.logincheck ne '1'}">
										<li><a href="hostregister.mem">호스팅가입하기</a></li>
									</c:if>
							</c:otherwise>
						</c:choose>
						<c:if test="${loginfo.membername ne null}">
							<li><a><b class="text-primary">${loginfo.membername}</b>
									님 환영합니다 </a></li>
							<li><a>${loginfo.memberpoint} <B class="text-primary">P</B></a></li>
						</c:if>

					</ul>
				</div>
			</div>
		</div>
	</form>

	<form action="login.mem" method="POST">
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h3 class="modal-title">Welcome !</h3>
						<h5>
							<span class="text-trolli">Trolli</span> 에서 마음에 드는 숙소를 최저가로
							예약해보세요.
						</h5>

					</div>
					<div class="modal-body">
						<table>
							<tr>
								<td>ID :</td>
								<td><input type="text" class="form-control" name="memberid"></td>
							</tr>
							<tr>
								<td>PassWord :</td>
								<td><input type="password" class="form-control"
									name="memberpw"></td>
						</table>
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-default" value="로그인">

						<button type="button" class="btn btn-default" onclick="findid()">아이디
							찾기</button>
						<button type="button" class="btn btn-default" onclick="findpw()">비밀번호
							찾기</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</form>



	<br>