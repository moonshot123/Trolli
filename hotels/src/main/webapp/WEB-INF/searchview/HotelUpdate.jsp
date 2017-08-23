<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./../main/main_top.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>호텔 정보수정페이지</title>
</head>
<c:set var="theString1" value="http://localhost:9090${pageContext.request.contextPath}/resources/${hotel.hotelimg1}"/>
<c:set var="theString2" value="http://localhost:9090${pageContext.request.contextPath}/resources/${hotel.hotelimg2}"/>
<c:set var="theString3" value="http://localhost:9090${pageContext.request.contextPath}/resources/${hotel.hotelimg3}"/>
<c:set var="theString4" value="http://localhost:9090${pageContext.request.contextPath}/resources/${hotel.hotelimg4}"/>
   <br><br><br><br>
   
   <div class="col-md-12">
      <div class="col-md-2"></div>
      <div class="col-md-8">
      
   <h3 style="text-align: center">호텔 정보수정</h3>   
   <br><br>
<form:form commandName="hotel" class="form-horizontal" action="hotelupdate.hot" melabelod="post" enctype="multipart/form-data">
  <fieldset>
       
       <input type="hidden" name="hotelnum" value="${hotel.hotelnum}">
        <input type="hidden" name="membernum" value="${hotel.membernum}">
      
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
         <label class="col-lg-2 control-label">사업자등록번호</label>
         <div class="col-lg-10">
           <input type="text" class="form-control" name="companyregnum" value="<c:out value="${hotel.companyregnum}"/>">
           
         </div>
       </div>
   
      <div class="form-group">
      <label class="col-lg-2 control-label">호텔카테고리</label>
      <div class="col-lg-10">
        <div class="radio">
          <label>
            
            <input type="radio" name="hotelcategory" id="hotel" value="hotel"
			<c:if test="${hotel.hotelcategory eq 'hotel'}">checked</c:if>
			>hotel	
            	
          </label>
        </div>
        <div class="radio">
          <label>
            
            <input type="radio" name="hotelcategory" id="motel" value="motel"
			<c:if test="${hotel.hotelcategory eq 'motel'}">checked</c:if>
			>motel	
            	
          </label>
        </div>
        <div class="radio">
          <label>
            
            <input type="radio" name="hotelcategory" id="guesthouse" value="guesthouse"
			<c:if test="${hotel.hotelcategory eq 'guesthouse'}">checked</c:if>
			>guesthouse  
               
          </label>
        </div>
          
      </div>
    </div>
       
         <div class="form-group">
         <label class="col-lg-2 control-label">호텔이름</label>
         <div class="col-lg-10">
           <input type="text" class="form-control" name="hotelname" value="<c:out value="${hotel.hotelname }"/>">
           
         </div>
       </div>
       
         <div class="form-group">
         <label class="col-lg-2 control-label">호텔주소</label>
         <div class="col-lg-10">
           <input type="text" class="form-control" name="hoteladdr" value="<c:out value="${hotel.hoteladdr }"/>">
           
         </div>
       </div>
    
   
    <div class="form-group">
         <label class="col-lg-2 control-label">호텔사진1</label>
         <div class="col-lg-10">
        <img src="${theString1}" width="100" height="100"><!-- koala.jpg -->
		<input type="file" name="uploadimg1" value=""><!-- Tulips.jpg -->
		<input type="hidden" name="uploadimg11" value="${hotel.hotelimg1 }">
         </div>
       </div>
    
     <div class="form-group">
         <label class="col-lg-2 control-label">호텔사진2</label>
         <div class="col-lg-10">
        <img src="${theString2}" width="100" height="100">
		<input type="file" name="uploadimg2" value="">
		<input type="hidden" name="uploadimg22" value="${hotel.hotelimg2 }">
         </div>
       </div> 
    
       <div class="form-group">
         <label class="col-lg-2 control-label">호텔사진3</label>
         <div class="col-lg-10">
        <img src="${theString3}" width="100" height="100">
		<input type="file" name="uploadimg3" value="">
		<input type="hidden" name="uploadimg33" value="${hotel.hotelimg3 }">
         </div>
       </div> 
       
       <div class="form-group">
         <label class="col-lg-2 control-label">호텔사진4</label>
         <div class="col-lg-10">
        <img src="${theString4}" width="100" height="100">
		<input type="file" name="uploadimg4" value="">
		<input type="hidden" name="uploadimg44" value="${hotel.hotelimg4 }">
         </div>
       </div>     
       
   <div class="form-group">
      <label for="textArea" class="col-lg-2 control-label">호텔소개1</label>
      <div class="col-lg-10">
        <textarea class="form-control" rows="2" name="hotelproduce1" id="textArea">
        <c:out value="${hotel.hotelproduce1 }"/>
        
        </textarea>
      </div>
    </div> 
       
   <div class="form-group">
      <label for="textArea" class="col-lg-2 control-label">호텔소개2</label>
      <div class="col-lg-10">
        <textarea class="form-control" rows="2" name="hotelproduce2" id="textArea">
        <c:out value="${hotel.hotelproduce2 }"/>
        </textarea>
      
      </div>
    </div> 
    
    <div class="form-group">
      <label for="textArea" class="col-lg-2 control-label">호텔소개3</label>
      <div class="col-lg-10">
        <textarea class="form-control" rows="2" name="hotelproduce3" id="textArea">
        <c:out value="${hotel.hotelproduce3 }"/>
        </textarea>
        
      </div>
    </div> 
   
   <div class="form-group">
         <label class="col-lg-2 control-label">부대시설</label>
         <div class="col-lg-10">
           <input type="text" class="form-control" name="hotelfacility" value="<c:out value="${hotel.hotelfacility}"/>">
         </div>
       </div>
   
   <div class="form-group" >
      <div class="col-lg-10 col-lg-offset-2" align="right">
        <button type="reset" class="btn btn-default">다시작성하기</button> &nbsp;&nbsp;
        <button type="submit" class="btn btn-primary">호텔정보 수정하기</button>&nbsp;&nbsp;
        <a href="javascript:history.go(-1)" class="btn btn-default">돌아가기</a>	
      </div>
    </div>
   
  </fieldset>
  </form:form>
  </div>
  <div class="col-md-2"></div>
  </div>
  <br><br><br>
    
    
<%@ include file="./../main/main_bottom.jsp"%>       
