<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="col-md-12">
		<div class="col-md-2"></div>

		<div class="col-md-8">
			<br> <br> <br>
			<center><img src="resources/images/mempage.png"></center>
			<br><br>
			<legend><b>기본회원정보</b></legend>

			<table class="table table-striped table-hover ">

				<thead>
					<tr>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr class="active">
						<td>회원이름</td>
						<td>${loginfo.membername}</td>
					</tr>

					<tr class="active">
						<td>회원아이디</td>
						<td>${loginfo.memberid}</td>
					</tr>

					<tr class="active">
						<td>회원등급</td>
						<td><c:set var="name" value="${loginfo.logincheck}" /> <c:choose>
								<c:when test="${name eq '3'}">
					        일반회원입니다.
					    </c:when>

								<c:when test="${name eq '2'}">
					        호스트회원입니다.
					    </c:when>

								<c:otherwise>
					        관리자입니다.
					    </c:otherwise>
							</c:choose></td>
					</tr>

					<tr class="active">
						<td>이메일</td>
						<td>${loginfo.memberemail}</td>
					</tr>

					<tr class="active">
						<td>생일</td>
						<td>${loginfo.memberbirth}</td>
					</tr>

					<tr class="active">
						<td>포인트</td>
						<td>${loginfo.memberpoint}</td>
					</tr>

				</tbody>
			</table>
			<div class="col-md-10"></div>
			<a href="updatemem.mem?membernum=${loginfo.membernum}"
				class="btn btn-trolli btn-lg btn-block">개인정보변경</a>

		</div>
		<div class="col-md-2"></div>
	</div>
	<!-- //구입결제정보 -->

    
	<div class="col-md-12">
	<div class="col-md-2"></div>
			<div class="col-md-8" >
			<h3>객실 예약결제 내역</h3>


				<table class="table table-striped table-hover ">
					<thead>
						<tr>
							<td colspan="8" align="right"></td>
						</tr>
						<tr align="center">
							<th><span>결제번호&nbsp;&nbsp;</span></th>
							<th><span>객실 이미지&nbsp;&nbsp;</span></th>
							<th><span>숙소&nbsp;&nbsp;</span></th>
							<th><span>갤실&nbsp;&nbsp;</span></th>
							<th><span>1박 가격&nbsp;&nbsp;</span></th>
							<th><span>체크인&nbsp;&nbsp;</span></th>
							<th><span>체크아웃&nbsp;&nbsp;</span></th>
							<th><span>총 가격&nbsp;&nbsp;</span></th>
							<th><span>결제취소&nbsp;&nbsp;</span></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${MyBuylist}" var="buylist">
							<tr>
								<td><c:out value="${buylist.resnum}" /></td>
								<td><img src="resources/<c:out value="${buylist.roomimg1 }" />" alt="<c:out value="${buylist.roomimg1 }" />" height="65" width="92"></td>
								<td><c:out value="${buylist.hotelname }" /></td>
								<td><c:out value="${buylist.roomname }" /></td>
								<td><c:out value="${buylist.roomprice }" /></td>
								<td><c:out value="${buylist.startdate }" /></td>
								<td><c:out value="${buylist.enddate }" /></td>
								<td><c:out value="${buylist.totalprice }" /></td>
								<td><a href="listdelete.res?resnum=${buylist.resnum}" onclick="listdelete()" class="btn btn-default">취소</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<center>${pageInfo.pagingHtml }</center>
				<br> <br> <br>
			</div>
		<div class="col-md-2"></div>
		
</div>

		<div class="col-md-12">

			<div class="col-md-2"></div>
			<div class="col-md-8">
			<h3>판매결제정보</h3>
			<div class="col-md-12" align="center">


				<table class="table table-striped table-hover ">
					<thead>
						<tr>
							<td colspan="8" align="right"></td>
						</tr>
						<tr align="center">
							<th><span>결제번호&nbsp;&nbsp;</span></th>
							<th><span>구입자&nbsp;&nbsp;</span></th>
							<th><span>숙소&nbsp;&nbsp;</span></th>
							<th><span>룸&nbsp;&nbsp;</span></th>
							<th><span>1박 가격&nbsp;&nbsp;</span></th>
							<th><span>체크인&nbsp;&nbsp;</span></th>
							<th><span>체크아웃&nbsp;&nbsp;</span></th>
							<th><span>총 가격&nbsp;&nbsp;</span></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${MySellList}" var="SellList">
							<tr>
								<td><c:out value="${SellList.resnum}" /></td>
								<td><c:out value="${SellList.membername }" /></td>
								<td><c:out value="${SellList.hotelname }" /></td>
								<td><c:out value="${SellList.roomname }" /></td>
								<td><c:out value="${SellList.roomprice }" /></td>
								<td><c:out value="${SellList.startdate }" /></td>
								<td><c:out value="${SellList.enddate }" /></td>
								<td><c:out value="${SellList.totalprice }" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<center>${pageInfo.pagingHtml }</center>
				<br> <br> <br>
			</div>
		</div>
		<div class="col-md-2"></div>
		</div>
	
</body>
</html>


