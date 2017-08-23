<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../main/main_top.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>호텔 정보입력</title>
<style type="text/css">
.err{
	font-size: 9pt;
	color: red;
	font-weight: bold;
}
</style>
<script type="text/javascript">

//사업자 등록번호 중복체크
var checkFlag = false;
var isChange = false;

    var companyCheck = function(){
		
    	var http;
    	var companyregnum = $("#companyregnum").val();
    	var url = "checkccc.hot";
    	url+="?companyregnum="+companyregnum;
    	
    	if(window.XMLHttpRequest){ //사파리 등등
    	  http = new XMLHttpRequest();
    	}else if(window.ActiveXObject){ //익스플로어 8.0.....
    	  http = new ActiveXObject();
    	}
    	
    	http.onreadystatechange = function(){
    	  if(this.readyState==4){// 1,2,3,4
    		   
    	    if(this.status == 200){ //성공시
    	    	
    	  var checkJson = JSON.parse(this.responseText);
    	  alert(checkJson["cnt"]);

    	  
    	      if(checkJson["cnt"]==0){
            	   alert("없다");
    	    	  $('#idmessage').html("<font color=blue>사용 가능한 번호 입니다.</font>");
    	    	  $('#idmessage').show();
                  
                  isChange=true;
                  checkFlag = true;
    	      }
              else{
            	alert("있다");
            	$('#idmessage').html("<font color=red>이미 사용중인 번호 입니다. 다시 입력해 주세요.</font>");
            	$('#idmessage').show();
               
                checkFlag = true;
                isChange=false;
              }
    	    }else{
    	    	alert("페이지오류");	
    	    }
    	  }
    	}
    	
    	  http.open("POST", url, true);
    	  http.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    	  http.send();
    };
    var check = function(){
    	if(checkFlag==false){
    		alert("중복체크를 눌러주세요");
    	return false;
    	}
    	if(isChange==false){
    		alert("중복된 번호는 등록 불가");
    		return false;
    	}
    }




</script>
</head>

   <br><br><br><br>
   
   <div class="col-md-12">
      <div class="col-md-2"></div>
      <div class="col-md-8">
      
   <h3 style="text-align: center">호텔 정보입력</h3>   
   <br><br>      
<form:form  class="form-horizontal" commandName="hotel" action="hotelinsert.hot" method="post" onsubmit="return check()" enctype="multipart/form-data">   
  <fieldset>
    <input id="disabledInput" type="hidden" name="membernum" value="${loginfo.membernum}">

      <div class="form-group">
         <label class="col-lg-2 control-label">사업자등록번호</label>
         <div class="col-lg-10">
           <input type="text" class="form-control" name="companyregnum" id="companyregnum">
           <button type="button" id="checkbtn" class="btn btn-primary btn-sm" onclick="companyCheck()">중복체크</button>
           <br>
				<form:errors cssClass="err" path="companyregnum" />
				<p id="idmessage"/>
         </div>
       </div>
    
      <div class="form-group">
      <label class="col-lg-2 control-label">호텔카테고리</label>
      <div class="col-lg-10">
        <div class="radio">
          <label>
            <input type="radio" name="hotelcategory" id="hotel" value="hotel" checked="">
            	hotel
          </label>
        </div>
        <div class="radio">
          <label>
            <input type="radio" name="hotelcategory" id="motel" value="motel">
               motel
          </label>
        </div>
        <div class="radio">
          <label>
            <input type="radio" name="hotelcategory" id="guesthouse" value="guesthouse">
               guesthouse
          </label>
        </div>
        
        
          
      </div>
    </div>
       
         <div class="form-group">
         <label class="col-lg-2 control-label">호텔이름</label>
         <div class="col-lg-10">
           <input type="text" class="form-control" name="hotelname" placeholder="숙소이름을 입력하세요.">
           <br>
				<form:errors cssClass="err" path="hotelname" />
         </div>
       </div>
       
         <div class="form-group">
         <label class="col-lg-2 control-label">호텔주소</label>
         <div class="col-lg-10">
			
		<input type="text" class="form-control" name="hoteladdr" placeholder="주소를 입력하세요.">
         <br>
				<form:errors cssClass="err" path="hoteladdr" />
       </div>
		</div>    
   <div class="form-group">
         <label class="col-lg-2 control-label">호텔사진1</label>
         <div class="col-lg-10">
           <input type="file" class="form-control" name="uploadimg1" >
         </div>
       </div>
    
     <div class="form-group">
         <label class="col-lg-2 control-label">호텔사진2</label>
         <div class="col-lg-10">
           <input type="file" class="form-control" name="uploadimg2" >
         </div>
       </div> 
    
       <div class="form-group">
         <label class="col-lg-2 control-label">호텔사진3</label>
         <div class="col-lg-10">
           <input type="file" class="form-control" name="uploadimg3" >
         </div>
       </div>   
       
       <div class="form-group">
         <label class="col-lg-2 control-label">호텔사진4</label>
         <div class="col-lg-10">
           <input type="file" class="form-control" name="uploadimg4" >
         </div>
       </div>   
       
   <div class="form-group">
      <label for="textArea" class="col-lg-2 control-label">호텔소개1</label>
      <div class="col-lg-10">
        <textarea class="form-control" rows="2" name="hotelproduce1" id="textArea"></textarea>
        <span class="help-block">호텔소개를 입력해주세요.</span>
      </div>
    </div> 
       
   <div class="form-group">
      <label for="textArea" class="col-lg-2 control-label">호텔소개2</label>
      <div class="col-lg-10">
        <textarea class="form-control" rows="2" name="hotelproduce2" id="textArea"></textarea>
        <span class="help-block">호텔소개를 입력해주세요.</span>
      </div>
    </div> 
    
    <div class="form-group">
      <label for="textArea" class="col-lg-2 control-label">호텔소개3</label>
      <div class="col-lg-10">
        <textarea class="form-control" rows="2" name="hotelproduce3" id="textArea"></textarea>
        <span class="help-block">호텔소개를 입력해주세요.</span>
      </div>
    </div> 
   
   <div class="form-group">
         <label class="col-lg-2 control-label">부대시설</label>
         <div class="col-lg-10">
           <input type="text" class="form-control" name="hotelfacility" placeholder="부대시설을 입력하세요.">
         </div>
       </div>
   
   <div class="form-group" >
      <div class="col-lg-10 col-lg-offset-2" align="right">
        <button type="reset" class="btn btn-default">다시작성하기</button> &nbsp;&nbsp;
        <button type="submit" class="btn btn-primary">호텔정보 올리기</button>&nbsp;&nbsp;
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
