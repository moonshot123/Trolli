<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="main_top.jsp"%>
<%@ include file="main_top2.jsp"%>

<br>
<div class="bs-component" > 
          
				<Br><Br><Br>
              <div class="col-md-12">
              	<div class="col-md-1" ></div>
              	<p class="col-md-2" style="text-align: center;">
              	<img src="resources/main_images/main_picto1.png"  style="text-align: center;width: 100px;">
              	<br><br>
              	<b>모든 호텔을 한눈에 비교</b><br>
				
				<font size="1px">
                <br><br>
				국내 호텔을 한 번에 비교하여<Br> 마음에 쏙 드는 호텔을 예약하세요.
				</font>
				</p>
              	<div class="col-md-2"></div>
                <p class="col-md-2" style="text-align: center;">
                <img src="resources/main_images/main_picto2.png"  style="text-align: center;width: 100px;">
              	<br><br>
                <b>최저가 보장</b><br>
                <font size="1px">
                <br><br>
				예약 수수료가 없습니다.<br> Trolli가 고객님께 드리는 약속입니다.
				</font>
				</p>
                <div class="col-md-2"></div>
                <p class="col-md-2" style="text-align: center;">
                <img src="resources/main_images/main_picto3.png"  style="text-align: center;width: 100px;">
              	<br><br>
                <b>즐거운 여행의 시작</b>
                <br>
                <font size="1px">
                <br><br>
				4억 여행자가 작년에 Trolli에서<br>
				최고의 호텔 상품을 검색했습니다.
				</font>
				</p>
                <div class="col-md-1"></div>
              </div>
              <div class="col-md-12">

			</div>
</div>

<div class="col-md-12">
<Br><Br><Br><Br>
<div class="well"> 

<blockquote>
  <p>목적지에 닿아야 행복해지는 것이 아니라 여행하는 과정에서 행복을 느끼는 것이다.</p>
  <small><cite title="Source Title">Andrew Matthews</cite></small>
</blockquote>
</div>
</div>
<br><br>


           <div class="bs-component"> 
              <div class="col-md-12" align="center">
              	<div class="col-md-12">
              	<a href="http://localhost:9090/ex/search.hot?search_p=%EC%84%9C%EC%9A%B8&searchStart=&searchEnd=&roompeople=0&sort=0" class="ex1">
              	<img src="resources/main_images/main_seoul.jpg" style="width:1000px;">
              	</a>
              	</div>
              	<div class="col-md-12" align="center">
              	<a href="http://localhost:9090/ex/search.hot?search_p=%EB%B6%80%EC%82%B0&searchStart=&searchEnd=&roompeople=0&sort=0" class="ex1">
              	<img src="resources/main_images/main_busan.jpg" style="width:598.4px;height:400px;">
              	</a>
              	<a href="http://localhost:9090/ex/search.hot?search_p=%EC%A0%9C%EC%A3%BC&searchStart=&searchEnd=&roompeople=0&sort=0" class="ex1">
              	<img src="resources/main_images/main_jeju.jpg" style="width:398.4px; height:400px;">
              	</a>
              	</div>
              	
              	<div class="col-md-12">
              	<br><br>
              	</div>
              </div>
              
           </div>
           
             

<div class="col-md-12">
<div class="col-md-12">
<div class="well">            
<blockquote class="blockquote-reverse">
  <p>여행이란 우리가 사는 장소를 바꾸어 주는 것이 아니라 우리의 생각과 편견을 바꾸어 주는 것이다.</p>
  <small><cite title="Source Title"> Francois Anatole Thibault</cite></small>
</blockquote>
</div>  
</div>
</div>

<!-- 아까여기있었던곳 -->




<div class="col-md-12">
<br><br><br><br><br><br>
<div class="panel panel-trolli">
  <div class="panel-heading">
    <h3  style="text-align: center; font-weight: bold;">추천 여행지</h3>
  </div>

<div class="panel-body">
<div class="col-md-1"></div>  
<div class="col-md-10">

