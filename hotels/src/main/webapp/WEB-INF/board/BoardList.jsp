<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="./../main/main_top.jsp"%>
    
<script type="text/javascript">
	function insert(pageNumber){
		/* alert("로그인후 사용하세요"); */
			location.href="insert.bo?pageNumber="+pageNumber;
		}	
</script>
</head>
<body>
<br><br><br>
	<c:set value="${pageContext.request.localPort}" var="port"/>
	<c:set value="${pageContext.request.contextPath}" var="path"/>	
	<c:set value="http://localhost:${port}${path}/resources/images/hot.gif" var="hot"/>
	<c:set value="http://localhost:${port}${path}/resources/images/level.gif" var="level"/>
	<c:set value="http://localhost:${port}${path}/resources/images/re.gif" var="re"/>

<form class="col-md-12 form-horizontal">
<center><img src="resources/images/qa.png"></center>
	<div class="col-md-2"></div>
  <fieldset class="col-md-8">
  
    <legend>고객 문의</legend>
</fieldset>
	<div class="col-md-2"></div>
</form>    
	
	
<div class="col-md-12">
<br>
 <div class="col-md-2"></div> 
	
<div class="col-md-8" >
	<form action="list.bo" method="get" class="navbar-form navbar-right" role="search">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<select name="whatColumn" class="form-control">
				<option value="all" >전체 검색</option>
				<option value="writer">작성자</option>
				<option value="subject">제목</option>
			</select> 
			<input type="text" name="keyword" class="form-control" value="이름"> 
			&nbsp;
			<input type="submit" value="검색하기" class="btn btn-default" >
	
	</form>
</div>
	
<div class="col-md-2"></div>
</div>

<div class="col-md-12">
<div class="col-md-2"></div>
<div class="col-md-8">	
	<table class="table table-striped table-hover ">
  	<thead>
    <tr>
    
     		<td align="center" width="50">번 호</td>   
			<td align="center" width="250">제 목</td>
			<td align="center" width="100">작성자</td>
			<td align="center" width="150">작성일</td>
			<td align="center" width="50">조회수</td>
			<!-- <td align="center" width="100">IP</td>	 -->		
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${b_Lists}" var="board" varStatus="status">
    <tr>
				<td align="center">
					${(pageInfo.totalCount-(pageInfo.pageNumber-1)*pageInfo.pageSize)-status.index}
				</td>
				<td align="left">
					<c:if test="${board.relevel > 0}">
						<c:set var="wid" value="${20*board.relevel}"/>
						<img src="${level}" width="${wid}" height="16">
						<img src="${re}">
					</c:if>
					<c:if test="${board.relevel < 0}">
						<img src="${level}" width="${wid}" height="16">
					</c:if>
					<a href="detail.bo?num=${board.num}&pageNumber=${pageInfo.pageNumber}">${board.subject}</a>
					<c:if test="${board.readcount > 10 }">
						<img src="${hot}" border="0" height="16">
					</c:if>
				</td>
				<td align="center"><c:out value="${board.writer}" /></td>
				<td align="center"><c:out value="${board.regdate}" /></td>
				<td align="center"><c:out value="${board.readcount}" /></td>
				<%-- <td align="center"><c:out value="${board.ip}" /></td> --%>
			
	</tr> 
	</c:forEach> 
	<tr>
	<td colspan="8" align="right">
	<input type="button" value="글쓰기" onclick="insert(${pageInfo.pageNumber})" class="btn btn-default btn-xs">
	
	</td>	
	</tr> 
  </tbody>
</table> 

	<br>
	<center>${pageInfo.pagingHtml}</center>
</div>	
<div class="col-md-2"></div>
</div>

</body>
</html>
<%@ include file="./../main/main_bottom.jsp"%>