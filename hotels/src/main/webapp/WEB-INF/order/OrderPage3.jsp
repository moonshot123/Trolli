<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../main/main_top.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제 페이지</title>
<script type="text/javascript">
</script>
</head>
<%@ page import="java.util.*" %>

<% 
Random random = new Random();
int randomnum = random.nextInt(1000000000);
%>
<div class="col-md-1"></div>
<div class="col-md-10">
<%-- 	<c:set var="num" value="${loginfo.logincheck}" /> --%>
<!-- <form class="form-horizontal" method="get" action="orderpage3.ord">	 -->
	<br> <br> <br>
		<ul class="breadcrumb">
			<li><a href="#">객실 선택</a></li>
			<li><a href="orderpage.ord">예약정보</a></li>
			<li><a href="orderpage2.ord">결제정보</a></li>
			<li class="active">결제완료</li>
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


<table class="table table-striped table-hover ">
<tr>
<td align="center">
<Br>
<b><span class="text-primary">${loginfo.membername}</span></b>님의 결제가 완료되었습니다.<Br>
<b>

예약번호는 ${resnum } 입니다.</b><Br><Br><Br>

<%-- 
	<b>최종 결제 금액:</b><b>￦</b>&nbsp;${reservation.totalpay}<br>
 --%>

체크인:<b><c:out value="${searchStart }"/></b>&nbsp;&nbsp;체크아웃:<b><c:out value="${searchEnd }"/></b><br>
<h4><b>즐거운 여행 되시길 바랍니다.</b></h4><Br>
<a href="main.com" class="btn btn-default">메인으로 가기</a>
</td>
</tr>
</table>
<!-- </form> -->
</div>
<div class="col-md-1"></div>
<%@ include file="./../main/main_bottom.jsp"%>