<c:if test="${hotelLists.size() >= 1}">
            <%-- <c:forEach items="${hotelLists}" var="hotel"/> --%>
            <%-- <c:if test="${hotel.rownum < '5'}">
            <input type="hidden" name="membernum" value="${hotel.membernum}">
             <div class="col-md-3">
                        <div class="thumbnail">
                        <a href="room.roo?hotelnum=${hotel.hotelnum }" style="text-decoration: none;">
                            <img src="resources/${hotel.hotelimg1}" style="width:245px; height:174px;" alt="${hotel.hotelimg1 }">
                        </a> 
                            <div class="caption">
                            <center>
                                <h5><b><a href="room.roo?hotelnum=${hotel.hotelnum }" style="text-decoration: none;">
                                ${hotel.hotelname}
                                </a></b></h5>
                                <h6>${hotel.hoteladdr}</h6>
                            </center>    
                               
                                <div class="ratings">
                            
                                <p align="center">
                                <c:forEach begin="1" end="5" varStatus="status">
                                   <c:choose>
                                      <c:when test="${hotel.hotelscore >= status.count}">
                                         <span class="glyphicon glyphicon-star"></span>
                                      </c:when>
                                      <c:otherwise>
                                          <span class="glyphicon glyphicon-star-empty"></span>
                                      </c:otherwise>
                                   </c:choose>
                                </c:forEach>
                                 </p>
                                <h4 class="pull-right"><b>평점 : ${hotel.hotelscore }</b></h4>
                            </div>  
                            </div>
                          
                        </div>
                    </div>
            </c:if> --%>
            <!-- 캐롯셀 연습 -->
