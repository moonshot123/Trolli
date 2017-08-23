<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../main/main_top.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제 페이지</title>
<script type="text/javascript">

//출력방식1
function bankSelected(obj) {
	  var getbank = obj[obj.selectedIndex].innerHTML;
	 
	  $("input[name='bank']").val(getbank);
	  // 혹은, document.getElementById("bank").value = getbank;
}


//출력방식2
function monthDisplay(obj) {
	  var getmonth = obj[obj.selectedIndex].innerHTML;
	 
	  $("input[name='m']").val(getmonth);
	  // 혹은, document.getElementById("bank").value = getbank;
}

/* //출력방식2
function monthDisplay(frm) {

    var m = frm.selectmonth.selectedIndex;

    switch( m ){
	   case 0:
	     frm.m.value = '일시불';
		 break;
	   case 1:
	     frm.m.value = '1개월';
		 break;
	   case 2:
	     frm.m.value = '3개월';
		 break;
	   case 3:
	     frm.m.value = '6개월';
		 break;
	   case 4:
		 frm.m.value = '12개월';
		 break;
	   case 5:
		 frm.m.value = '24개월';
		 break; 	 
	   case 6:
		 frm.m.value = '36개월';
		 break; 
	   case 7:
		frm.m.value = '48개월';
		break; 
    }
    return true;
} */

//결제하기완료
function goPayment(hotelnum,roomnum, searchStart, searchEnd,memberid){
	alert("결제가 완료되었습니다.");
	location.href="orderpage3.ord?searchStart="+searchStart+"&searchEnd="+searchEnd+"&roomnum="+roomnum+"&hotelnum="+hotelnum+"&id="+memberid;
}


</script>
</head>
<div class="col-md-1"></div>
<div class="col-md-10">
<%-- 	<c:set var="num" value="${loginfo.logincheck}" /> --%>
<!-- 	<form class="form-horizontal" method="get" action="orderpage2.ord"> -->
		<br> <br> <br>
		<ul class="breadcrumb">
			<li><a href="#">객실 선택</a></li>
			<li><a href="#">예약정보</a></li>
			<li class="active">결제정보</li>
		</ul>

		<div class="panel panel-trolli">
			<div class="panel-heading">
				<h3 class="panel-title">예약정보</h3>
			</div>
			<div class="panel-body">
				<strong>(주)Trolli 에서 예약 시 개인정보는 안전하게 보호됩니다.</strong>
			</div>
		</div>
		<br> <br> <br>


		<div class="col-md-12">
			<table class="table table-striped table-hover ">
				<thead>
					<tr>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>적립금 사용</th>
						<td><B>보유포인트 ${point}</B><br> <input type="text" name="point"
							class="form-control"></td>
					</tr>

					<tr>
						<th>카드종류</th>
						<td><select class="form-control" name="" onChange="javascript:bankSelected(this);" multiple='multiple'>
								<optgroup label="선택하세요.">
									<option value="1">신한</option>
									<option value="2">BC</option>
									<option value="3">KB국민</option>
									<option value="4">삼성</option>
									<option value="5">현대</option>
									<option value="6">롯데</option>
									<option value="7">하나</option>
									<option value="8">하나(구,외환)</option>
									<option value="9">NH채움</option>
									<option value="10">IBK기업</option>
									<option value="11">광주</option>
									<option value="12">수협</option>
									<option value="13">신협</option>
									<option value="14">우체국카드</option>
									<option value="15">저축은행</option>
									<option value="16">전북</option>
									<option value="17">제주</option>
									<option value="18">산은캐피탈</option>
									<option value="19">MG새마을카드</option>
									<option value="20">카카오뱅크</option>
								</optgroup>
						</select>
							<p align="right">
								<b>선택카드:</b><input name="bank">
							</p></td>

					</tr>

					<tr>
						<th>할부개월</th>
						<td><select class="form-control" name=""
							onchange="javascript:monthDisplay(this)" multiple='multiple'>
								<optgroup label="선택하세요.">
									<option value="1">일시불</option>
									<option value="2">2개월</option>
									<option value="3">3개월</option>
									<option value="4">6개월</option>
									<option value="5">12개월</option>
									<option value="6">24개월</option>
									<option value="7">36개월</option>
									<option value="8">48개월</option>
								</optgroup>
						</select>
							<p align="right">
								<b>선택개월:</b><input name="m">
							</p></td>
					</tr>

					<tr>
						<th>카드번호</th>
						<td><input type="text" class="form-control" size="80px"
							placeholder="입력시 '-' 빼고 카드번호를 입력하여주세요"></td>
					</tr>
					<tr>
						<th>SVC입력</th>
						<td><input type="text" class="form-control" size="80px"
							placeholder="카드뒷면 SVC번호 끝에서 3자리를 입력하여주세요"></td>
					</tr>
					<tr>
						<th>카드비밀번호</th>
						<td><input type="password" class="form-control" size="80px"
							placeholder="카드비밀번호를 입력하여주세요"></td>
					</tr>

					
					<tr >
					<td colspan="2" align="center">
					
					<img  src="resources/images/cardlogo.jpg">
					</td>
					</tr>
					<tr>
						<th></th>
						<td align="right"><Br> <Br>
							<button class="btn btn-success" onclick="goPayment('${hoteldata.hotelnum }','${roomdata.roomnum }','${searchStart }','${searchEnd }','${loginfo.memberid}');">결제하기</button> <a
							href="javascript:history.go(-1)" class="btn btn-default">돌아가기</a>
						</td>
					</tr>



				</tbody>
			</table>
		</div>



<!-- 	</form> -->
</div>
<div class="col-md-1"></div>
<%@ include file="./../main/main_bottom.jsp"%>