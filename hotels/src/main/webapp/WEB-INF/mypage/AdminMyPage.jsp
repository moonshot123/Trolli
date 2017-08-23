<%@page import="member.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
<script src="http://cdn.oesmith.co.uk/morris-0.4.1.min.js"></script>

<meta charset="UTF-8">

<head>
<title>Insert title here</title>

</head>
<body>

	<div class="col-md-12"> 
	
		<div class="col-md-1"></div>
			<div class="col-md-10">
			<div><img src="resources/images/admin.jpg"></div>
			<br>
			<legend><b>관리자 페이지</b></legend>
     
         <br><br>
         <h3 class="text-trolli">기본회원정보</h3>
         
         <table class="table table-striped table-hover ">
           
           <thead>
             <tr>
               <th></th>
               <th></th>
             </tr>
           </thead>
           <tbody>
               <tr class="active">
               <td>회원이름</td>
               <td>${loginfo.membername}</td>
             </tr>
              
              <tr class="active">
               <td>회원아이디</td>
               <td>${loginfo.memberid}</td>
             </tr>
             
             <tr class="active">
               <td>회원등급</td>
               <td>
                <c:set var="name" value="${loginfo.logincheck}" />
               <c:choose>
                   <c:when test="${name eq '3'}">
                       일반회원입니다.
                   </c:when>
               
                   <c:when test="${name eq '2'}">
                       호스트회원입니다.
                   </c:when>
                  
                   <c:otherwise>
                       관리자입니다.
                   </c:otherwise>
               </c:choose>
               </td>
             </tr>
             
             <tr class="active">
               <td>이메일</td>
               <td>${loginfo.memberemail}</td>
             </tr>
             
             <tr class="active">
               <td>생일</td>
               <td>${loginfo.memberbirth}</td>
             </tr>
             
           </tbody>
         </table> 
         <br><br><br>
      </div>
   </div>
   
   
   <!-- //회원리스트 -->
   
   <div class="col-md-12" >
   
   <div class="col-md-1"></div>
   <div class="col-md-10">
   <h3 class="text-trolli">회원정보리스트</h3>
   <div class="col-md-12" align="center">   
   
    
   <table class="table table-striped table-hover ">
     <thead>
         <tr>
            <td colspan="8" align="right">
            
            </td>
         </tr>
         <tr align="center">
            <th><span>회원번호&nbsp;&nbsp;</span></th>
            <th><span>이름&nbsp;&nbsp;</span></th>
            <th><span>회원등급&nbsp;&nbsp;</span></th>
            <th><span>회원아이디&nbsp;&nbsp;</span></th>
            <th><span>이메일&nbsp;&nbsp;</span></th>
            <th><span>생일&nbsp;&nbsp;</span></th>
            <th><span>포인트&nbsp;&nbsp;</span></th>
         </tr>
    </thead>
    <tbody>
         <c:forEach items="${allmemberlist}" var="member">
         <tr>
            <td><c:out value="${member.membernum}"/></td>
            <td><c:out value="${member.membername }"/></td>
            <td><c:out value="${member.logincheck }"/></td>
            <td><c:out value="${member.memberid }"/></td>
            <td><c:out value="${member.memberemail }"/></td>
            <td><c:out value="${member.memberbirth }"/></td>
            <td><c:out value="${member.memberpoint }"/></td>
         </tr>
         </c:forEach>
      </tbody>
      </table>
      <center>${pageInfo.pagingHtml }</center>
      <br><br><br>
      </div>
      </div>
   <div class="col-md-1"></div>
         
   </div>
   <!-- // -->
   
   
   
   
   
   <!-- //호텔리스트 -->
   
   <div class="col-md-12" >
   
   <div class="col-md-1"></div>
   <div class="col-md-10">
   <h3 class="text-trolli">호텔정보리스트</h3>
   <div class="col-md-12" align="center">   
   
    
   <table class="table table-striped table-hover ">
     <thead>
         <tr>
            <td colspan="8" align="right">
            
            </td>
         </tr>
         <tr align="center">
            <th><span>호텔번호&nbsp;&nbsp;</span></th>
            <th><span>사업자등록번호&nbsp;&nbsp;</span></th>
            <th><span>숙소카테고리&nbsp;&nbsp;</span></th>
            <th><span>호텔이름&nbsp;&nbsp;</span></th>
            <th><span>호텔주소&nbsp;&nbsp;</span></th>
            <th><span>평점&nbsp;&nbsp;</span></th>
         </tr>
    </thead>
    <tbody>
         <c:forEach items="${allHotellist}" var="hotel">
         <tr>
            <td><c:out value="${hotel.hotelnum}"/></td>
            <td><c:out value="${hotel.companyregnum }"/></td>
            <td><c:out value="${hotel.hotelcategory }"/></td>
            <td><c:out value="${hotel.hotelname }"/></td>
            <td><c:out value="${hotel.hoteladdr }"/></td>
            <td><c:out value="${hotel.hotelscore }"/></td>
         </tr>
         </c:forEach>
      </tbody>
      </table>
      <center>${pageInfo2.pagingHtml }</center>
      <br><br><br>
      </div>
      </div>
      <div class="col-md-1"></div>   
      </div>
   <!-- // -->
   
   
   
   <br><br>
   <div class="col-md-12"> 
   
      <div class="col-md-1"></div>
      <div class="col-md-10">
      
      <c:set value="0" var="admin"/>
      <c:set value="0" var="host"/>
      <c:set value="0" var="basic"/>
      
      <c:forEach items="${allmemberlist2}" var="member">
         <c:if test="${member.logincheck eq '1'}">
            <c:set value="${admin+1}" var="admin"/>
         </c:if>
         <c:if test="${member.logincheck eq '2'}">
            <c:set value="${host+1}" var="host"/>
         </c:if>
         <c:if test="${member.logincheck eq '3'}">
            <c:set value="${basic+1}" var="basic"/>
         </c:if>
      </c:forEach>
      
      
      
      <!-- ============================== -->
      
      
      <c:set value="0" var="hotel"/>
      <!-- int hotel  = 0; -->
      <c:set value="0" var="motel"/>
      <c:set value="0" var="guesthouse"/>
      
      <c:forEach items="${allHotellist2}" var="category">
         <c:if test="${category.hotelcategory eq 'hotel'}">
            <c:set value="${hotel+1}" var="hotel"/>
         </c:if>
         <c:if test="${category.hotelcategory eq 'motel'}">
            <c:set value="${motel+1}" var="motel"/>
         </c:if>
         <c:if test="${category.hotelcategory eq 'guesthouse'}">
            <c:set value="${guesthouse+1}" var="guesthouse"/>
         </c:if>
      </c:forEach>
      
      
   <!-- ============================== -->
   <%--       
   ${reservationdata}
   --%>
   
   <c:set value="0" var="se"/>
   <c:set value="0" var="je"/>
   <c:set value="0" var="bu"/>
   
   <c:set value="0" var="semoney"/>
   <c:set value="0" var="jemoney"/>
   <c:set value="0" var="bumoney"/>   
      
   
   <c:forEach items="${reservationdata}" var="data">
      <c:if test="${fn:contains(data.place,'서울') }">
         <c:set value="${se+1}" var="se"/>
         <c:set value="${semoney+data.totalpay}" var="semoney"/>
      </c:if>
      <c:if test="${fn:contains(data.place,'제주') }">
         <c:set value="${je+1}" var="je"/>
         <c:set value="${jemoney+data.totalpay}" var="jemoney"/>
      </c:if>
      <c:if test="${fn:contains(data.place,'부산') }">
         <c:set value="${bu+1}" var="bu"/>
         <c:set value="${bumoney+data.totalpay}" var="bumoney"/>
      </c:if>
   </c:forEach>
   

