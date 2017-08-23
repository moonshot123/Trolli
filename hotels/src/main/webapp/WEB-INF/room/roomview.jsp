<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="./../main/main_top.jsp" %>
<br><br><br><br>

<div class="container">
	<div class="row">
		<div class="col-md-12">
		<!-- 상세보기 메인이미지 -->
         <div class="col-md-8" style="padding-left : 0px; padding-right: 4px; height:447px;">
         	<div class="col-md-12 container2" style="padding: 0px; height:447px;">
         		<img  src="resources/${hotel.hotelimg1 }" style="width:100%; height:447px;" alt=""/>
         	<div class="dark-overlay" style="width:100%; ">
         		<a data-toggle="modal" data-target="#myHotel">
         			<img style="width:100%; height:447px; " alt="">
         				<div class="text">${hotel.hotelname}<br>
         				<div style="font-size: 12px; color:#198DEB;">더보기</div>
         				</div>
         			</img>
         		</a>
         		
         	</div>
         	</div>
         </div>
       
         <!-- 상세보기 옆  후기보기 -->
         <div class="col-md-4" >
         	<div class="col-md-12 container2"  style="padding-left : 4px;">
         	<center>
         		<img src="resources/images/wishicon.png" style="width:100%; height:220px;" alt=""/>
         	</center>
         	<div class="dark-overlay" style="width:100%; height:220px;">
         		<a data-toggle="modal" data-target="#mlocation" >
         		<img style="width:100%;"/>
	         	<div class="text" style="position:absolute; left : 32%;  bottom:90px;">평점 ${hotel.hotelscore} 점<br>
	         	<span style=" position:absolute; width:120px; font-size : 18px;right:1px;">(총점 5점)</span>
				</div>
         		</img>
         		</a>
         		<div class="text"></div>
         	</div>
         	</div>
            	
            <div class="col-md-12 container2" style="padding-left : 4px;">
            <center>
            	<img src="resources/images/commentlogo.jpg" style="width:100%; height:220px;" alt=""/>
			</center>
			<div class="dark-overlay" style="width:100%; height:218px; ">
				<a href="#commentform">
            		<img style="width:100%;"/>
            	 		<div class="text" style="position:absolute; left :32%; bottom:90px;">후기보기<br></div>
            		</img> 
            	</a>
            	<div class="text"></div>
            </div>
            </div>
		</div>
		</div>
	</div><!-- row_1 -->
	<br>
	<div>
		
		<%-- <marquee width="100%" behavior=alternate direction="RIGHT" >
		<h3 style="color: black; font-weight: bold;">
		<span>▣&nbsp;</span>${hotel.hotelproduce1 }&nbsp;&nbsp;&nbsp;
		<span>▣&nbsp;</span>${hotel.hotelproduce2 }&nbsp;&nbsp;&nbsp;
		<span>▣&nbsp;</span>${hotel.hotelproduce3 }&nbsp;&nbsp;&nbsp;
		<span>▣&nbsp;</span>${hotel.hotelfacility }&nbsp;&nbsp;&nbsp;
		</h3>
		</marquee> --%> 
		<div class="alert alert-dismissible alert-success">
  		<button type="button" class="close" data-dismiss="alert">&times;</button>
  		<img src="resources/images/pointers.jpg" width="25px;">&nbsp;&nbsp;<b>${hotel.hotelproduce1 }</b>&nbsp;&nbsp;&nbsp;
		<img src="resources/images/pointers.jpg" width="25px;">&nbsp;&nbsp;<b>${hotel.hotelproduce2 }</b>&nbsp;&nbsp;&nbsp;
		<img src="resources/images/pointers.jpg" width="25px;">&nbsp;&nbsp;&nbsp;&nbsp;<b>${hotel.hotelproduce3 }</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<img src="resources/images/pointers.jpg" width="25px;">&nbsp;&nbsp;<b>위치 : ${hotel.hoteladdr }</b>&nbsp;&nbsp;&nbsp;
		</div>
		</div>
		<br>
		<div class="alert alert-dismissible alert-warning">
  		<button type="button" class="close" data-dismiss="alert">&times;</button>
  		<h3><img src="resources/images/Lease-Advisory.png" width="50px;">&nbsp;시설안내</h3>
  		<br>
  		<p><b>&nbsp;&nbsp;${hotel.hotelfacility }</b></p>
		</div>
	
	
	<!-- 위시리스트  -->

     <script type="text/javascript">
     function wish(){
 		alert("위시리스트로 이동합니다.");
 		location.href='favorate.fav';
 		}
     </script>
     
 		<div class="row col-md-12" align="right">
 		<c:if test="${loginfo.membernum == null}"> 
			<a data-toggle="modal" data-target="#myModal4" class="label label-default">관심상품보기</a><Br>		
		</c:if>
		<c:if test="${loginfo.membernum != null}">
		<form class="form-horizontal" action="favorateinsert.fav">
 			<input type="hidden" id="membernum" name="membernum" value="${loginfo.membernum}">
     		<input type="hidden" id="hotelnum" name="hotelnum" value="${hotel.hotelnum}">
     		<input type="hidden" id="hotelname" name="hotelname" value="${hotel.hotelname}">
     		<input type="hidden" id="hotelimg1" name="hotelimg1" value="${hotel.hotelimg1}">
     		<input type="hidden" id="hotelscore" name="hotelscore" value="${hotel.hotelscore}">
     		<a data-toggle="modal" data-target="#myModal3" class="label label-default">관심상품보기</a><br><br>
     		<marquee behavior=alternate width="140" scrollamount="3">
     		<input type="submit" value="관심상품으로 등록" class="btn btn-success btn-xs" >
     		</marquee>
     	</form>
     	</c:if>
     	<Br>
     	</div>  
	
	<div class="row">
  		<table class="table" >
  		<c:forEach items="${roomLists}" var="room">
  			<tr style="font-weight :bold; background-color:#F2F2F2;"> 
  				<td width="30%" align="center">객실사진</td>
  				<td width="40%" align="center">객실안내</td>
  				<td width="10%" align="center">수용인원</td>
  				<td width="10%" align="center">가격</td>
  				<td width="10%" align="center"></td>
  			
  			<tr>
			
  			<tr height="200" style="padding-bottom:50px;" >
  				<td style="padding : 5px; vertical-align : middle;">
	        		<a href="modal-1">
	            		<img class="img-responsive img-hover" src="resources/${room.roomimg1 }" alt="">
	          		</a>
	          	</td>
        		<td>
        		
   <div>
  <div class="panel-heading">
    <h3 class="panel-title">
    <span style="font-weight : bold;color: #E91545;"> ${room.roomname }</span>
    </h3>
  </div>
  <div class="panel-body">
    <h4>
	            	<ul class="list-group">
		            	 <li class="list-group-item">${room.roomproduce1 }
		            	 <li class="list-group-item">${room.roomproduce2 }
		            	<li class="list-group-item">${room.roomproduce3 }
		            </ul>
		            </h4>
  </div>