<div class="container">
   
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators" style="bottom: 1px;">
      <li data-target="#myCarousel" data-slide-to="0" class="active" style="border: 0.5px solid #C6113F; background-color: #E91545;"></li>
      <li data-target="#myCarousel" data-slide-to="1" style="border: 0.5px solid #C6113F; background-color: #E91545;"></li>
      <li data-target="#myCarousel" data-slide-to="2" style="border: 0.5px solid #C6113F; background-color: #E91545;"></li>
      <li data-target="#myCarousel" data-slide-to="3" style="border: 0.5px solid #C6113F; background-color: #E91545;"></li>
      <li data-target="#myCarousel" data-slide-to="4" style="border: 0.5px solid #C6113F; background-color: #E91545;"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <c:forEach items="${hotelLists}" var="hotel">
        <c:if test="${hotel.rownum < '5'}">
            <input type="hidden" name="membernum" value="${hotel.membernum}">
             <div class="col-md-3">
                        <div class="thumbnail">
                            <a href="room.roo?hotelnum=${hotel.hotelnum }" style="text-decoration: none;">
                            <img src="resources/${hotel.hotelimg1}" style="width:245px; height:174px;" alt="${hotel.hotelimg1 }">
                        	</a> 
                            <div class="caption">
                            <center>
                                <h5><b><a href="room.roo?hotelnum=${hotel.hotelnum }"
                                 style="text-decoration: none;">${hotel.hotelname}
                                </a></b></h5>
                                <h6>${hotel.hoteladdr}</h6>
                            </center>    
                               
                                <div class="ratings">
                            
                                <p align="center">
                                <c:forEach begin="1" end="5" varStatus="status">
                                   <c:choose>
                                      <c:when test="${hotel.hotelscore >= status.count}">
                                         <span class="glyphicon glyphicon-star"></span>
                                      </c:when>
                                      <c:otherwise>
                                          <span class="glyphicon glyphicon-star-empty"></span>
                                      </c:otherwise>
                                   </c:choose>
                                </c:forEach>
                                 </p>
                                <h4 class="pull-right"><b>평점 : ${hotel.hotelscore }</b></h4>
                            </div>  
                            </div>
                          
                        </div>
                    </div>
            </c:if>
            </c:forEach>
        
        
      </div>

       <div class="item">
        <c:forEach items="${hotelLists}" var="hotel">
        <c:if test="${'4'< hotel.rownum && hotel.rownum < '9'}">
            <input type="hidden" name="membernum" value="${hotel.membernum}">
             <div class="col-md-3">
                        <div class="thumbnail">
                             <a href="room.roo?hotelnum=${hotel.hotelnum }"
                                 class="text-default" style="text-decoration: none;">
                            <img src="resources/${hotel.hotelimg1}" style="width:245px; height:174px;" alt="${hotel.hotelimg1 }">
                        	</a> 
                            <div class="caption">
                            <center>
                                <h5><b><a href="room.roo?hotelnum=${hotel.hotelnum }"
                                 class="text-default" style="text-decoration: none;">${hotel.hotelname}
                                </a></b></h5>
                                <h6>${hotel.hoteladdr}</h6>
                            </center>    
                               
                                <div class="ratings">
                            
                                <p align="center">
                                <c:forEach begin="1" end="5" varStatus="status">
                                   <c:choose>
                                      <c:when test="${hotel.hotelscore >= status.count}">
                                         <span class="glyphicon glyphicon-star"></span>
                                      </c:when>
                                      <c:otherwise>
                                          <span class="glyphicon glyphicon-star-empty"></span>
                                      </c:otherwise>
                                   </c:choose>
                                </c:forEach>
                                 </p>
                                <h4 class="pull-right"><b>평점 : ${hotel.hotelscore }</b></h4>
                            </div>  
                            </div>
                          
                        </div>
                    </div>
            </c:if>
            </c:forEach>
      </div>
    
      <div class="item">
        <c:forEach items="${hotelLists}" var="hotel">
        <c:if test="${'9'< hotel.rownum && hotel.rownum < '14'}">
            <input type="hidden" name="membernum" value="${hotel.membernum}">
             <div class="col-md-3">
                        <div class="thumbnail">
                             <a href="room.roo?hotelnum=${hotel.hotelnum }"
                                 class="text-default" style="text-decoration: none;">
                            <img src="resources/${hotel.hotelimg1}" style="width:245px; height:174px;" alt="${hotel.hotelimg1 }">
                        	</a> 
                            <div class="caption">
                            <center>
                                <h5><b><a href="room.roo?hotelnum=${hotel.hotelnum }"
                                 class="text-default" style="text-decoration: none;">${hotel.hotelname}
                                </a></b></h5>
                                <h6>${hotel.hoteladdr}</h6>
                            </center>    
                               
                                <div class="ratings">
                            
                                <p align="center">
                                <c:forEach begin="1" end="5" varStatus="status">
                                   <c:choose>
                                      <c:when test="${hotel.hotelscore >= status.count}">
                                         <span class="glyphicon glyphicon-star"></span>
                                      </c:when>
                                      <c:otherwise>
                                          <span class="glyphicon glyphicon-star-empty"></span>
                                      </c:otherwise>
                                   </c:choose>
                                </c:forEach>
                                 </p>
                                <h4 class="pull-right"><b>평점 : ${hotel.hotelscore }</b></h4>
                            </div>  
                            </div>
                          
                        </div>
                    </div>
            </c:if>
            </c:forEach>
        
      </div>
      
       <div class="item">
        <c:forEach items="${hotelLists}" var="hotel">
        <c:if test="${'14'< hotel.rownum && hotel.rownum < '19'}">
            <input type="hidden" name="membernum" value="${hotel.membernum}">
             <div class="col-md-3">
                        <div class="thumbnail">
                            <a href="room.roo?hotelnum=${hotel.hotelnum }"
                                 class="text-default" style="text-decoration: none;">
                            <img src="resources/${hotel.hotelimg1}" style="width:245px; height:174px;" alt="${hotel.hotelimg1 }">
                        	</a> 
                            <div class="caption">
                            <center>
                                <h5><b><a href="room.roo?hotelnum=${hotel.hotelnum }"
                                 class="text-default" style="text-decoration: none;">${hotel.hotelname}
                                </a></b></h5>
                                <h6>${hotel.hoteladdr}</h6>
                            </center>    
                               
                                <div class="ratings">
                            
                                <p align="center">
                                <c:forEach begin="1" end="5" varStatus="status">
                                   <c:choose>
                                      <c:when test="${hotel.hotelscore >= status.count}">
                                         <span class="glyphicon glyphicon-star"></span>
                                      </c:when>
                                      <c:otherwise>
                                          <span class="glyphicon glyphicon-star-empty"></span>
                                      </c:otherwise>
                                   </c:choose>
                                </c:forEach>
                                 </p>
                                <h4 class="pull-right"><b>평점 : ${hotel.hotelscore }</b></h4>
                            </div>  
                            </div>
                          
                        </div>
                    </div>
            </c:if>
            </c:forEach>
        
      </div>
      
       <div class="item">
        <c:forEach items="${hotelLists}" var="hotel">
        <c:if test="${'19'< hotel.rownum && hotel.rownum < '24'}">
            <input type="hidden" name="membernum" value="${hotel.membernum}">
             <div class="col-md-3">
                        <div class="thumbnail">
                             <a href="room.roo?hotelnum=${hotel.hotelnum }"
                                 class="text-default" style="text-decoration: none;">
                            <img src="resources/${hotel.hotelimg1}" style="width:245px; height:174px;" alt="${hotel.hotelimg1 }">
                        	</a> 
                            <div class="caption">
                            <center>
                                <h5><b><a href="room.roo?hotelnum=${hotel.hotelnum }"
                                 class="text-default" style="text-decoration: none;">${hotel.hotelname}
                                </a></b></h5>
                                <h6>${hotel.hoteladdr}</h6>
                            </center>    
                               
                                <div class="ratings">
                            
                                <p align="center">
                                <c:forEach begin="1" end="5" varStatus="status">
                                   <c:choose>
                                      <c:when test="${hotel.hotelscore >= status.count}">
                                         <span class="glyphicon glyphicon-star"></span>
                                      </c:when>
                                      <c:otherwise>
                                          <span class="glyphicon glyphicon-star-empty"></span>
                                      </c:otherwise>
                                   </c:choose>
                                </c:forEach>
                                 </p>
                                <h4 class="pull-right"><b>평점 : ${hotel.hotelscore }</b></h4>
                            </div>  
                            </div>
                          
                        </div>
                    </div>
            </c:if>
            </c:forEach>
        
      </div>
      
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev" style="opacity: 0;">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next" style="opacity: 0;">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
            <%-- </c:forEach> --%>