<!-- ============================== -->


   <c:set value="0" var="b1"/>
   <c:set value="0" var="b2"/>
   <c:set value="0" var="b3"/>
   <c:set value="0" var="b4"/>
   <c:set value="0" var="b5"/>
   <c:set value="0" var="b6"/>
   <c:set value="0" var="b7"/>
   <c:set value="0" var="b8"/>
   <c:set value="0" var="b9"/>
   <c:set value="0" var="b10"/>
   <c:set value="0" var="b11"/>
   <c:set value="0" var="b12"/>

   <c:set value="0" var="s1"/>
   <c:set value="0" var="s2"/>
   <c:set value="0" var="s3"/>
   <c:set value="0" var="s4"/>
   <c:set value="0" var="s5"/>
   <c:set value="0" var="s6"/>
   <c:set value="0" var="s7"/>
   <c:set value="0" var="s8"/>
   <c:set value="0" var="s9"/>
   <c:set value="0" var="s10"/>
   <c:set value="0" var="s11"/>
   <c:set value="0" var="s12"/>

   <c:set value="0" var="j1"/>
   <c:set value="0" var="j2"/>
   <c:set value="0" var="j3"/>
   <c:set value="0" var="j4"/>
   <c:set value="0" var="j5"/>
   <c:set value="0" var="j6"/>
   <c:set value="0" var="j7"/>
   <c:set value="0" var="j8"/>
   <c:set value="0" var="j9"/>
   <c:set value="0" var="j10"/>
   <c:set value="0" var="j11"/>
   <c:set value="0" var="j12"/>


