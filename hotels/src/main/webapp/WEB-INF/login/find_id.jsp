<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="./../common/common.jsp"%>
<%@ include file="./../main/main_top.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기 페이지</title>
<script type="text/javascript">
<% System.out.println(request.getContextPath());%>
	function gomain(){
		location.href='main.com';
	}
</script>
<link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<br>
	


	
	<div class="col-md-12">
	<br><br><br>
	<div class="col-md-12">
	<div class="col-md-4"></div>
	<div class="col-md-4">
	<fieldset>
	<legend><b>아이디 찾기</b></legend>
		<form:form commandName="member" method="post" action="findID.mem">
			

			<div class="col-md-12">
				<label for="membername"  class="col-lg-3 control-label"><b>이름</b></label> 
				<input type="text" name="membername" placeholder="가입하신 이름을 입력하세요." class="form-control">
			</div>
			
			<div class="col-md-12">
				<label for="memberemail"  class="col-lg-3 control-label"><b>이메일</b></label> 
				<input type="text" name="memberemail" placeholder="가입하신 이메일을 입력하세요." class="form-control">
			</div>
			<div class="col-md-12">
			<br>
			</div>
			<div class="col-md-12" align="right">
				<input type="submit" value="아이디 찾기" class="btn btn-default">&nbsp;&nbsp;
				<input type="button" value="메인으로" onclick="gomain()" class="btn btn-default">
				<br><br><br><br>
			<div class="alert alert-dismissible alert-danger">
  			<button type="button" class="close" data-dismiss="alert">&times;</button>
  			
  			<h4>아이디 찾는 방법!</h4>
  			<p>회원정보에 등록한 이름과 입력한 이메일 주소가 동일해야, 아이디를 찾을 수 있습니다.</p>
			</div>
			</div>
		</form:form>
	</fieldset>	
	<br>
		</div>
		<div class="col-md-4"></div>
		</div>
	</div>
	<br>
	<br> 
	<br> 
	<br> 
	<br> 
</body>
</html>
<%@ include file="./../main/main_bottom.jsp"%>