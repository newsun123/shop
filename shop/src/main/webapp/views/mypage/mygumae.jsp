<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    section {
      width:1100px;
      margin:auto;
    }
    section .outer {
      width:900px;
      height:200px;
      border:1px solid green;
      margin:auto;
      padding:10px;
      margin-top:5px;
    }
    section .outer:first-child {
      margin-top:50px;
    }
    section .outer .nalja {
    
    }
    section .outer .bnalja {
    
    }
    section .outer .pro {
    
    }
    section .out .price {
    
    }
    section .outer > div {
      display:inline-block;
    }
    section .outer #left {
      width:700px;
    }
    section .outer #right {
      width:190px;
    }
    section .outer #right input[type=button] {
      margin-top:5px;
      width:100px;
      height:24px;
      border: 1px solid black;
      background: white;
      border-radius:5px;
    }
    section .outer #right input[type=button]:disabled {
      border-color:#dddddd;
    }
    section #head {
      border-bottom:2px solid green;
      margin-top:20px;
    }
  </style>
</head>
<body>
   <section>
     <c:forEach items="${mapall}" var="map">
      <div class="outer">
        <div id="left">
         <div class="nalja"> ${map.writeday} 주문 
         	<!-- state 관련 내용 출력 -->
         	<c:choose>
         	  <c:when test="${map.state==0}">
         	  결제완료
         	  </c:when>
         	  <c:when test="${map.state==1}">
         	  배송중
         	  </c:when>
         	  <c:when test="${map.state==2}">
         	  배송완료
         	  </c:when>
         	  <c:when test="${map.state==3}">
         	  취소신청
         	  </c:when>
         	  <c:when test="${map.state==4}">
         	  취소완료
         	  </c:when>
         	  <c:when test="${map.state==5}">
         	  교환신청	
         	  </c:when>
         	  <c:when test="${map.state==6}">
         	  교환완료
         	  </c:when>
         	  <c:when test="${map.state==7}">
         	  반품신청
         	  </c:when>
         	  <c:when test="${map.state==8}">
         	  반품완료
         	  </c:when>
         	</c:choose>
         </div> 
         <div class="bnalja"> ${map.baeday} ${map.yoil} 도착 </div>
         <div class="pro"> 
           <img src="/static/pro/${map.pimg}" width="100" height="100">
           ${map.title} 
         </div>  
         <div class="price"><fmt:formatNumber value="${map.price-(map.price*map.halin/100)}" type="number" pattern="#,###"/>원 ${map.su}개</div>
        </div>
        <div id="right">
        	<c:if test="${map.state==3}">
	          <input type="button" value="취소신청"><br>
        	</c:if>
        	<c:if test="${map.state!=3}">
	          <input type="button" value="취소신청" disabled><br>
        	</c:if>
        	<c:if test="${map.state==1 || map.state==2}">
	          <input type="button" value="교환신청"><br>
        	</c:if>
        	<c:if test="${map.state!=1 && map.state!=2}">
	          <input type="button" value="교환신청" disabled><br>
        	</c:if>
        	<c:if test="${map.state==2}">
	          <input type="button" value="반품신청"><br>
        	</c:if>
        	<c:if test="${map.state!=2}">
	          <input type="button" value="반품신청" disabled><br>
        	</c:if>
        	<c:if test="${map.state==0}">
	          <input type="button" value="신청취소"><br>
        	</c:if>
        	<c:if test="${map.state!=0}">
	          <input type="button" value="신청취소" disabled><br>
        	</c:if>
        	<c:if test="${map.state==2 && map.sangp==0}">
	          <input type="button" value="상품평"><br>
        	</c:if>
        	<c:if test="${map.state!=2 || map.sangp==1}">
	          <input type="button" value="상품평" disabled><br>
        	</c:if>
        </div>
      </div> 
     </c:forEach>
   </section>
</body>
</html>