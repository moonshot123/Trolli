<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="./../main/main_top.jsp"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function goDelete() {
	alert("정보를 삭제하겠습니다.");
	location.href='favoratedelete.fav';
}
</script>
</head>
<div class="col-md-3"></div>
<div class="col-md-6">
<br><br><br><br>
<div><img src="resources/images/wishlistslide.jpg" width="100%"></div>
<div class="panel panel-trolli">
  <div class="panel-heading">
  	<br><br>
    <p class="panel-title" style="text-align: center;"></p>
  </div>
  <div class="panel-body">
 <%--  <c:choose>
        <c:when test="${favorate.count == 0}">
            	위시리스트가 비어있습니다.
        </c:when>
        <c:otherwise> --%>
        <div>
            <table class="table">
            <thead>
                <tr align="center">
                    <th>호텔이미지</th>
                    <th>호텔명</th>
                    <th>평점</th>
                    <th>삭제하기</th>
                </tr>
            </thead>    
                <c:forEach var="favorate" items="${favorateList}">
                
                <c:if test="${loginfo.membernum == favorate.membernum}">
                <tbody>
                <tr height="120px">
                	<td>
                    <a href="room.roo?hotelnum=${favorate.hotelnum}" style="text-decoration: none;">
                    <img src="../resources/${favorate.hotelimg1}" style="width:80px; height:60px;">
                    </a> 
                    </td>
                    <td>
                        
                        <a href="room.roo?hotelnum=${favorate.hotelnum}"style="text-decoration: none;">
                        ${favorate.hotelname}</a>
                        
                    </td>
                    <td class="ratings">
                      
                        
                         <c:forEach begin="1" end="5" varStatus="status">
                                   <c:choose>
                                      <c:when test="${favorate.hotelscore >= status.count}">
                                         <span class="glyphicon glyphicon-star"></span>
                                      </c:when>
                                      <c:otherwise>
                                          <span class="glyphicon glyphicon-star-empty"></span>
                                      </c:otherwise>
                                   </c:choose>
                                </c:forEach>
                        
                        
                    </td>
                    <td>
                     <a href="favoratedelete.fav?hotelnum=<c:out value="${favorate.hotelnum}"/>" 
				      onclick="goDelete()"class="label label-default">삭제하기</a>
                    </td>
                </tr>
                </tbody>
                </c:if>
              
                </c:forEach>
            </table>
            
            
        </div>
        <div align="center">
        <br><br><br><br>
        <a href="javascript:history.go(-1)" class="btn btn-default">돌아가기</a>
        
        </div>
<%--          </c:otherwise>
    </c:choose> --%>
  
  </div>
</div>
</div>



<%@ include file="./../main/main_bottom.jsp"%>