<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="./../common/common.jsp"%>
<%@ include file="./../main/main_top.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>호텔 상세정보 페이지</title>
</head>
<c:set var="theString1" value="http://localhost:9090${pageContext.request.contextPath}/resources/${hotel.hotelimg1}"/>
<c:set var="theString2" value="http://localhost:9090${pageContext.request.contextPath}/resources/${hotel.hotelimg2}"/>
<c:set var="theString3" value="http://localhost:9090${pageContext.request.contextPath}/resources/${hotel.hotelimg3}"/>
<c:set var="theString4" value="http://localhost:9090${pageContext.request.contextPath}/resources/${hotel.hotelimg4}"/>
   <br><br><br><br>
   
   <div class="col-md-12">
      <div class="col-md-2"></div>
      <div class="col-md-8">
      
   <h3 style="text-align: center">호텔 상세정보</h3>   
  
   <form class="form-horizontal">
  <fieldset>

       <input type="hidden" name="hotelnum" value="${hotel.hotelnum}">
        <input type="hidden" name="membernum" value="${hotel.membernum}">
       
       <div class="form-group">
         <label class="col-lg-2 control-label" for="disabledInput">호텔번호</label>
         <div class="col-lg-10">
          <B class="text-primary">
         <input disabled="" class="form-control" id="disabledInput" type="text" placeholder="<c:out value="${hotel.hotelnum}"/>">  
 		 </B>
         </div>
       </div> 
       
 
       <div class="form-group">
         <label class="col-lg-2 control-label" for="disabledInput">회원번호</label>
         <div class="col-lg-10">
          <c:if test="${loginfo.membername ne null}">
          <B class="text-primary">
         <input disabled="" class="form-control" id="disabledInput" type="text" placeholder="<c:out value="${hotel.membernum}"/>">  
 		 </B>
 		 </c:if>  
         </div>
       </div> 
      

      <div class="form-group">
         <label class="col-lg-2 control-label" for="disabledInput">사업자등록번호</label>
         <div class="col-lg-10">
          <B class="text-primary">
         <input disabled="" class="form-control" id="disabledInput" type="text" placeholder="<c:out value="${hotel.companyregnum }"/>">  
 		 </B>
         </div>
       </div> 	
    	
       
       <div class="form-group">
         <label class="col-lg-2 control-label" for="disabledInput">호텔카테고리</label>
         <div class="col-lg-10">
          <B class="text-primary">
         <input disabled="" class="form-control" id="disabledInput" type="text" placeholder="<c:out value="${hotel.hotelcategory }"/>">  
 		 </B>
         </div>
       </div> 	
       
        <div class="form-group">
         <label class="col-lg-2 control-label" for="disabledInput">호텔이름</label>
         <div class="col-lg-10">
          <B class="text-primary">
         <input disabled="" class="form-control" id="disabledInput" type="text" placeholder="<c:out value="${hotel.hotelname }"/>">  
 		 </B>
         </div>
       </div> 	
       
        <div class="form-group">
         <label class="col-lg-2 control-label" for="disabledInput">호텔주소</label>
         <div class="col-lg-10">
          <B class="text-primary">
         <input disabled="" class="form-control" id="disabledInput" type="text" placeholder="<c:out value="${hotel.hoteladdr }"/>">  
 		 </B>
         </div>
       </div> 	
       
    
   <div class="form-group">
         <label class="col-lg-2 control-label">호텔사진1</label>
         <div class="col-lg-10">
            <img src="${theString1}" class="col-lg-10">
			<input type="hidden" name="uploadimg11" value="<c:out value="${hotel.hotelimg1 }"/>">
         </div>
       </div>
    
       <div class="form-group">
         <label class="col-lg-2 control-label">호텔사진2</label>
         <div class="col-lg-10">
           <img src="${theString2}" class="col-lg-10">
			<input type="hidden" name="uploadimg22" value="<c:out value="${hotel.hotelimg2 }"/>">
         </div>
       </div> 
 
       <div class="form-group">
         <label class="col-lg-2 control-label">호텔사진3</label>
         <div class="col-lg-10">
           <img src="${theString3}" class="col-lg-10">
			<input type="hidden" name="uploadimg33" value="<c:out value="${hotel.hotelimg3 }"/>">
         </div>
       </div> 
       
         <div class="form-group">
         <label class="col-lg-2 control-label">호텔사진4</label>
         <div class="col-lg-10">
           <img src="${theString4}" class="col-lg-10">
			<input type="hidden" name="uploadimg44" value="<c:out value="${hotel.hotelimg4 }"/>">
         </div>
       </div>
       
     <div class="form-group">
         <label class="col-lg-2 control-label" for="disabledInput">호텔소개1</label>
         <div class="col-lg-10">
          <B class="text-primary">
         <input disabled="" class="form-control" id="disabledInput" type="text" placeholder="<c:out value="${hotel.hotelproduce1}"/>">  
 		 </B>
         </div>
       </div> 
       
     <div class="form-group">
         <label class="col-lg-2 control-label" for="disabledInput">호텔소개2</label>
         <div class="col-lg-10">
          <B class="text-primary">
         <input disabled="" class="form-control" id="disabledInput" type="text" placeholder="<c:out value="${hotel.hotelproduce2}"/>">  
 		 </B>
         </div>
       </div> 
    
    <div class="form-group">
         <label class="col-lg-2 control-label" for="disabledInput">호텔소개3</label>
         <div class="col-lg-10">
          <B class="text-primary">
         <input disabled="" class="form-control" id="disabledInput" type="text" placeholder="<c:out value="${hotel.hotelproduce3}"/>">  
 		 </B>
         </div>
       </div> 	 
   
   <div class="form-group">
         <label class="col-lg-2 control-label" for="disabledInput">부대시설</label>
         <div class="col-lg-10">
          <B class="text-primary">
         <input disabled="" class="form-control" id="disabledInput" type="text" placeholder="<c:out value="${hotel.hotelfacility }"/>">  
 		 </B>
         </div>
       </div> 	
   
   <div class="form-group">
         <label class="col-lg-2 control-label" for="disabledInput">호텔평점</label>
         <div class="col-lg-10">
          <B class="text-primary">
         <input disabled="" class="form-control" id="disabledInput" type="text" placeholder="<c:out value="${hotel.hotelscore }"/>">  
 		 </B>
         </div>
       </div> 	
   
   <div class="form-group" >
      <div class="col-lg-10 col-lg-offset-2" align="right">
        <a href="javascript:history.go(-1)" class="btn btn-default">돌아가기</a>	
      </div>
    </div>

  </fieldset>
  </form>
  </div>
  <div class="col-md-2"></div>
  </div>
  <br><br><br>
    
    
<%@ include file="./../main/main_bottom.jsp"%>       
