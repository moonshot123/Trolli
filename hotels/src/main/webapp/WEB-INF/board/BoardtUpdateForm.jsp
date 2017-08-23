<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="./../main/main_top.jsp"%>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" name="writeform" action="update.bo">
	  	<div class="col-md-12" >  
		<div class="col-md-2"></div>
		
		<div class="col-md-8">
		<br><br><br>			
			<legend>글수정</legend>
			<input type="hidden" name="num" value="${board.num}">
			<input type="hidden" name="num" value="${board.num}">
			<table class="table table-striped table-hover ">
			
			  <thead>
			  
			    <tr>
			      <th></th>
			      <th></th>
			    </tr>
			  </thead>
			  <tbody>
			  	 <tr class="active">
			      <td>글제목</td>
			      <td><input type="text" name="subject" value="${board.subject}" ></td>			     
			    </tr>
			  	
			     <tr class="active">
			      <td>작성자</td>
			     <td><input type="hidden" name="writer" value="${board.writer}" ><c:out value="${board.writer}" /></td>	
			    </tr>
			    
			     <tr class="active">
			      <td>작성일</td>
			     <td><input type="hidden" name="regdate" value="${board.regdate}" ><c:out value="${board.regdate}"/></td>	
			    </tr>
			    
			    <tr class="active">
			      <td>내용</td>
			       <td>
			       	<textarea name="content" id="abc" rows="13" cols="50">${board.content}</textarea>
			       </td>	
			    </tr>  
			      <tr class="active">
			      <td>패스워드</td>
			       <td><input type="password" name="passwd" value="${board.passwd}" ></td>	
			    </tr>
						    
			  </tbody>
			</table> 
			
		</div>
	</div>
	
	<div class="col-md-12" >  
		<div class="col-md-2"></div>
	
  			<div class="form-group col-md-8">
				<div class="col-lg-10 col-lg-offset-2" align="right">					
					<input type="submit" value="글수정" class="btn btn-default"> 
					<input type="reset"	value="다시작성" class="btn btn-default">
					<button class="btn btn-default" type="button" OnClick="window.location='list.bo'">목록보기</button>
					
				</div>
			</div>
	</div>
	</form>

</body>
</html>
<%@ include file="./../main/main_bottom.jsp"%>