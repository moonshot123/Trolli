/**
 * main
 */

// 시작
	$(function() {
		// 달력 붙이기
		$('#datePicker').datepicker({
			dateFormat : 'yy-m-d'
		});
	});

	$(function() {
		// 달력 붙이기
		$('#datePicker2').datepicker({
			dateFormat : 'yy-m-d'
		});
	});

	//탑으로 올라가기위한 버튼
	$(document).ready(function() {
		$('#movetopbt').bind('click', function() {
			$(document).animate({
				scrollTop : '0'
			}, 680);
		});
		// 애니메이션 효과로 자연스럽게 이동됨, 0.68초

		$('#movetopbt').on('click', function() {
			$(document).scrollTop('0');
		});
		// 애니메이션 효과없이 즉시 해당 위치 0 지점으로 이동함
	});

	//html4 placeholder
	/* 	$(function(){
	 $("#search_p").attr('placeholder','도시 또는 호텔명을 검색해 보세요.');
	 $("#search_p").style.color("#424242");
	 $("#search_p").css('color','#01DF01');
	 }); */
	
	//alert창 꾸미기
	function alertBox(txt, callbackMethod, jsonData){
		    modal({
		        type: 'alert',
		        title: '알림',
		        text: txt,
		        callback: function(result){
		            if(callbackMethod){
		                callbackMethod(jsonData);
		            }
		        }
		    });
		}
		 
		function alertBoxFocus(txt, obj){
		    modal({
		        type: 'alert',
		        title: '알림',
		        text: txt,
		        callback: function(result){
		            obj.focus();
		        }
		    });
		}
		 
		    
		function confirmBox(txt, callbackMethod, jsonData){
		    modal({
		        type: 'confirm',
		        title: '알림',
		        text: txt,
		        callback: function(result) {
		            if(result){
		                callbackMethod(jsonData);
		            }
		        }
		    });
		}
		 
		function promptBox(txt, callbackMethod, jsonData){
		    modal({
		        type: 'prompt',
		        title: 'Prompt',
		        text: txt,
		        callback: function(result) {
		            if(result){
		                callbackMethod(jsonData);
		            }
		        }
		    });
		}
		 
		function successBox(txt){
		    modal({
		        type: 'success',
		        title: 'Success',
		        text: txt
		    });
		}
		 
		function warningBox(txt){
		    modal({
		        type: 'warning',
		        title: 'Warning',
		        text: txt,
		        center: false
		    });
		}
		 
		function infoBox(txt){
		    modal({
		        type: 'info',
		        title: 'Info',
		        text: txt,
		        autoclose: true
		    });
		}
		 
		function errorBox(txt){
		    modal({
		        type: 'error',
		        title: 'Error',
		        text: txt
		    });
		}
		 
		function invertedBox(txt){
		    modal({
		        type: 'inverted',
		        title: 'Inverted',
		        text: txt
		    });
		}
		 
		function primaryBox(txt){
		    modal({
		        type: 'primary',
		        title: 'Primary',
		        text: txt
		    });
		}

		
		