</div>
        		
			    	<%-- <p style="font-weight : bold; font-size: 25px; color: #E91545;"> ${room.roomname }</p>
			    	<Br>
			    	<h4>
	            	<ul class="list-group">
		            	 <li class="list-group-item">${room.roomproduce1 }
		            	 <li class="list-group-item">${room.roomproduce2 }
		            	<li class="list-group-item">${room.roomproduce3 }
		            </ul>
		            </h4> --%>
		        </td>
				<td align="center" style="vertical-align : middle;">
            		${room.roompeople }
            	</td>
				<td align="center" style="vertical-align : middle;">
            		${room.roomprice }
            	</td>
    			<td align="center" style="vertical-align : middle;" >
    			
    			<c:if test="${loginfo.membernum == null}">
				<table class="table table-striped table-hover">
				<thead>
				<tr><td align="center">
					<b>로그인 후 사용하시길 바랍니다.</b><br><br>
					<a data-toggle="modal" data-target="#myModal2" class="btn btn-default">로그인</a>
					<br><br>
					</td>
				</tr>
				</thead>
				</table>
				</c:if>
    			
    			<c:if test="${loginfo.membernum != null}">
  	            	<a class="btn btn-primary" href="orderpage.ord?roomnum=${room.roomnum }&searchStart=${searchStart }&searchEnd=${searchEnd }">예약하기<i class="fa fa-angle-right"></i></a>
                </c:if>
                </td>
	    	</tr>
		    </c:forEach>
    	</table>
    </div >
    <br><br>
    <hr id="commentform">
    <br><br>


