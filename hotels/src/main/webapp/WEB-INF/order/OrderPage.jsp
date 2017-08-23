<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../main/main_top.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제 페이지</title>
<script type="text/javascript">

function goOrder(hotelnum,roomnum, searchStart, searchEnd,memberid){
	alert("결제페이지로 넘어가겠습니다.");
	alert("체크인 "+searchStart);
	alert("체크아웃 "+searchEnd);
	location.href="orderpage2.ord?searchStart="+searchStart+"&searchEnd="+searchEnd+"&roomnum="+roomnum+"&hotelnum="+hotelnum+"&id="+memberid;

}


</script>
</head>
<div class="col-md-1"></div>
<div class="col-md-10">
<c:set var="num" value="${loginfo.logincheck}" /> 
<!-- <form class="form-horizontal" method="get" action="orderpage.ord"> -->
<br><br><br>
<ul class="breadcrumb">
  <li><a href="#">객실 선택</a></li>
  <li class="active">예약정보</li>
</ul>

<div class="panel panel-trolli">
  <div class="panel-heading">
    <h3 class="panel-title">예약정보</h3>
  </div>
  <div class="panel-body">
   <strong>(주)Trolli 에서 예약 시 개인정보는 안전하게 보호됩니다.</strong>
  </div>
</div>

<br><br><br>

<div class="col-md-6">
  <fieldset>
    <legend><strong>예약정보</strong></legend>
      
    <div class="form-group">
    <div class="col-md-12">
    <div class="col-md-6" style="resize: none">
      <img src="resources/${hoteldata.hotelimg1  }" style="width:100%;resize: none;">
    </div>
      <div class="col-md-6" style="resize: none">
        호텔이름 :<c:out value="${hoteldata.hotelname }"/>
      <br><br>
        주소:<c:out value="${hoteldata.hoteladdr }"/><br>
        체크인:<c:out value="${searchStart }"/><br> 
        체크아웃:<c:out value="${searchEnd }"/><br>
        사업자등록번호:<c:out value="${hoteldata.companyregnum }"/><br>
        
       

      </div>
      <Br><Br><Br><Br><Br><Br><Br><Br>
      <div class="col-md-6" align="center" style="width: 100%; resize: none">
   
      <img src="resources/${hoteldata.hotelimg1  }"  width="100" height="70">
      <img src="resources/${hoteldata.hotelimg2  }"  width="100" height="70">
      <img src="resources/${hoteldata.hotelimg3  }"  width="100" height="70">
 	  <img src="resources/${hoteldata.hotelimg4  }"  width="100" height="70">
 	  </div>
 	  <Br><Br><Br><Br><Br>
 	  <div class="col-md-12">
 	  <div class="well well-lg">
  		본 숙박업소는 (주)Trolli 를 통해 검증받은 상품입니다.<br>
  		고객 여러분의 많은 이용 바랍니다.
	  </div>
 	  </div>	   
    </div>
    </div>
   
    
    <div class="form-group">
     
    </div>
  </fieldset>
<hr>
<div class="alert alert-dismissible alert-warning">
  <button class="close" type="button" data-dismiss="alert">&times;</button>

  <p>*체크인까지 단 3일* 요금이 올라갈 수 있으니 지금 바로 예약하세요!</p>
</div>    
<div class="alert alert-dismissible alert-success">
  <button class="close" type="button" data-dismiss="alert">&times;</button>

  <p>축하합니다!<span style="color:#E91545; font-weight: bold;"> <c:out value="${hoteldata.hotelname }"/></span>에서 최저가 객실이 선택되었습니다.</p>
</div>
<div class="alert alert-dismissible alert-success">
  <button class="close" type="button" data-dismiss="alert">&times;</button>

  <p>스마트 초이스! 본 호텔은 고객평점이&nbsp;<span style="color:#E91545; font-weight: bold;"><c:out value="${hoteldata.hotelscore }"/></span> 점(5점 만점)입니다.</p>
</div>

<br><br><br>
  <fieldset>
    <legend><strong>고객정보</strong></legend>
  	
    <div class="form-group">
      <label class="col-md-2 control-label" for="inputName">이름</label>
      <div class="col-md-10">
        <input class="form-control" id="inputName" type="text" value="${loginfo.membername}">
      </div>
    </div>
    <div class="form-group">
      <label class="col-md-2 control-label" for="inputEmail">이메일</label>
      <div class="col-md-10">
        <input class="form-control" id="inputEmail" type="text" value="${loginfo.memberemail}">
      </div>
    </div>
     
     <div class="checkbox">
          <div class="col-md-12">
            <input type="checkbox">예약자와 투숙자가 다를 경우 클릭해서 투숙객 정보를 입력해 주세요.  
          </div>
        </div>
    <Br><Br><Br><Br>      
    <div class="well well-lg">
  	예약 정보 온라인 접속 무료!<Br>
	항시 온라인으로 투숙객 정보 수정이나 특별 요청 사항 추가, 바우처 인쇄 또는 체크인/체크아웃 날짜 변경도 할 수 있습니다.
	</div>
     <Br><Br>
     <div class="text-success">
     	<p>계속 진행함으로써 Trolli 의 이용 약관 및 개인정보 처리방침에 동의하게 됩니다.</p>
     </div>
    <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2" align="right">
        <a href="#" class="btn btn-info disabled">Trolli 보장제</a>
        &nbsp;&nbsp;
        
        <button class="btn btn-success" onclick="goOrder('${hoteldata.hotelnum }','${roomdata.roomnum }','${searchStart }','${searchEnd }','${loginfo.memberid}');">결제하기</button>
      </div>
    </div>
  </fieldset>
</div> 
<div class="col-md-6">
<fieldset>
    <legend><strong>객실 정보</strong></legend>
       
  	
    <div class="form-group">
    <div class="col-md-12">
    <div class="col-md-6">
    
    <img src="resources/${roomdata.roomimg1   }"  width="200" height="140">
    
    </div>
    <div class="col-md-6">
    <img src="resources/${roomdata.roomimg2   }"  width="200" height="140">
    
    </div>
    </div>
    </div>
  	 <div class="form-group">
    <div class="col-md-12">
    <br><br>
        방이름 :<c:out value="${roomdata.roomname }"/>
      <br><br>
        방사이즈:<c:out value="${roomdata.roomsize }"/><br>
        최대숙박인원수:<c:out value="${roomdata.roompeople }"/><br> 
       포인트:<c:out value="${roomdata.roompoint }"/>
    <div class="col-md-12">
    <br><br>
    <div class="well">
  
  	1박당 요금:
  	<span style="color:#E91545; font-weight: bold; font-size: 15px;">￦<c:out value="${roomdata.roomprice }"/></span>
   
  	<p>포함: 봉사료 10%, 세금 8%</p>
	</div>
    </div>
    
    </div>
    </div>
    
    <div class="form-group">
    <div class="col-md-12">
    <div class="col-md-12">
    <a href="javascript:history.go(-1)" class="btn btn-default btn-lg btn-block">돌아가기</a>	
    </div>
    </div>
    </div>
    
    
  </fieldset>
</div> 
<!-- </form> -->
</div>
<div class="col-md-1"></div>
<%@ include file="./../main/main_bottom.jsp"%>