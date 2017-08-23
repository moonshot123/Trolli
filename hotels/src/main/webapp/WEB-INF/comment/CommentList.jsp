<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>상품코멘트</title>
<%@ include file="./../main/main_top.jsp"%>
<script type="text/javascript">

function goDelete() {
	alert("정보를 삭제하겠습니다.");
	location.href='commentdelete.cmt';
}

function goUpdate(commentnum){
	alert("정보 수정 시작하겠습니다.");
	location.href='commentupdate.cmt?commentnum='+commentnum;
}


/* 아이디 찾기 */
function findid(){
	location.href='findID.mem';
}
/* 비번찾기 */
function findpw(){
	location.href='findPW.mem';
}

</script>
<style type="text/css">

details[open] summary ~ * 
{
 animation: sweep .5s ease-in-out;
}

@keyframes sweep 
{
 0%    {opacity: 0; margin-left: -10px}
 100%  {opacity: 1; margin-left: 0px}
} 

</style>
</head>
<body>
<br><br><br><br><br><br>

<div class="col-md-12">

<form class="form-horizontal" action="commentinsert.cmt">		

	
	<details align="center">
	<summary> 후&nbsp;기&nbsp;작&nbsp;성 </summary>
		<div class="col-md-1"></div>
<div class="col-md-10">
	<c:if test="${loginfo.membernum == null}">
	<table class="table table-striped table-hover ">
	<thead>
	<tr><td align="center">
	<b>로그인 후 사용하시길 바랍니다.</b><br><br>
	<a data-toggle="modal" data-target="#myModal2" class="btn btn-default">로그인</a>
	<br><br>
	</td></tr>
	</thead>
	</table>
	</c:if>
</div>
<div class="col-md-1"></div>
<div class="col-md-1"></div>
<div class="col-md-10">	
	<c:if test="${loginfo.membernum != null}">
    <input type="hidden" name="membernum" value="${loginfo.membernum}">
    <input type="text" name="hotelnum" value="${hotel.hotelnum}" placeholder="호텔번호">
	<table class="table table-striped table-hover">
  	<thead>
  	<tr>
  	<td colspan="4" align="right"><%-- <c:out value="${sum(comment.score)/count(comment)}" /> --%></td>
  	</tr>
    <tr>
    		<!-- 후기 번호, 멤버번호, 호텔번호, 후기, 평점 순 -->
    		
     		<th align="center" >아이디</th>   
			<th align="center" >후기내용</th>
			<th align="center" >평점</th>
    </tr>
  </thead>
  <tbody>
    <tr>
<%-- 				<td align="left"><c:out value="${comment.commentnum}"/></td> --%>
				<td>
				<b>${loginfo.memberid}</b>
				</td>
<%-- 				<td align="center"><c:out value="${comment.membernum}" /></td> --%>
				<td>
				<textarea rows="6" cols="120" name="comments" style="width: 100%; resize: none"
				 placeholder="Trolli 상품을 구매해주셔서 감사합니다. 회원님의 후기작성으로 보다 많은 회원님들과 정보를 공유해보세요."></textarea>
				</td>
				<td align="left">
				<div class="ratings">
				<input type="radio" name="score" value="1">&nbsp;&nbsp;<B><span class="glyphicon glyphicon-star">X1</span></B><br>
				<input type="radio" name="score" value="2">&nbsp;&nbsp;<B><span class="glyphicon glyphicon-star">X2</span></B><br>
				<input type="radio" name="score" value="3" checked="">&nbsp;&nbsp;<B><span class="glyphicon glyphicon-star">X3</span></B><br>
				<input type="radio" name="score" value="4">&nbsp;&nbsp;<B><span class="glyphicon glyphicon-star">X4</span></B><br>
				<input type="radio" name="score" value="5">&nbsp;&nbsp;<B><span class="glyphicon glyphicon-star">X5</span></B>
					
				</div>
				</td>	
	</tr> 
	<tr>
			<td colspan="3">
				<input type="submit" value="후기작성" class="btn btn-default btn-block">
			</td>
			
	</tr> 
		
  </tbody>