<!-- 후기 시작 -->    
    
    <div class="row" >
	<form id="myform" class="form-horizontal" action="room.roo">		
		<details align="center">
		<summary><marquee behavior=alternate width="150" scrollamount="3">후&nbsp;기&nbsp;작&nbsp;성</marquee></summary>
		
		<div class="col-md-12">
		<c:if test="${loginfo.membernum == null}">
			<table class="table table-striped table-hover">
			<thead>
				<tr><td align="center">
					<b>로그인 후 사용하시길 바랍니다.</b><br><br>
					<a data-toggle="modal" data-target="#myModal2" class="btn btn-default">로그인</a>
				<br><br>
					</td>
				</tr>
			</thead>
			</table>
		</c:if>
		</div>
		
		
		<div class="col-md-12">	
		<c:if test="${loginfo.membernum != null}">
			<input type="hidden" name="hotelnum" value="${hotelnum}">	
		    <input type="hidden" name="membernum" value="${loginfo.membernum}">
		    
		   <%--  <input type="text" name="hotelnum" value="${hotel.hotelnum}" placeholder="호텔번호"> --%>
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
						<textarea rows="6" cols="120" id="comments" name="comments" style="width: 100%; resize: none"
						 placeholder="Trolli 상품을 구매해주셔서 감사합니다. 회원님의 후기작성으로 보다 많은 회원님들과 정보를 공유해보세요."></textarea>
					</td>
					<td align="left">
						<div class="ratings">
							<input type="radio" id="score" name="score" value="1">&nbsp;&nbsp;<B><span class="glyphicon glyphicon-star">X1</span></B><br>
							<input type="radio" id="score" name="score" value="2">&nbsp;&nbsp;<B><span class="glyphicon glyphicon-star">X2</span></B><br>
							<input type="radio" id="score" name="score" value="3" checked>&nbsp;&nbsp;<B><span class="glyphicon glyphicon-star">X3</span></B><br>
							<input type="radio" id="score" name="score" value="4">&nbsp;&nbsp;<B><span class="glyphicon glyphicon-star">X4</span></B><br>
							<input type="radio" id="score" name="score" value="5">&nbsp;&nbsp;<B><span class="glyphicon glyphicon-star">X5</span></B>
					</div>
					</td>	
				</tr> 
				<tr>
					<td colspan="3">
					
						<input type="button" value="후기작성" class="btn btn-default btn-block" 
							onclick="commentinsert('${loginfo.membernum}','${hotelnum}','${hotelscore}');" >
					</td>
				
				</tr> 
		
 			</tbody>
			</table>
		</c:if>
		</div><!-- col-md-10 -->
		
		</details>	
	</form>	
	</div><!-- col-md-12 -->
	
 	<div class="col-md-12">
 	<br><br>
 		
 	
 	<div class="col-md-12">
 	<fieldset>
	<legend style="font-weight :bold;">고객이용 후기</legend>
 	
		<table class="table table-striped table-hover ">
  		<thead>
  			<tr>
  				<td colspan="5" align="right"><%-- <c:out value="${sum(comment.score)/count(comment)}" /> --%></td>
  			</tr>
   			<tr>
    		<!-- 후기 번호, 멤버번호, 호텔번호, 후기, 평점 순 -->
     			<th style="align:center;" width="30">후기 번호</th>
     			<th style="align:center;" width="30">고유번호</th>
     			
     			<th style="align:center;" width="30">호텔 번호</th>
				<th style="align:center;" width="30">회원 번호</th>
				<th style="align:center;" width="200">회원 후기</th>
				<th style="align:center;" width="50">평 점</th>
   			</tr>
  		</thead>
  		<tbody>
  		<c:forEach items="${commentLists}" var="comment">
  <%-- 		<c:out value="${hotelnum}"/>
  		<c:out value="${comment.hotelnum}"/> --%>
  		<c:if test="${hotelnum eq comment.hotelnum}">
      		<tr>
				<td align="center"><c:out value="${comment.rownum}"/></td>
				<td align="center"><c:out value="${comment.commentnum}"/></td>
				<td align="center"><c:out value="${comment.hotelnum}"/></td>
				<td align="center"><c:out value="${comment.membernum}" /></td>
				<td align="left">
				<details>
				<summary><c:out value="${comment.comments}" /></summary>
				
				<div class="col-md-12">
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
					<tr class="col-md-12" align="right">
						<td >
						<c:if test="${loginfo.membernum eq comment.membernum || loginfo.logincheck eq '1'}">
						
							<a href="commentdelete.roo?commentnum=<c:out value="${comment.commentnum}"/>&hotelnum=${hotelnum}" 
								class="label label-danger">삭제하기</a>
							
						</c:if>
						</td>
					</tr>
				</tbody>
				</table>
				</div>
				
				</details>
				</td>
				<td align="left">
					<div class="ratings">
					<B><span class="glyphicon glyphicon-star">X</span>
					<c:out value="${comment.score}" /></B>
					</div> 
				</td>			
			</tr>
			</c:if>
		</c:forEach> 
		</tbody>
	</table> 
	<br>
	<center>${pageInfo.pagingHtml}</center>
	</fieldset>
	</div>
	
	
