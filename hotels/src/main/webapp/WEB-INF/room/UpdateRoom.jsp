<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ include file="./../main/main_top.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<c:set var="theroom1" value="http://localhost:9090${pageContext.request.contextPath}/resources/${room.roomimg1}"/>
<c:set var="theroom2" value="http://localhost:9090${pageContext.request.contextPath}/resources/${room.roomimg2}"/>
<body>
	<br><br>
	
	<div class="col-md-12" >
		<div class="col-md-2"></div>
		<div class="col-md-8" id="back_inform">
		
	<h3 style="text-align: center">룸 정보수정</h3>	
	<br><br>		
	<form:form class="form-horizontal"  action="updateRoom2.roo" enctype="multipart/form-data">
  <fieldset>
    	
    	<input type="hidden" name="hotelnum" value="${room.hotelnum}">
    	<input type="hidden" name="roomnum" value="${room.roomnum}">
    	
		<div class="form-group">
	      <label class="col-lg-2 control-label">객실이름</label>
	      <div class="col-lg-10">
	        <input type="text" class="form-control" name="roomname" value="${room.roomname} ">
	        
	      </div>
	    </div>
    
    	<div class="form-group">
	      <label class="col-lg-2 control-label">객실크기</label>
	      <div class="col-lg-10">
	        <input type="text" class="form-control" name="roomsize" value="${room.roomsize}">
	      	
	      </div>
	    </div>
	    
	    
	    <div class="form-group">
      <label class="col-lg-2 control-label">최대수용인원</label>
      <div class="col-lg-10">
        <div class="radio">
          <label>
            <input type="radio" name="roompeople" id="roompeople" value="1" <c:if test="${room.roompeople eq '1'}">checked</c:if>>
            2명
          </label>
        </div>
        <div class="radio">
          <label>
            <input type="radio" name="roompeople" id="roompeople" value="2" <c:if test="${room.roompeople eq '2'}">checked</c:if>>
            4명
          </label>
        </div>
          <div class="radio">
          <label>
            <input type="radio" name="roompeople" id="roompeople" value="3" <c:if test="${room.roompeople eq '3'}">checked</c:if>>
           	 단체
          </label>
        </div>
      </div>
    </div>
	    
	<div class="form-group">
      <label for="textArea" class="col-lg-2 control-label">객실소개1</label>
      <div class="col-lg-10">
        <textarea class="form-control" rows="3" name="roomproduce1" id="roomproduce1" >
        <c:out value="${room.roomproduce1 }"/>
        </textarea>
      </div>
    </div> 
    	
	<div class="form-group">
      <label for="textArea" class="col-lg-2 control-label">객실소개2</label>
      <div class="col-lg-10">
        <textarea class="form-control" rows="3" name="roomproduce2" id="roomproduce2" >
         <c:out value="${room.roomproduce2 }"/>
         </textarea>
        
      </div>
    </div> 
    
    <div class="form-group">
      <label for="textArea" class="col-lg-2 control-label">객실소개3</label>
      <div class="col-lg-10">
        <textarea class="form-control" rows="3" name="roomproduce3" id="roomproduce3" >
        <c:out value="${room.roomproduce3 }"/>
        </textarea>
        
      </div>
    </div> 
	
	<div class="form-group">
	      <label class="col-lg-2 control-label">객실가격</label>
	      <div class="col-lg-10">
	        <input type="text" class="form-control" name="roomprice" value="${room.roomprice}">
	      </div>
	    </div>
	
	<div class="form-group">
	      <label class="col-lg-2 control-label">객실포인트</label>
	      <div class="col-lg-10">
	        <input type="text" class="form-control" name="roompoint" value="${room.roompoint}">
	      </div>
	    </div>
    
    <div class="form-group">
	      <label class="col-lg-2 control-label">숙소사진1</label>
	      <div class="col-lg-10">
	      <img src="${theroom1}" width="100" height="100"><!-- koala.jpg -->
		  <input type="file" class="form-control" name="upload1" value=""><!-- Tulips.jpg -->
		  <input type="hidden" name="roomimg11" value="${room.roomimg1}">
	      </div>
	    </div>
    	
     <div class="form-group">
	      <label class="col-lg-2 control-label">숙소사진2</label>
	      <div class="col-lg-10">
	      
	      <img src="${theroom2}" width="100" height="100"><!-- koala.jpg -->
		  <input type="file" class="form-control" name="upload2" value=""><!-- Tulips.jpg -->
		  <input type="hidden" name="roomimg22" value="${room.roomimg2}">
	      </div>
	    </div>
    
    <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
        <button type="reset" class="btn btn-primary">다시작성하기</button> &nbsp;&nbsp;
        <button type="submit" class="btn btn-primary">룸정보 수정하기</button>
      </div>
    </div>
  	</fieldset>
	</form:form>
							
	</div>
	</div>
	

</body>
</html>