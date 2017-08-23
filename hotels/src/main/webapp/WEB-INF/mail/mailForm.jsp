<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../main/main_top.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Bootstrap -->
<link href='<c:url value="resources/css/bootstrap.min.css" />'
	rel="stylesheet">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src='<c:url value="resources/js/jquery.js" />'></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src='<c:url value="resources/bootstrap/bootstrap.min.js"  />'></script>
<!-- 메인스크립트 -->
<script src="resources/js/mainscript.js"></script>
<script type="text/javascript">


function moving() {
	
		location.href="mail.mi";
	  var elem = document.getElementById("myBar");   
	  var width = 10;
	  var id = setInterval(frame, 10);
	  function frame() {
	    if (width >= 100) {
	      clearInterval(id);
	    } else {
	      width++; 
	      elem.style.width = width + '%'; 
	      elem.innerHTML = width * 1  + '%';
	    }
	  }
	}
</script>

<style type="text/css">
#myProgress {
  width: 100%;
  background-color: #ddd;
}

#myBar {
  width: 0%;
  height: 30px;
  background-color: #4CAF50;
  text-align: center;
  line-height: 30px;
  color: white;
} 
</style>
<title>Insert title here</title>
</head>
	<Br>
	<br>
	<br>
	<div class="col-md-1"></div>
	<div class="col-md-8">
	<div class="container">
		<div class="col-md-8">
		<h4><label class="text-default">고객서비스</label></h4>
		</div>
		
		
		

		<div class="col-md-8">
		<h6><B>예약 관리</B></h6>
		<p>'셀프서비스' 예약 관리 페이지에서 단 몇 번의 클릭만으로 예약을 변경 및 취소하거나 예약 현황을 확인할 수 있으며
		 영수증 받기, 바우처 사본 받기 및 숙소로 직접 특별 요청 사항을 보낼 수도 있습니다.
		</p>
		<c:choose>
		<c:when test="${loginfo.membername eq null}">
	
		</c:when>
		<c:otherwise>
           <a href="member.mem?membernum=${loginfo.membernum}" class="btn btn-primary btn-lg btn-block"> 예약 관리하기</a>
		</c:otherwise>
		</c:choose>
		</div>
		
		<div class="col-md-8">
		<h6><B>이메일</B></h6>
		<ul>
		<li>자주 묻는 질문에 대한 답변을 <strong>FAQ</strong>에서 확인할 수 있습니다.</li>
		<li><strong>FAQ</strong> 혹은<strong> 예약 관리 페이지</strong>를 통해 해결할 수 없는 사안인 경우 아래 양식을 작성해 보내 주시면 대개 24시간 이내에 답변을 드릴 수 있도록 하겠습니다. 긴급 사안인 경우 본 페이지에 나와 있는 전화번호로 연락 주시기 바랍니다.</li>
		<li>본 페이지에 나와 있는 전화번호로 연락해 문의하실 수 있으며 국제 전화 요금이 부과될 수 있습니다.<br> 고객 센터 상담 시 숙소 바우처에 명시된 '예약 번호'와 예약 시 사용한 '신용카드 마지막 네 자리 숫자'가 필요하니 연락 전 준비해 두시기 바랍니다.</li>
		</ul>
		</div>
		
		<div class="col-md-8">
		
		<hr><br>
		<form action="mail.mi" method="post">
			<div class="col-md-12">
				<!-- 받는 사람 이메일(보내는 사람은 고정되어 있다.) -->
				<input type="text" name="tomail"  style="width: 100%"
					value="bestkeyplay@gmail.com" class="form-control">
			</div>
			<div class="col-md-12">
				<!-- 보내는 사람 이메일  가짜로 설정-->
				<input type="text" placeholder="보내는 사람"
					style="width: 100%" class="form-control">
			</div>
			<div class="col-md-12">
				<!-- 제목 -->
				<input type="text" name="title" style="width: 100%"
					placeholder="제목을 입력해주세요" class="form-control">
			</div>
			<p>
			<div class="col-md-12">
				<!-- 내용 -->
				<textarea name="content" cols="120" rows="12"
					style="width: 100%; resize: none"
					placeholder="내용# 정확한 정보전달을 위해 보내는 이의 메일 주소를 내용 부분에 한번 더 작성해주시길 바랍니다."
					class="form-control"></textarea>
			</div>
			<p>
			
			<div class="col-md-12" align="center" >
			<Br>
			<input type="submit" data-toggle="modal" data-target="#mailModal" 
			onclick="moving()" value="문의하기" class="btn btn-success">
			
			</div>
			
		</form>
		</div>
	</div>
	</div>
	<div class="col-md-2">
	<div class="col-md-12">
	<h6><label class="text-trolli" style="font-weight: bold;">전화 문의(24시간 연중무휴)</label></h6>
	<div>
	<p>고객 센터 상담 시 숙소 바우처에 명시된 '<strong>예약 번호</strong>'와 예약 시 사용한 '신용카드 마지막 네 자리 숫자'가 필요하니 연락 전 준비해 두시기 바랍니다.</p>
	<p><strong>상담원 연결</strong></p>
	<P>평일 오전 09:00 ~ 오후 19:00</P>
	<P>주말 오전 09:00 ~ 오후 13:00</P>
	<p>휴일/공휴일 휴무</p>
	<p><strong>자동 응답 서비스</strong></p>
	<p>24시간 연중무휴</p>
	<br>
	<div class="col-md-12"align="right">
	<img src="resources/images/koreaflag.png">South Korea&nbsp;+82 2 6022 2443
	</div>
	
	<br>
	</div>
	</div>
	</div>
<div class="col-md-1"></div>

	
<!-- ======================================================================================= -->	
<!-- ======================================================================================= -->	
<!-- ======================================================================================= -->	
<!-- 모달입니다. -->
<div class="modal fade" id="mailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Close">
<span aria-hidden="true">&times;</span>
</button>
<h4 class="modal-title">문의 메일</h4>
</div>
<div class="modal-body">
<p>문의 메일이 전송되었습니다.</p>
</div>
<div id="myProgress">
	<div id="myBar">0%</div>
</div>
<div class="modal-footer">
<button type="button" class="btn" data-dismiss="modal">닫기</button>
</div>
</div>

</div>

</div>

<%@ include file="./../main/main_bottom.jsp"%>