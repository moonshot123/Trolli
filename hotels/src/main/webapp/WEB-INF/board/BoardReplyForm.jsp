<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="./../main/main_top.jsp"%>  

<title>게시판</title>
</head>
<body> 
<div class="col-md-12" >  
		<div class="col-md-2"></div>
		
		<div class="col-md-8">
		<br><br><br>
		<legend>답글 쓰기</legend>
		
		<form:form commandName="b_reply" method="post" name="writeform" action="reply.bo">
			<input type="hidden" name="ref" value="${ref}"> 
			<input type="hidden" name="restep" value="${restep}"> 
			<input type="hidden" name="relevel" value="${relevel}"> 
			<table class="table table-striped table-hover " >
				<tr class="active">
					<td width="100" align="left">이 름</td>
					<td width="330" align="left">
						<input type="hidden" size="30" maxlength="10"	name="writer" value="${loginfo.membername}">						
						<c:out value="${loginfo.membername}" />
						<form:errors cssClass="err" path="writer"/>
					</td>
				</tr>
				
				<tr class="active">
					<td width="100" align="left">제 목</td>
					<td width="330" align="left">					
						<input type="text" size="50" maxlength="50" name="subject" value="어떤글">
						<form:errors cssClass="err" path="subject"/>
					</td>
				</tr>
				
				<tr class="active">
					<td width="100" align="left">Email</td>
					<td width="330" align="left">
						<input type="text" size="50" maxlength="30"	name="email" value="aa@xx.com">
						<form:errors cssClass="err" path="email"/>
					</td>
				</tr>
				
				<tr class="active">
					<td width="100" align="left">내 용</td>
					<td width="330" align="left">
						<textarea name="content" id="abc" rows="13" cols="53">호호호</textarea>
					</td>
				</tr>
				<tr class="active">
					<td width="100" align="left">비밀번호</td>
					<td width="330" align="left">
						<input type="password" size="10" maxlength="12"	name="passwd" value="1234">
						<form:errors cssClass="err" path="passwd"/>
					</td>
				</tr>				
			</table>
	<div class="col-md-12" >  
		<div class="col-md-2"></div>	
  			<div class="form-group col-md-8">
				<div class="col-lg-10 col-lg-offset-6" align="right">					
					<input	type="submit" value="글쓰기" class="btn btn-default" >  
					<input type="reset"	value="다시작성" class="btn btn-default" > 
					<input type="button" value="목록보기"	OnClick="window.location='list.bo'" class="btn btn-default" >
					<!-- OnClick="location.href='list.jsp'" 도 가능-->
				</div>
			</div>
	</div>	
		</form:form>
	</div>
</div>	
</body>
</html>
<%@ include file="./../main/main_bottom.jsp"%>