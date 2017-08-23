<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>  
<%@ include file="./../main/main_top.jsp" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<!-- 
		(일반:1,사업자:2,관리자:3)
	-->
	
	<c:set var="num" value="${loginfo.logincheck}" /> 
<c:choose>

    <c:when test="${num eq '1'}">
       <%@ include file="./AdminMyPage.jsp" %> 
    </c:when>
	

    <c:when test="${num eq '2'}">
        <%@ include file="./SellerMyPage.jsp" %> 
    </c:when>
	
	
    <c:otherwise>
        <%@ include file="./BuyerMyPage.jsp" %> 
    </c:otherwise>

</c:choose>
	<!-- ??? 이거만 값이 안들어옴 -->
	<div class="col-md-7"></div>

	<div class="col-md-5">
	<%-- ${loginfo.logincheck} 
	${loginfo.memberid}
	${loginfo.memberpw}
	${loginfo.memberemail}
	${loginfo.memberbirth}
	${loginfo.membernum} --%>
	</div>
	<%-- <h3> 회원등급:${loginfo.logincheck} </h3> 
	<h3> 회원정보는 이제 로그인이랑 연동시켜놓음, 결제정보는 아직안함 </h3> --%>
	

<%@ include file="./../main/main_bottom.jsp"%>