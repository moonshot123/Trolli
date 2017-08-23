<%@ page contentType="text/html; charset=UTF-8"%>

<html>
<head>
<title>게시판</title>
<%@ include file="./../main/main_top.jsp"%> 
</head>
<br><br><br>
<body>  

<br>
<div class="col-md-12" >  
		<div class="col-md-2"></div>
		
		<div class="col-md-8">
		<br><br><br>
		<legend>문의글 작성하기</legend> 
		
		<form:form commandName="b_insert" method="post" name="writeform" action="insert.bo"> 
			<table class="table table-striped table-hover " >
				<tr class="active">
					<td width="100" align="center">이 름</td>
					<td width="330" align="left">
						<input type="hidden" size="30" maxlength="10"	name="writer" value="${loginfo.membername}">						
						<c:out value="${loginfo.membername}" />
						<form:errors cssClass="err" path="writer"/>
					</td>
				</tr>
				
				<tr class="active">
					<td width="100" align="center">제 목</td>
					<td width="330" align="left">					
						<input type="text" size="50" maxlength="50" name="subject" value="어떤글">
						<form:errors cssClass="err" path="subject"/>
					</td>
				</tr>
				
				<tr class="active">
					<td width="100" align="center">Email</td>
					<td width="330" align="left">
						<input type="text" size="50" maxlength="30"	name="email" value="aa@xx.com">
						<form:errors cssClass="err" path="email"/>
					</td>
				</tr>
				
				<tr class="active">
					<td width="100" align="center">내 용</td>
					<td width="330" align="left">
						<textarea name="content" id="abc" rows="13" cols="53">호호호</textarea>
					</td>
				</tr>
				<tr class="active">
					<td width="100" align="center">비밀번호</td>
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