</div>
<!-- 후기 끝 -->

<!-- 로그인 모달입니다. -->
	<form action="login2.mem" method="POST">
		<input type="hidden" value="${hotelnum}" name="hotelnum">
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
</div>


<!-- hotel image modal -->
<!-- absolute에서 fixed 변경  -->
<div class="row">
<div class="modal fade1 col-md-11" id="myHotel"  style="position: fixed; height:777px; left : 60px; background-color:black; opacity:0.9; ">
	<br><br>
	<div class="content" >
	
		<div class="col-md-12" >
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="color: white; font-size: 40px;">&times;</button>
			<center style="font-size: 40px; color:#F2F2F2; font-weight: bold;">${hotel.hotelname}</center>
			
		</div>
	<!-- </div> -->
		
		<div class="body col-md-12" style="height : 500px; "> 
			
			<div id="image"style="height: 500px; position:relative;  top:50px;left: 32%; ">
			
			<table>
			<Tr>
			<Td><img class="img-action" src="resources/${hotel.hotelimg1 }" style="position:absolute;width: 500px; height: 400px;"/></Td>
			</Tr>
			</table>
			
			</div>
			
		</div>
		<!-- <hr style="left:15px; right:15px;"> -->
		<div class="footer">
			<div class="total-image">
			<marquee width="100%" direction="RIGHT">
					<div class="col-md-3 thumbnail active" style="position : relative; width:90px; height:70px; background:black;">
						<c:set var="carouselnum" value="${carouselnum}"/>
						<a onclick="thumbnail('${hroomLists.hotelimg1}');">
							<img src="resources/${hroomLists.hotelimg1}" style="width:80px; height:60px; display: block; padding:0; margin: 0 auto;">
						</a>
						
					</div>
					<c:if test="${hroomLists.hotelimg2 != null }">
					<div class="col-md-3 thumbnail" style="position : relative; width:90px; height:70px; background:black;">
						<c:set var="carouselnum" value="${carouselnum+1}"/>
						<a onclick="thumbnail('${hroomLists.hotelimg2}');">
							<img src="resources/${hroomLists.hotelimg2}" style="width:80px; height:60px; display: block; padding:0; margin: 0 auto;">
						</a>
					</div>
					</c:if>
					<c:if test="${hroomLists.hotelimg3 != null }">
					<div class="col-md-3 thumbnail" style="position : relative; width:90px; height:70px; background:black;">
						<c:set var="carouselnum" value="${carouselnum+1}"/>
						<a onclick="thumbnail('${hroomLists.hotelimg3}');">
							<img src="resources/${hroomLists.hotelimg3}" style="width:80px; height:60px; display: block; margin: 0 auto;">
						</a>
					</div>
					</c:if>
					<c:if test="${hroomLists.hotelimg4 != null }">
					<div class="col-md-3 thumbnail" style="position : relative; width:90px; height:70px; background:black;">
						<c:set var="carouselnum" value="${carouselnum+1}"/>
						<a onclick="thumbnail('${hroomLists.hotelimg4}');">
							<img src="resources/${hroomLists.hotelimg4}" style="width:80px; height:60px; display: block; margin: 0 auto;">
						</a>
					</div>
					</c:if>
					<c:forEach items="${roomLists}" var="room">
					<div class="col-md-3 thumbnail" style="position : relative; width:90px; height:70px; background:black;">
						<c:set var="lastcarouselnum" value="${carouselnum+1}"/>
						<a onclick="thumbnail('${room.roomimg1}');">
							<img src="resources/${room.roomimg1}" style="width:80px; height:60px; display: block; margin: 0 auto;">
						</a>
					</div>
					
					<c:if test="${room.roomimg2 != null }">
					<div class="col-md-3 thumbnail" style="position : relative; width:90px; height:70px; background:black;">
						<c:set var="carouselnum" value="${carouselnum+1}"/>
						
						<a onclick="thumbnail('${room.roomimg2}');">
							<img src="resources/${room.roomimg2}" style="width:80px; height:60px; display: block; margin: 0 auto;">
						</a>
					</div>
					</c:if>
					</c:forEach>
				
			</marquee>
			</div>
			<div class="col-md-12">
			<p style="color:#F2F2F2;">본 이미지는 (주)Trolli에 소속된 이미지 입니다.<br> 
			무단으로 사전 서면 동의없이 다른 로봇, 스파이더, 스크래이퍼, 기타자동화된 수단을 이용하여 정보 또는 정보의 일부를 접근하거나 감시하는 행위를 할 경우 범죄의 대상이 됨으로 주의하시길 바랍니다.<br>
			만약 허용된 목적 이외 다른 목적으로 정보 또는 정보의 일부를 사용하여 비용, 민원, 청구, 채무, 비용, 손해, 손실을 야기하는 경우에 이에 대해 배상해야 합니다.
			</p>
			</div>		
			</div>
			
		</div>
	</div>
