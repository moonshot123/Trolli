<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="./../main/main_top.jsp"%>  
<head>
<title>게시판</title>

<script type="text/javascript">
	function goDelete() {
		/* alert("여긴 오나"); */
		location.href = "delete.bo?num=<c:out value="${board.num}" />";
	}
	function goUpdate() {
		/* alert("여긴 오나"); */
		location.href = "update.bo?num=<c:out value="${board.num}" />";
	}
</script>
<body>  
  	<div class="col-md-12" >  
		<div class="col-md-2"></div>
		
		<div class="col-md-8">
			<br><br><br>			
			<legend>작성내용</legend>
					
			<table class="table table-hover ">
			  <input type="hidden" name="num" value="${board.num}">
			  <%-- <input type="text" name="num" value="${board.num}"> --%>
			  
			 
			  <tbody>
			  	 <tr class="active">
			      <td>글제목</td>
			      <td><c:out value="${board.subject}" /></td>
			    </tr>
			  	
			     <tr class="active">
			      <td>작성자</td>
			      <td><c:out value="${board.writer}" /></td>
			    </tr>
			    
			     <tr class="active">
			      <td>작성일</td>
			      <td><c:out value="${board.regdate}" /></td>
			    </tr>
			    
			     <tr class="active">
			      <td>내용</td>
			       <td><c:out value="${board.content}" /></td>			       			     
					<tr class="active">
			      <td>비밀번호</td>
			      <td>
			      		<c:out value="비밀번호가 일치해야만 글수정을 할수 있습니다 " />
			      </td>
			    </tr>
			    </tr>			    
			  </tbody>
			</table> 
		
		</div>
	</div>
	
	<div class="col-md-12" >  
	   <div class="col-md-2"></div> <!-- 이건 간격띄우기 위해서 혼자 묶은거 주의 바람 -->
	
  			<div class="form-group col-md-8">
				<div class="col-lg-10 col-lg-offset-2" align="right">						
				<%-- <c:if test="${loginfo.membername eq board.writer || loginfo.membername eq '강철수'}">
					<button class="btn btn-default" type="button" onclick="goUpdate('${board.num}')">수 정</button>
					<input type="button" value="답글쓰기" class="btn btn-default" onclick="document.location.href='reply.bo?num=${board.num}&ref=${board.ref}&restep=${board.restep}&relevel=${board.relevel}'">
					<button class="btn btn-default" type="button" OnClick="goDelete('${board.num}')">삭 제</button>
				</c:if>
					<button class="btn btn-default" type="button" OnClick="window.location='list.bo'">목록보기</button>	 --%>
			<c:choose>
               <c:when test="${loginfo.membername eq board.writer || loginfo.logincheck eq '1'}">
               <button class="btn btn-default" type="button" onclick="goUpdate('${board.num}')">수 정</button>
               <input type="button" value="답글쓰기" class="btn btn-default" onclick="document.location.href='reply.bo?num=${board.num}&ref=${board.ref}&restep=${board.restep}&relevel=${board.relevel}'">
               <button class="btn btn-default" type="button" OnClick="goDelete('${board.num}')">삭 제</button>
               <button class="btn btn-default" type="button" OnClick="window.location='list.bo'">목록보기</button>               
               </c:when>
               
               <c:when test="${!(loginfo.membername eq null)}">
               <%-- <button class="btn btn-default" type="button" onclick="goUpdate('${board.num}')">수 정</button> --%>
               <input type="button" value="답글쓰기" class="btn btn-default" onclick="document.location.href='reply.bo?num=${board.num}&ref=${board.ref}&restep=${board.restep}&relevel=${board.relevel}'">
               <%-- <button class="btn btn-default" type="button" OnClick="goDelete('${board.num}')">삭 제</button> --%>
               <button class="btn btn-default" type="button" OnClick="window.location='list.bo'">목록보기</button>               
               </c:when>
               <c:otherwise>
                  
               <button class="btn btn-default" type="button" OnClick="window.location='list.bo'">목록보기</button>
               </c:otherwise>
            </c:choose>
				</div>
			</div>
	</div>
	
</body>
</html>


</body>
</html>
<%@ include file="./../main/main_bottom.jsp"%>
