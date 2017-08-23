<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../main/main_top.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>호텔 리스트 페이지</title>
<script type="text/javascript">
	function insert(membernum) {
		alert("정보 입력 시작하겠습니다.");
		location.href='hotelinsert.hot?membernum='+membernum;
	}
	
	function goDelete() {
		alert("정보를 삭제하겠습니다.");
		location.href='deletehotel.hot';
	}
	
	function goUpdate(hotelnum){
		alert("정보 수정 시작하겠습니다.");
		location.href='updatehotel.hot?hotelnum='+hotelnum;
	}
	
	function goRoomList(num){
		alert("룸정보로 이동합니다.");
		location.href='rooms.roo?hotelnum='+num;
	}
	
</script>
<style type="text/css">

</style>
</head>

<br><br><br><br><br><br>
	
	<div class="col-md-12" >
	<div class="col-md-1"></div>	
	<div class="col-md-1"></div>
	</div>
	
	
	<div class="col-md-12" >
	<div class="col-md-1"></div>
      <div class="col-md-10">
	<div class="col-md-12" >
<img src="resources/images/Hotel-icon.png" alt="호텔아이콘이미지" width="100px" />
<br><br>
<legend>숙소리스트 및 추가하기</legend>

</div>      
<form action="hotellist.hot" method="get" class="navbar-form navbar-left">



	<div class="col-md-12" >
			<select name="whatColumn" class="form-control">
				<option value="all">전체 검색</option>
				<option value="hotelname">호텔이름</option>
				<option value="hoteladdr">주소</option>
			</select> 
			
			<input type="text" name="keyword" class="form-control" placeholder="Search"> 
			<input type="submit" value="출력하기" class="btn btn-default">	
	</div>
	</form>
	</div>
	<div class="col-md-1"></div>
	</div>
	
	<div class="col-md-12" >
	
	<div class="col-md-1"></div>
	<div class="col-md-10">
	<div class="col-md-12" align="center">	
	
    
	<table class="table table-striped table-hover ">
	
	  <thead>
			<tr>
			
				<td colspan="8" align="right">
				
				<input type="button" value="추가하기" onclick="insert('${loginfo.membernum}');" class="btn btn-primary btn-xs">
				
				</td>
			</tr>
			<tr align="center">
				
				

				
				<th><span>호텔번호&nbsp;&nbsp;</span></th>
				<th><span>사업자등록번호&nbsp;&nbsp;</span></th>
				<th><span>호텔카테고리&nbsp;&nbsp;</span></th>
				<th><span>호텔이름&nbsp;&nbsp;</span></th>
				<th><span>호텔주소&nbsp;&nbsp;</span></th>
				<th><span>수정&nbsp;&nbsp;</span></th>
				<th><span>삭제&nbsp;&nbsp;</span></th>
				<th><span>룸정보&nbsp;&nbsp;</span></th>
				
			
			</tr>
	</thead>
	 <tbody>
		


		
			<!-- hotelListController에서 hotelLists 가져온다. -->
			<c:forEach items="${hotelLists}" var="hotel">
			<c:if test="${loginfo.membernum == hotel.membernum}">
    		<input type="hidden" name="membernum" value="${hotel.membernum}">	
			<tr>
				<td><c:out value="${hotel.hotelnum}"/></td>
				<td>
				
				<a href="hoteldetail.hot?hotelnum=<c:out value="${hotel.hotelnum}"/>">
				<c:out value="${hotel.companyregnum }"/></a>
				</td>
				<td><c:out value="${hotel.hotelcategory }"/></td>
				<td><c:out value="${hotel.hotelname }"/></td>
				<td><c:out value="${hotel.hoteladdr }"/></td>
				<td>
				<a href="hotelupdate.hot?hotelnum=<c:out value="${hotel.hotelnum}"/>"
				onclick="goUpdate('${hotel.hotelnum}','${pageInfo.pageNumber}','${pageInfo.pageSize}')"
				 class="label label-success"
				>수정하기</a>
				
				</td>
				<td>
				<a href="hoteldelete.hot?hotelnum=<c:out value="${hotel.hotelnum}"/>" 
				onclick="goDelete()"class="label label-danger">삭제하기</a>
				</td>
				
				<td><!-- 바로아래수정 -->
				<a href="rooms.roo?hotelnum=<c:out value="${hotel.hotelnum}"/>"        
				onclick="goRoomList('${hotel.hotelnum}')"
				 class="label label-warning"
				>룸정보 보기</a>
				</td>
			</tr>
			</c:if>
			</c:forEach>
		</tbody>	
		</table>
		</div>
		</div>
		<div class="col-md-1"></div>	
		</div>

		<br>
<%-- <center>${pageInfo.pagingHtml}</center>	 --%>


<%@ include file="./../main/main_bottom.jsp"%>   