</div>

<!--로그인 위시리스트 모달  -->

		
		<div class="modal fade" id="myModal3" role="dialog">
		<input type="hidden" value="${hotelnum}" name="hotelnum">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h3 class="modal-title">위시리스트</h3>
						<h5>Trolli 에서 마음에 드는 숙소를 최저가로 예약해보세요.</h5>
					
					</div>
					<div class="modal-body">
					
					<center>
					<button type="button" class="btn btn-default" onclick="wish()">위시리스트이동</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">계속쇼핑하기</button>
					</center>
					</div>
				</div>
			</div>
		</div>

<!--비로그인 위시리스트 모달  -->
	<div class="modal fade" id="myModal4" role="dialog">
		<input type="hidden" value="${hotelnum}" name="hotelnum">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h3 class="modal-title">위시리스트</h3>
						<h5>안녕하세요. Trolli 방문이 처음이신가요?</h5>
						<h5>Trolli 에서 마음에 드는 숙소를 최저가로 예약해보세요.</h5>
					
					</div>
					<div class="modal-body">
					<center style="font-weight: bold;">로그인후 이용가능합니다.<br><br>
					<button type="button" class="btn btn-default" data-dismiss="modal">되돌아가기</button>
					</center>
					</div>
				</div>
			</div>
		</div>


<!-- location modal -->
		
		<div class="modal fade" id="location"  style="position: absolute; right: 10px; left: 10px; background-color:black; opacity:0.8; ">
			
			<div class="modal-content" style="align:center; vertical-align:center; background:white; opacity:1;">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body" style="width: 80%; height: 80%; position: absolute; left: 20%;"> 
						<div style="width: 80%; height: 80%; position: absolute; left: 20%;">
							<img src="http://placehold.it/600x300" alt="" >
						</div>
					</div>
			</div>
		</div>
		
	
	
   


<%@ include file="./../main/main_bottom.jsp" %>

