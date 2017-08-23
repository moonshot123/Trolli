<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="./../main/main_top.jsp" %>


<br><br><br><br>

<div class="container">
   <div class="row">
   
      <form action="search.hot" name="sc2_form" method="get">
      <div class="col-md-3" style="height: 500px;">
         <p class="lead">여행지 검색</p>
         <div class="list-group">
            <label class="text-trolli" style="font-weight: bold;">여행지 </label>
            <input type="text" name="search_p" class="form-control" style="width: 250px;"
               <c:choose>
                                   <c:when test="${ search_p == null ||search_p == ''}">
                                        placeholder="도시 또는 호텔명을 검색해 보세요."
                                    </c:when>
                                    <c:otherwise>
                                         value="${search_p }"
                                    </c:otherwise>
                               </c:choose>>
            
            <label class="text-trolli" style="font-weight: bold; float: left;border-spacing:10px;">체크인</label>
            <input type="text" name="searchStart" id="datePicker" class="form-control" style="width: 250px;float: left;"
            value="${searchStart }">
                            
                     
               
            <label class="text-trolli" style="font-weight: bold; float: left;border-spacing:10px;">체크아웃</label>
            <input type="text" name="searchEnd" id="datePicker2" class="form-control" style="width: 250px;float: left;"
             value="${searchEnd }">
             
            <select class="form-control" name="roompeople" style="width:250px;float:left;border-spacing:10px;">
               <option value="0"<c:if test="${roompeople eq '0' }">selected = "selected" </c:if>>선택</option>
               <option value="1"<c:if test="${roompeople eq '1' }">selected = "selected" </c:if>>1명</option>
               <option value="2"<c:if test="${roompeople eq '2' }">selected = "selected" </c:if>>2명</option>
               <option value="3"<c:if test="${roompeople eq '3' }">selected = "selected" </c:if>>가족</option>
               <option value="4"<c:if test="${roompeople eq '4' }">selected = "selected" </c:if>>단체</option>
            </select>
            <br><br><br><br><br><br><br><br>
            <div class="radio">
            <div class="col-md-12">
            
            <div class="col-md-10">
            <br>
            <input type="radio" value="0" name="sort" <c:if test="${sort == '0' }"> checked = "checked" </c:if>>별점순<br>
            <input type="radio" value="1" name="sort" <c:if test="${sort == '1' }"> checked = "checked" </c:if>>낮은가격순<br>
            <input type="radio" value="2" name="sort" <c:if test="${sort == '2' }"> checked = "checked" </c:if>>높은가격순<br>
            </div>
            </div>
            </div>
            
               <%-- <c:if test="${roompeople == '선택'}"> selected="selected" </c:if>
               
               <option value="2명" <c:if test="${roompeople == '선택'}"> selected="selected"</c:if>>2명</option>
               <option value="가족" <c:if test="${roompeople == '선택'}"> selected="selected"</c:if>>가족</option>
               <option value="단체" <c:if test="${roompeople == '선택'}"> selected="selected"</c:if>>단체</option> --%>
            <br><br><br><br><br><br>
            <input type="submit" class="btn btn-success btn-lg" value="검색하기" style=" width: 250px; align :center;">
            
         </div>
      </div>   
      </form>
   
   <div class="col-md-9">
   

       
             
                <div class="row">
                
                
                
                
                
            <c:if test="${hotelLists.size() >= 1}">
            <c:forEach items="${hotelLists}" var="hotel">
                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                        <a href="room.roo?hotelnum=${hotel.hotelnum}&searchStart=${searchStart }&searchEnd=${searchEnd }"
                                 class="text-default" style="text-decoration: none;">
                            <img src="resources/${hotel.hotelimg1}" style="width:245px; height:174px;" alt="${hotel.hotelimg1 }">
                        </a>    
                            <div class="caption">
                                <h5><b><a href="room.roo?hotelnum=${hotel.hotelnum }&searchStart=${searchStart }&searchEnd=${searchEnd }"
                                 class="text-default" style="text-decoration: none;">${hotel.hotelname}
                                </a></b>
                                <span class="ratings"><b class="pull-right">￦  ${hotel.roomprice}</b></span></h5>
                                <ul>
                                   <li>${hotel.hoteladdr }</li>
                                   <li>${hotel.hotelproduce1 }</li>
                                   <li>${hotel.hotelfacility }</li>
                                </ul>
                            </div>
                            <div class="ratings">
                                <h4 class="pull-right"><b>평점 : ${hotel.hotelscore }</b></h4>
                                <p>
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
                                
                                
                            </div>
                        </div>
                    </div>

                    
                    
               </c:forEach>
                    </c:if>
                    <c:if test="${hotelLists.size() < 1 }"><center > 일치하는 검색결과가 없습니다. </center></c:if>
                   
                </div>
                
                <center>
               ${pageInfo.pagingHtml}
            </center>
            </div>
      </div>
</div>

         
   

<br><br>

<%@ include file="./../main/main_bottom.jsp" %>