<%-- ${adminstatic} --%>

 <c:forEach items="${adminstatic}" var="ad">
	
	<c:choose> 
	
	<c:when test="${fn:contains(ad.place,'서울')}"> 
		<c:choose>
			<c:when test="${fn:contains(ad.month,'01')}"> 
				 <c:set value="${s1+ad.count}" var="s1"/>			
			</c:when>
			<c:when test="${fn:contains(ad.month,'02')}"> 
				 <c:set value="${s2+ad.count}" var="s2"/>			
			</c:when>
			<c:when test="${fn:contains(ad.month,'03')}"> 
				 <c:set value="${s3+ad.count}" var="s3"/>			
			</c:when>
			<c:when test="${fn:contains(ad.month,'04')}"> 
				 <c:set value="${s4+ad.count}" var="s4"/>			
			</c:when>
			<c:when test="${fn:contains(ad.month,'05')}"> 
				 <c:set value="${s5+ad.count}" var="s5"/>			
			</c:when>
			<c:when test="${fn:contains(ad.month,'06')}"> 
				 <c:set value="${s6+ad.count}" var="s6"/>			
			</c:when>
			<c:when test="${fn:contains(ad.month,'07')}"> 
				 <c:set value="${s7+ad.count}" var="s7"/>			
			</c:when>
			<c:when test="${fn:contains(ad.month,'08')}"> 
				 <c:set value="${s8+ad.count}" var="s8"/>			
			</c:when>
			<c:when test="${fn:contains(ad.month,'09')}"> 
				 <c:set value="${s9+ad.count}" var="s9"/>			
			</c:when>
			<c:when test="${fn:contains(ad.month,'10')}"> 
				 <c:set value="${s10+ad.count}" var="s10"/>			
			</c:when>
			<c:when test="${fn:contains(ad.month,'11')}"> 
				 <c:set value="${s11+ad.count}" var="s11"/>			
			</c:when>
			<c:when test="${fn:contains(ad.month,'12')}"> 
				 <c:set value="${s12+ad.count}" var="s12"/>			
			</c:when>
		</c:choose>
	
	</c:when> 
	
	<c:when test="${fn:contains(ad.place,'제주')}"> 
		<c:choose>
			<c:when test="${fn:contains(ad.month,'01')}"> 
				 <c:set value="${j1+ad.count}" var="j1"/>			
			</c:when>
			<c:when test="${fn:contains(ad.month,'02')}"> 
				 <c:set value="${j2+ad.count}" var="j2"/>			
			</c:when>
			<c:when test="${fn:contains(ad.month,'03')}"> 
				 <c:set value="${j3+ad.count}" var="j3"/>			
			</c:when>
			<c:when test="${fn:contains(ad.month,'04')}"> 
				 <c:set value="${j4+ad.count}" var="j4"/>			
			</c:when>
			<c:when test="${fn:contains(ad.month,'05')}"> 
				 <c:set value="${j5+ad.count}" var="j5"/>			
			</c:when>
			<c:when test="${fn:contains(ad.month,'06')}"> 
				 <c:set value="${j6+ad.count}" var="j6"/>			
			</c:when>
			<c:when test="${fn:contains(ad.month,'07')}"> 
				 <c:set value="${j7+ad.count}" var="j7"/>			
			</c:when>
			<c:when test="${fn:contains(ad.month,'08')}"> 
				 <c:set value="${j8+ad.count}" var="j8"/>			
			</c:when>
			<c:when test="${fn:contains(ad.month,'09')}"> 
				 <c:set value="${j9+ad.count}" var="j9"/>			
			</c:when>
			<c:when test="${fn:contains(ad.month,'10')}"> 
				 <c:set value="${j10+ad.count}" var="j10"/>			
			</c:when>
			<c:when test="${fn:contains(ad.month,'11')}"> 
				 <c:set value="${j11+ad.count}" var="j11"/>			
			</c:when>
			<c:when test="${fn:contains(ad.month,'12')}"> 
				 <c:set value="${j12+ad.count}" var="j12"/>			
			</c:when>
		</c:choose>
	</c:when> 
	
	<c:otherwise> 
		
		<c:choose>
			<c:when test="${fn:contains(ad.month,'01')}"> 
				 <c:set value="${b1+ad.count}" var="b1"/>			
			</c:when>
			<c:when test="${fn:contains(ad.month,'02')}"> 
				 <c:set value="${b2+ad.count}" var="b2"/>			
			</c:when>
			<c:when test="${fn:contains(ad.month,'03')}"> 
				 <c:set value="${b3+ad.count}" var="b3"/>			
			</c:when>
			<c:when test="${fn:contains(ad.month,'04')}"> 
				 <c:set value="${b4+ad.count}" var="b4"/>			
			</c:when>
			<c:when test="${fn:contains(ad.month,'05')}"> 
				 <c:set value="${b5+ad.count}" var="b5"/>			
			</c:when>
			<c:when test="${fn:contains(ad.month,'06')}"> 
				 <c:set value="${b6+ad.count}" var="b6"/>			
			</c:when>
			<c:when test="${fn:contains(ad.month,'07')}"> 
				 <c:set value="${b7+ad.count}" var="b7"/>			
			</c:when>
			<c:when test="${fn:contains(ad.month,'08')}"> 
				 <c:set value="${b8+ad.count}" var="b8"/>			
			</c:when>
			<c:when test="${fn:contains(ad.month,'09')}"> 
				 <c:set value="${b9+ad.count}" var="b9"/>			
			</c:when>
			<c:when test="${fn:contains(ad.month,'10')}"> 
				 <c:set value="${b10+ad.count}" var="b10"/>			
			</c:when>
			<c:when test="${fn:contains(ad.month,'11')}"> 
				 <c:set value="${b11+ad.count}" var="b11"/>			
			</c:when>
			<c:when test="${fn:contains(ad.month,'12')}"> 
				 <c:set value="${b12+ad.count}" var="b12"/>			
			</c:when>
		</c:choose>
	</c:otherwise> 
	
	</c:choose>
	
 </c:forEach>