</table>
</c:if>
</div><!-- col-md-10 -->
<div class="col-md-1"></div>
	</details>	


	
	
</form>	
	</div><!-- col-md-12 -->

	
 	<div class="col-md-12">
 	<div class="col-md-1"></div>
 	<div class="col-md-10">
 	<fieldset>
	<legend>방문 후기</legend>
 	
	<table class="table table-striped table-hover ">
  	<thead>
  	<tr>
  	<td colspan="5" align="right"><%-- <c:out value="${sum(comment.score)/count(comment)}" /> --%></td>
  	</tr>
    <tr>
    		<!-- 후기 번호, 멤버번호, 호텔번호, 후기, 평점 순 -->
     		<th align="center" width="30">번 호</th>
     		<th align="center" width="30">호텔 번호</th>   
			<th align="center" width="30">회원 번호</th>
			<th align="center" width="200">회원 후기</th>
			<th align="right" width="50">평 점</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${commentLists}" var="comment">
  
    <tr>
			
				<td align="center"><c:out value="${comment.commentnum}"/></td>
				<td align="center"><c:out value="${comment.hotelnum}"/></td>
				<td align="center"><c:out value="${comment.membernum}" /></td>
				<td align="left">
				<details>
				<summary><c:out value="${comment.comments}" /></summary>
				<div class="col-md-1"></div>
				<div class="col-md-10">
				<table class="col-md-12">
				<tbody>
				<tr class="col-md-12">
				<td>
				<br>
				</td>
				</tr>
				<tr class="col-md-12"><td><c:out value="${comment.comments}" />
				</td></tr>
				<tr class="col-md-12">
				<td>
				<br><br>
				</td>
				</tr>
				<tr class="col-md-12" align="right"><td >
				<c:if test="${loginfo.membernum eq comment.membernum || loginfo.logincheck eq '1'}">
				<a href="commentupdate.cmt?commentnum=<c:out value="${comment.commentnum}"/>"
				onclick="goUpdate('${comment.commentnum}','${pageInfo.pageNumber}','${pageInfo.pageSize}')" class="label label-success">수정하기</a>
				<a href="commentdelete.cmt?commentnum=<c:out value="${comment.commentnum}"/>" 
				onclick="goDelete()"class="label label-danger">삭제하기</a>
				</c:if>
				</td></tr>
				</tbody>
				</table>
				
				</div>
				<div class="col-md-1"></div>		
				</details>
				</td>
				<td align="left">
				<div class="ratings">
				<B><span class="glyphicon glyphicon-star">X</span>
				<c:out value="${comment.score}" /></B>
				</div> 
				</td>			
	</tr>
	
	</c:forEach> 

  </tbody>
</table> 

	<br>
	<center>${pageInfo.pagingHtml}</center>
	</fieldset>
	</div>
	<div class="col-md-1"></div>
</div>


<!-- 로그인 모달입니다. -->
<form action="login2.mem" method="POST">
		<div class="modal fade" id="myModal2" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h3 class="modal-title">Welcome !</h3>
						<h5>Trolli 에서 마음에 드는 숙소를 최저가로 예약해보세요.</h5>
					
					</div>
					<div class="modal-body"> 
					<table>
					<tr>
					<td>ID :</td>
					<td><input type="text" class="form-control" name="memberid"></td>
					</tr>
						<tr>
						<td>PassWord :</td>
						<td><input type="password" class="form-control" name="memberpw"></td>
					</table>
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-default" value="로그인">
						
						<button type="button" class="btn btn-default" onclick="findid()">아이디 찾기</button>
						<button type="button" class="btn btn-default" onclick="findpw()">비밀번호 찾기</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</form>



</body>
</html>
<%@ include file="./../main/main_bottom.jsp"%>