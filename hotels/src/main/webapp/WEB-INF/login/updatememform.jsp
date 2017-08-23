<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="./../common/common.jsp"%>
<%@ include file="./../main/main_top.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
<% System.out.println(request.getContextPath());%>
	function gomain(){
		location.href='main.com';
	}
</script>

<link href="resources/css/main.css" rel="stylesheet" type="text/css" />
<link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<style type="text/css">
.err {
	font-size: 9pt;
	color: red;
	font-weight: bold;
}
</style>

</head>
<body>
<div class="col-md-12">

<br>
<div class="col-md-4"></div>	
<div class="col-md-4"><br>
	<legend>회원정보변경</legend>
	<p style="text-align: right;">*는 꼭 입력해주세요.</p>
	
	<div>
	<br><br>
		<form:form commandName="member" method="post" action="updateform.mem" >
			<input type="hidden" name="membernum" value="${member.membernum }">
			
			<table class="rg_table"> 
			
			<tr>
			<td><label for="membername">이름 *</label></td><td><input type="text" name="membername" value="${member.membername }" size="35">
				<Br><form:errors cssClass="err" path="membername" /></td>
			</tr>
			
			<tr>
			<td><label for="memberid">아이디 *</label></td><td><input type="text" name="memberid" value="${member.memberid }" size="35">
				<Br><form:errors cssClass="err" path="memberid" /></td>
			</tr>
			
			<tr>
			<td><label for="memberpw">비밀번호 *</label></td><td><input type="password" name="memberpw" value="${member.memberpw }" size="35">
				<Br><form:errors cssClass="err" path="memberpw" /></td>
			</tr>
			
			<tr>
			<td><label for="memberbirth">생일 *</label></td><td><input type="text" name="memberbirth" placeholder="yyyy-mm-dd 형식으로 적어주세요." value="${member.memberbirth }" size="35">
				<Br><form:errors cssClass="err" path="memberbirth" /></td>
			</tr>
			
			<tr>
			<td><label for="memberemail">이메일 *</label></td><td><input type="text" name="memberemail" value="${member.memberemail }" size="35"><Br>
				<form:errors cssClass="err" path="memberemail" /></td>
			</tr>
			
			<tr>
			<td><label for="agree">이메일 수신</label></td><td>
			<input type="radio" name="memberagree" value="0"  <c:if test="${member.memberagree eq '0'}">checked</c:if>>동의 
			<input type="radio" name="memberagree" value="1"  <c:if test="${member.memberagree eq '1'}">checked</c:if>>거부</td>
			</tr>
			
			<tr>
			<td colspan="2" style="text-align: center;"> 
			<Br><Br>
			<input type="submit" value="회원정보 수정" class="btn btn-success btn-lg btn-block" ><br>
			<input type="button" value="메인으로" onclick="gomain()" class="btn btn-default btn-lg btn-block"> 
			</td>
			</tr>
			<tr>
			<td colspan="2">
			<br><br>
			<p>긴급한 문의사항은 ☎1566-1677로 전화문의 주시기 바랍니다.</p>
			</td>
			</tr>
			</table>
			
		</form:form>
	</div>	
	</div>
	<div class="col-md-4"></div>
	<br>
	
</div>	
</body>
</html>
<%@ include file="./../main/main_bottom.jsp"%>