</c:if>            
<c:if test="${hotelLists.size() < 1 }"><center > 일치하는 검색결과가 없습니다. </center></c:if>
</div>
</div>
<div class="col-md-1"></div> 

  </div>

</div>

<div class="col-md-12">
<br><br><Br>
<div class="col-md-12">
<div class="col-md-7"><img src="resources/main_images/award.PNG" class="col-md-12" style="width:350px;">
<br>

<h4>
이제 스마트폰에서도 타블렛에서도 Trolli!
</h4>
<br>
<small>
모바일에서도 한눈에 호텔을 비교하세요!
</small>
<br><br>

<a href="https://itunes.apple.com/kr/genre/ios/id36"><img src="resources/main_images/appstore.png" style="width:100px;"></a>
<a href="https://play.google.com/store"><img src="resources/main_images/googleplay.png" style="width:100px;"></a>

<br><br><br><br><br><br>
</div>
<div class="col-md-2" align="left">
<br>
<img src="resources/main_images/small_check.png" style="width:20px;">&nbsp;
<small>친환경 예약!<Br>확인서를 인쇄할 필요가 없습니다.</small><br><br> 
<img src="resources/main_images/small_check.png" style="width:20px;">&nbsp;
<small>숙소 경로를 지도로 확인하세요 .</small><br><br>
<img src="resources/main_images/small_check.png" style="width:20px;">&nbsp;
<small>이동 중 예약 관리하세요.</small> <br><br>
<img src="resources/main_images/small_check.png" style="width:20px;">&nbsp;
<small>신용카드 없이 막바지 예약하세요!</small><br><br>
</div>
<div class="col-md-3" align="center">
<img src="resources/main_images/qrcode.png"><br>QR 코드로Trolli.com 앱을 받아보세요!</div>

</div>


<div class="col-md-12">

<div align="center">
<h2>시간도 돈도 아끼는 일석이조의 현명한 선택! <small>가입하시면 최고의 특가로 고객님을 모시겠습니다.</small></h2> 
</div>
</div>
</div>

<div class="col-md-12">
<Br><Br><Br><Br>  

</div>
<%@ include file="main_bottom.jsp"%>