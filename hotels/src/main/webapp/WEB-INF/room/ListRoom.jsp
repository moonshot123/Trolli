<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../main/main_top.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>룸 리스트 페이지</title>

<script type="text/javascript">
	
	function insert(hotelnum) {
		alert("정보 입력 시작하겠습니다.");
		location.href='insertRoom.roo?hotelnum='+hotelnum;  
	}
	
	
	function goDelete(hotelnum) {
		alert("정보를 삭제하겠습니다.");
		alert(hotelnum);
		location.href='deleteRoom.roo';
	}
	
	
	function goUpdate(num){
		alert("정보 수정 시작하겠습니다.");
		location.href='updateRoom.roo?roomnum='+num;
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
	<img src="resources/images/Room-icon.png" alt="룸아이콘이미지" width="100px" />
<br><br>
<legend>객실리스트 및 추가하기</legend>

</div>


	
	<div class="col-md-12" align="center">		
	<table class="table table-striped table-hover ">
	  <thead>
	 
			<tr>
				<td colspan="7" align="right">
				<input type="button" value="추가하기" onclick="insert('${hotelnum }')" class="btn btn-primary btn-xs">
				</td>
			</tr>
	 
			<tr align="center">
				<th><span>호텔번호&nbsp;&nbsp;</span></th>
				<th><span>객실번호&nbsp;&nbsp;</span></th>
				<th><span>객실이름&nbsp;&nbsp;</span></th>
				<th><span>객실크기&nbsp;&nbsp;</span></th>
				<th><span>수용인원&nbsp;&nbsp;</span></th>
				
				<th><span>수정&nbsp;&nbsp;</span></th>
				<th><span>삭제&nbsp;&nbsp;</span></th>
				
			</tr>
	</thead>
	 <tbody>
			<!-- hotelListController에서 hotelLists 가져온다. -->
			<c:forEach items="${roomLists}" var="room">
			<tr>
				<td><c:out value="${room.hotelnum}"/></td>
				<td>
				<c:out value="${room.roomnum}"/>
				</td>
				<td><c:out value="${room.roomname }"/></td>
				<td><c:out value="${room.roomsize }"/></td>
				<td><c:out value="${room.roompeople }"/></td>
				
				<td>
				<a href="updateRoom.roo?roomnum=<c:out value="${room.roomnum}"/>"
				onclick="goUpdate('${room.hotelnum}','${pageInfo.pageNumber}','${pageInfo.pageSize}')"
				 class="label label-success"
				>수정하기</a>
				</td>
				<td>
				<a href="deleteRoom.roo?roomnum=<c:out value="${room.roomnum}"/>" 
				onclick="goDelete('${room.hotelnum}')"class="label label-danger">삭제하기</a>
				</td>
			</tr>
			</c:forEach>
		</tbody>	
		</table>
		<%-- <center>${pageInfo.pagingHtml}</center> --%>
		<div class="form-group" >
      <div class="col-lg-10 col-lg-offset-2" align="right">
        <a href="hotellist.hot"  onclick="goHotelList()" class="btn btn-default">호텔리스트로 돌아가기</a>	
      </div>
    </div>
		</div>
		</div>
		<div class="col-md-1"></div>	
		</div>
		
		<br>
	

<%@ include file="./../main/main_bottom.jsp"%>  