<%--   서울 8월: ${s8}
  제주 7월: ${j7} --%>
   
   
   <h3 class="text-trolli">현재현황</h3>
   
   <div class="col-md-12">
      
      <div class="col-md-12">
         <div class="col-md-4">
         <h2>총회원수 : ${allmemberlist2.size()}</h2>
         
         <div id="donut-member" ></div>
         </div>
         
         <div class="col-md-4">
         <h2>총숙소수 : ${allHotellist2.size()}</h2> 
         
         
         <div id="donut-hotel" ></div>
         </div>
            
         <div class="col-md-4">
         <h2>총결제건수 : ${reservationdata.size()}</h2> 
         
         
         <div id="donut-pay" ></div>
         
         </div>
         
      </div>
   </div>
   <!-- 도넛끝 -->
   
   
   
   <div class="col-md-12">
   <h3 class="text-trolli">기간별 결제건수</h3>
      <div class="col-md-1"></div>
         <div class="col-md-12"><br>
         
      <h5>총결제수 :  ${reservationdata.size()}</h5> 
      <h5>서울 : ${s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12}</h5>
      <h5>제주 : ${j1+j2+j3+j4+j5+j6+j7+j8+j9+j10+j11+j12}</h5>
      <h5>부산 : ${b1+b2+b3+b4+b5+b6+b7+b8+b9+b10+b11+b12}</h5>
      <div class="col-md-12" >
         <div id="line-example" ></div>
      </div>
      </div>
      
      <div class="col-md-1"></div>
   </div>
   <!-- 라인그래프끝 -->
   
   
   
   <div class="col-md-12" >
   <br><br><br><br>
      <h3 class="text-trolli">결제 건수 및 매출</h3>   
   <div class="col-md-5">
   <h3>매출 : ${semoney+bumoney+jemoney}</h3>
   <div id="bar-example"></div></div>
   <div class="col-md-2"></div>
   <div class="col-md-5">
   <h3>결제건수 : ${reservationdata.size()}</h3>   
   <div id="bar-example1"></div></div>   
   </div>  
   <!-- 막대그래프끝 -->
   
   </div>
