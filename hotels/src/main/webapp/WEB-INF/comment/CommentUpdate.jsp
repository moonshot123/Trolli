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
	<form action="commentupdate2.cmt">
	  	<div class="col-md-12" >  
		<div class="col-md-2"></div>
		
		<div class="col-md-8">
			<br><br><br>			
			<legend><b>후기수정</b></legend>
			<input type="hidden" name="commentnum" value="${comment.commentnum}">
			<input type="hidden" name="hotelnum" value="${comment.hotelnum}">
    		<input type="hidden" name="membernum" value="${comment.membernum}">
			<table class="table table-striped table-hover ">
			
			  <thead>
			  
			    <tr>
			      <th>ID</th>
			      <th>후기내용</th>
			      <th>평점</th>
			    </tr>
			  </thead>
			  <tbody>
			  	
			     <tr class="active">
			     <td>
			     ${loginfo.memberid}
			     </td>	
			    
			       <td>
			       	<textarea name="comments" cols="100" rows="5"><c:out value="${comment.comments}" /></textarea>
			       </td>	
			
			    
			 
			       <td>
			       	<div class="ratings">
					<input type="radio" name="score" value="1" <c:if test="${comment.score eq '1'}">checked</c:if>>
					&nbsp;&nbsp;<B><span class="glyphicon glyphicon-star">X1</span></B><br>
					<input type="radio" name="score" value="2" <c:if test="${comment.score eq '2'}">checked</c:if>>
					&nbsp;&nbsp;<B><span class="glyphicon glyphicon-star">X2</span></B><br>
					<input type="radio" name="score" value="3" <c:if test="${comment.score eq '3'}">checked</c:if>>
					&nbsp;&nbsp;<B><span class="glyphicon glyphicon-star">X3</span></B><br>
					<input type="radio" name="score" value="4" <c:if test="${comment.score eq '4'}">checked</c:if>>
					&nbsp;&nbsp;<B><span class="glyphicon glyphicon-star">X4</span></B><br>
					<input type="radio" name="score" value="5" <c:if test="${comment.score eq '5'}">checked</c:if>>
					&nbsp;&nbsp;<B><span class="glyphicon glyphicon-star">X5</span></B>
					</div>
			       </td>
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
					<a href="javascript:history.go(-1)" class="btn btn-default">돌아가기</a>
					
				</div>
			</div>
	</div>
	</form>

</body>
</html>
<%@ include file="./../main/main_bottom.jsp"%>