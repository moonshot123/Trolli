<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="./../common/common.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
<form action="search.hot" method="post" name="scform">

		<div id="video">
		<video loop muted autoplay id="video_detail" > 
		<source src="resources/main_images/tkorea2017.mp4" type="video/mp4">
		</video>
	
	    <div id="search">
		
		<br><br><br>
		
		<div class="form-group" >
		<table id="search_formation" class="col-md-4" >
		
		<tr>
		<th>
		<br>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<label class="text-trolli" style="font-weight: bold;">여행지</label>
		
		</th>
		</tr>
		<tr>
		
		<td class="col-md-3">
		
		<input type="text" name="search_p" class="form-control" placeholder="도시 또는 호텔명을 검색해 보세요." style="width: 420px;">
		<input type="hidden" name="sort" value="0">
		</td>
		</tr>
		
		<tr>
		<th>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<label class="text-trolli" style="font-weight: bold;">체크인</label>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;
		
		<label class="text-trolli" style="font-weight: bold;">체크아웃</label>
		</th>
		</tr>
		
		<tr>
		<td class="col-md-3">
		
		<!-- 출발/도착날짜 -->
		
		
		<input type="text" name="searchStart" value="${Dday}" id="datePicker" class="form-control" style="width: 210px;float: left;">
		<input type="text" name="searchEnd" value="${nextday }" id="datePicker2" class="form-control" style="width: 210px;float: left;" > 
		<%-- <c:if test="${Dday > nextday}">
		체크아웃 날짜가 체크인 날짜보다 이후인지 확인하세요.
		<script type="text/javascript">
		
		
		
		</script>
		</c:if> --%>
		
		</td>
		</tr>
		
		<tr>
		<th>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<label class="text-trolli" style="font-weight: bold;">객실</label>
		</th>
		</tr>
		
		<tr>
		<td class="col-md-3">
		
		<select class="form-control" name=roompeople style="width: 210px;float: left;">
			<option value="0">선택</option>
			<option value="1">1명</option>
			<option value="2">2명</option>
			<option value="3">가족</option>
			<option value="4">단체</option>
		</select> 
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" class="btn btn-success" value="검색하기" style="width: 150px;">
		<br><br><br>
		</td>
		</tr>
		
		</table>
		
	</div><!--form-group -->
	
	</div><!-- search -->
</div><!-- 비디오 -->	
	</form>