</div>   
   
         
<script type="text/javascript">
$(window).load(function(){
   
   Morris.Donut({
        element: 'donut-member',
        data: [
          {label: "관리자", value: ${admin }},   
          {label: "일반회원", value: ${basic }},
          {label: "호스트회원", value: ${host }} 
        ]  
   });        
   
   
   Morris.Donut({
        element: 'donut-hotel',
        data: [
          {label: "게스트하우스", value: ${guesthouse}}, 
          {label: "모텔", value: ${motel}},
          {label: "호텔", value: ${hotel}}
        ]
   });
   
   
   Morris.Donut({
        element: 'donut-pay',
        data: [
          {label: "서울", value: ${se}}, 
          {label: "부산", value: ${bu}},
          {label: "제주도", value: ${je}}
        ]  
   });
   
   
   
   Morris.Line({
        element: 'line-example',
        data: [
          { y: '2017-01', a: ${s1}, b: ${j1}, c:${b1} },
          { y: '2017-02', a: ${s2},  b: ${j2}, c:${b2} },
          { y: '2017-03', a: ${s3},  b: ${j3}, c:${b3} },
          { y: '2017-04', a: ${s4},  b: ${j4}, c:${b4} },
          { y: '2017-05', a: ${s5},  b: ${j5}, c:${b5} },
          { y: '2017-06', a: ${s6},  b: ${j6}, c:${b6} },
          { y: '2017-07', a: ${s7}, b: ${j7}, c:${b7} },
          { y: '2017-08', a: ${s8}, b: ${j8}, c:${b8} },
          { y: '2017-09', a: ${s9}, b: ${j9}, c:${b9} },
          { y: '2017-10', a: ${s10}, b: ${j10}, c:${b10} },
          { y: '2017-11', a: ${s11}, b: ${j11}, c:${b11} },
          { y: '2017-12', a: ${s12}, b: ${j12}, c:${b12} }
        ],
        xkey: 'y',
        ykeys: ['a', 'b', 'c'],
        labels: ['서울', '제주도','부산']
      });
   });  


   Morris.Bar({
        element: 'bar-example',
        data: [
          { y: '총매출', a: ${semoney}+${bumoney}+${jemoney} },
          { y: '서울', a: ${semoney} },
          { y: '부산', a:${bumoney} },
          { y: '제주도', a: ${jemoney}  },
        ],
        xkey: 'y',
        ykeys: ['a'],
        labels: ['매출']
   });
   
   

   Morris.Bar({
        element: 'bar-example1',
        data: [
          { y: '총결제건수',  b: ${reservationdata.size()} },
          { y: '서울',   b: ${se} },
          { y: '부산',   b: ${bu} },
          { y: '제주도',  b: ${je} },
        ],
        xkey: 'y',
        ykeys: [ 'b'],
        labels: [ '결제건수']
   });
   
</script>   
   
   
   
</body>
</html>