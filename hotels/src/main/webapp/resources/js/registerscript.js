/*var isCheck=false;
var use; 
var isChange = false;

$(function(){
	alert("js파일 연결");
	$("input[name=mem_id]").keydown(function() {
    	isChange = true;
    	use="";
    	$('#idmessage').css("display","none");
    	var isCheck=false;
	});
});


	
function writeSave(){ 
	
	if($('input[name="mem_id"]').val()==""){
		alert("id를 입력하세요.");
		$('input[name="id"]').focus();
		isChange = false;
		return false;
	}
	if(use=="impossible"){
		alert("이미 사용중인 아이디입니다.");
		return false;
	}
	if(isCheck==false || isChange == true){
		alert("중복체크 하세요.");
		return false;
	}
	if($('input[name="password"]').val()==""){
		alert("비번을 입력하세요.");
		$('input[name="password"]').focus();
		return false;
	}
	
	if($('input[name="repassword"]').val()==""){
		alert("비번확인을 입력하세요.");
		$('input[name="repassword"]').focus();
		return false;
	}
	
	if($('input[name="xxx"]').val()=="YES"){
		alert("YES");
		return true;
	}
	else{
		alert("NO"+"비번 불일치입니다.");
		$('input[name="repassword"]').focus();
		return false;
	}
}


function duplicate(){
	
    	alert($("input[name=mem_id]").val());
    	isCheck=true;
        $.ajax({
	type: "POST",
         url: "id_check.mem?mem_id=$("input[name=mem_id]").val()", //아이디 중복체크할 페이지 지정
         data : ({
        	 mem_id: $("input[name=mem_id]").val() // mem_id=hong
         }),
         success: function (data){ //data=NO YES
           
           if ($('input[name="id"]').val()==""){
        	   $('#idmessage').html("<font color=red>중복 체크 할 id 를 입력 해 주세요</font>");
               $('#idmessage').show();
           }
           else if (jQuery.trim(data)=='YES'){ 
              $('#idmessage').html("<font color=red>사용 가능합니다.</font>");
              $('#idmessage').show(); 
              use = "possible";
              isChange = false;
              
            }else{
            	$('#idmessage').html("<font color=red>이미 사용중인 아이디입니다.</font>");
            	$('#idmessage').show();                
            	use = "impossible";
            }
           } // success의 끝
        });//ajax()의 끝
    
    
} // duplicate의 끝



function passwd_keyup(){
	alert("repw keyup");

	if($("input[name=mem_pw]").val() == $("input[name=repw]").val()){
		$('#pwmessage').html("<font color=red>비번 일치</font>");
		$('#pwmessage').show();
		$('input[name=xxx]').val("YES");
	}
	else{
		$('#pwmessage').html("<font color=red>비번 불일치</font>");
		$('#pwmessage').show();
		$('input[name=xxx]').val("NO");
	
	}
} // passwd_keyup의 끝


*/

