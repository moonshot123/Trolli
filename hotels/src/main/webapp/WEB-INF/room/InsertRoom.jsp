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
<body>
	<br><br>
	
	<div class="col-md-12" >
		<div class="col-md-2"></div>
		<div class="col-md-8" id="back_inform">
		
	<h3 style="text-align: center">룸 정보입력</h3>	
	<br><br>		
	<form:form class="form-horizontal" action="insertRoom2.roo" 
	enctype="multipart/form-data">
  <fieldset>
    	
    	<input type="hidden" name="hotelnum" value="${hotelnum }">
    	
		<div class="form-group">
	      <label class="col-lg-2 control-label">객실이름</label>
	      <div class="col-lg-10">
	        <input type="text" class="form-control" name="roomname" placeholder="객실이름을 입력하세요.">
	        
	      </div>
	    </div>
    
    	<div class="form-group">
	      <label class="col-lg-2 control-label">객실크기</label>
	      <div class="col-lg-10">
	        <input type="text" class="form-control" name="roomsize" placeholder="객실크기를 입력하세요">
	      	
	      </div>
	    </div>
	    
	    
	    <div class="form-group">
    <label class="col-lg-2 control-label">최대수용인원</label>
     <div class="col-lg-10">
        <div class="radio">
          <label>
            <input type="radio" name="roompeople" id="roompeople" value="1" checked="">
            2명
          </label>
        </div>
        <div class="radio">
          <label>
            <input type="radio" name="roompeople" id="roompeople" value="2">
            4명
          </label>
        </div>
          <div class="radio">
          <label>
            <input type="radio" name="roompeople" id="roompeople" value="3">
           	 단체
          </label>
        </div>
      </div>
    </div>
	    
	<div class="form-group">
      <label for="textArea" class="col-lg-2 control-label">객실소개1</label>
      <div class="col-lg-10">
        <textarea class="form-control" rows="2" name="roomproduce1" id="roomproduce1"></textarea>
        <span class="help-block">객실소개를 입력해주세요.</span>
      </div>
    </div> 
    	
	<div class="form-group">
      <label for="textArea" class="col-lg-2 control-label">객실소개2</label>
      <div class="col-lg-10">
        <textarea class="form-control" rows="2" name="roomproduce2" id="roomproduce2"></textarea>
        <span class="help-block">객실소개를 입력해주세요.</span>
      </div>
    </div> 
    
    <div class="form-group">
      <label for="textArea" class="col-lg-2 control-label">객실소개3</label>
      <div class="col-lg-10">
        <textarea class="form-control" rows="2" name="roomproduce3" id="roomproduce3"></textarea>
        <span class="help-block">객실소개를 입력해주세요.</span>
      </div>
    </div> 
	
	<div class="form-group">
	      <label class="col-lg-2 control-label">객실가격</label>
	      <div class="col-lg-10">
	        <input type="text" class="form-control" name="roomprice" placeholder="객실가격을 입력하세요.">
	      </div>
	    </div>
	
	<div class="form-group">
	      <label class="col-lg-2 control-label">객실포인트</label>
	      <div class="col-lg-10">
	        <input type="text" class="form-control" name="roompoint" placeholder="객실포인트를 입력하세요.">
	      </div>
	    </div>
    
    <div class="form-group">
	      <label class="col-lg-2 control-label">숙소사진1</label>
	      <div class="col-lg-10">
	        <input type="file" class="form-control" name="upload1" >
	      </div>
	    </div>
    
    <div class="form-group">
	      <label class="col-lg-2 control-label">숙소사진2</label>
	      <div class="col-lg-10">
	        <input type="file" class="form-control" name="upload2" >
	      </div>
	    </div>
    
    <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
        <button type="reset" class="btn btn-primary">다시작성하기</button> &nbsp;&nbsp;
        <button type="submit" class="btn btn-primary">룸정보 올리기</button>
      </div>
    </div>
  	</fieldset>
	</form:form>
							
	</div>
	</div>
	

</body>
</html>