<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!--  <script type="text/javascript"> 
	function numkeyCheck(e) { 
		var keyValue = event.keyCode; 
		if( ((keyValue >= 48) && (keyValue <= 57)) ) 
			return true; else return false; } 
</script>-->

</head>
<body>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
$( document ).ready(function() {
	$("#couponname").val($("#coupon option:selected").text());
	$("#coupondc").val($("#coupon").val());
	add();
	$("#buy").on("click",function() {		
		buy();
	});
	$("#basketInsert").on("click",function() {		
		basketInsert();
	});
	$("#procom").on("click",function() {		
		cmInsert();
	});
	$("#coupon").on("change",function() {
		$("#couponname").val($("#coupon option:selected").text());
		$("#coupondc").val($("#coupon").val());
		add();
		console.log("name : >>>" + $("#coupon option:selected").text());
		console.log("dc : >>>" +$("#coupon").val());
	});
	
	
});


function add() {
	
	var countbuy =document.getElementById("countbuy").value;
	var pointbuy =parseInt(document.getElementById("pointbuy").value);
	var coupon =parseFloat(document.getElementById("coupon").value);
	var price = ${okMallDto.dto.price};
	var dc = ${okMallDto.dto.discount};
	var num = 0;
	price = parseInt(price);
	dc = parseFloat(dc);
	document.getElementById("point").value = pointbuy;
	document.getElementById("count").value = countbuy;
	//target.options[target.selectedIndex].value
	//var cpv = coupon.options[coupon.selectedIndex].value;
	if(parseInt(coupon) < 1 ){
		num = (price - (price*(dc+coupon)))*countbuy -pointbuy;
	}else{
		num = (price - (price*(dc)))*countbuy -coupon-pointbuy;
	}
	
	document.getElementById("sum").value = num;
}

function buy(){
	var result = confirm("정말사실껍니까???\n현재 금액 :"
			+ document.getElementById("sum").value + "입니다.");
	
	if(result) { //yes 
		document.buyform.action='./okmallbuy.ino';
		document.buyform.submit();
	} else { 
		//no 
	}
	
}

function basketInsert(){
	var result = confirm("현재 구매 설정이 저장됩니다.");
	
	if(result) { //yes 
		document.buyform.action='./okmallbasketInsert.ino';
		document.buyform.submit();
	} else {
		//no 
	}
}
	
function cmInsert(){
	var result = confirm("댓글을 등록하시겠습니까?");
	if(result) { //yes 
		document.buyform.action='./okmallcommentInsert.ino';
		document.buyform.submit();
	} else {
		//no 
	}
}




/*
 합계금액 계산식
 x는 제품 원가  ${okMallDto.dto.price }
 y는 기존 할일율 ${okMallDto.dto.discount*100 }
 z는 쿠폰값  document.getElementById("coupon").value;
 p 포인트 사용값  document.getElementById("point").value;
 c 구매개수  document.getElementById("count").value;
 int num 합계금액 넣을 변수
 1차 기초값구하기*c 
 조건  할인쿠폰 사용여부
 쿠폰 값이 0미만 일때 (%쿠폰이 사용됨ok)
  	num = (x - (x*(y+z)))*c -p
 
 
  	
 1차 그외 금액차감쿠폰(일정금액) 또는 사용안함(0)
  	num = (x - (x*(y)))*c - z -p
 
 
 
 
  
 */


</script>





	<div>
		<h1>OKMALLDIY</h1>
	</div>
	<div style="width:650px;" align="center">
		<input type="button" value="MAIN" onclick="location.href='./okmall.ino'">
		&nbsp;&nbsp;&nbsp;
		<input type="button" value="NIKE" onclick="location.href='./okmallname.ino?name=NIKE'">
		&nbsp;&nbsp;&nbsp;
		<input type="button" value="ADIDAS" onclick="location.href='./okmallname.ino?name=ADIDAS'">
		&nbsp;&nbsp;&nbsp;
		<input type="button" value="NEWBALANCE" onclick="location.href='./okmallname.ino?name=NEWBALANCE'">
		&nbsp;&nbsp;&nbsp;
		<input type="button" value="장바구니" onclick="location.href='./okmallbasket.ino'">
		&nbsp;&nbsp;&nbsp;
		<input type="button" value="구매내역" onclick="location.href='./okmallbuylist.ino'">
	</div>
	<hr style="width: 600px">
		<form name="buyform" id="buyform" method="post">
			<input type="hidden" name="name" id="name" value=${okMallDto.dto.name }> 
			<input type="hidden" name="price" id="price" value=${okMallDto.dto.price }>	
			<input type="hidden" name="discount" id="discount" value=${okMallDto.dto.discount }>
			<input type="hidden" name="brand" id="brand" value=${okMallDto.dto.brand }> 
			<input type="hidden" name="kind" id="kind" value=${okMallDto.dto.kind }> 
			<input type="hidden" name="couponname" id="couponname" > 
			<input type="hidden" name="coupondc" id="coupondc" > 
			<input type="hidden" name="point" id="point" > 
			<input type="hidden" name="count" id="count" > 
			
			<IMG src="img/${okMallDto.dto.name }.jpg" width="300" height="300" border=1 vspace="0" hspace="0" align="left">
			<br>
			<div style="width: 300px; float: left;">제품명: ${okMallDto.dto.name }</div>
			<br>
			<div style="width: 300px; float: left;">가격:  ${okMallDto.dto.price }</div>
			<br>
			<div style="width: 300px; float: left;">할인율: ${okMallDto.dto.discount*100 } %</div> 
			<br>
			<div style="width: 300px; float: left;">할인가격: ${okMallDto.dto.dp } </div> 
			<br>
			<div style="width: 300px; float: left;">보유포인트: ${okMallDto.pdto.point } </div>
			<br>
			<div style="width: 300px; float: left;">
			사용포인트: 
			<input type="number" name="pointbuy" id="pointbuy" min="0" max=${okMallDto.pdto.point } onchange="add()" value="0"><!-- max는 포인트 불러온값으로  -->
			</div>
			<br>
			<div style="width: 300px; float: left;">
			사용가능쿠폰 :
			<select name="coupon" id="coupon">
			<option value="0">사용안함</option>
				<c:forEach items="${okMallDto.cdto }" var="cdto">
					<option value="${cdto.dc }" >${cdto.couponname }</option>
				</c:forEach>
			</select>
			</div>
			<br>
			<div style="width: 300px; float: left;">
			구매 수량 : <input type="number" name="countbuy" id="countbuy" min="0" onchange="add()" value="0">
			</div>
			<br>
			<div style="width: 300px; float: left;">
			<h3>금액 : <input type="number" name="sum" id="sum"  min="0" readonly>원</h3> 
			</div>
			<br>
			<div style="width: 300px; float: left;">
			<input type="button" value="구매" id="buy"/>
			<input type="button" value="장바구니"  id="basketInsert" />
			<!-- onclick="location.href='./okmallbasketInsert.ino'" -->
			</div>
			<br>
			<hr style="width: 600px">
			<!--  댓글작성 기능 -->
			<input type="hidden" name="comname" id="comname" value=${okMallDto.dto.name }> 
			<div style="width: 150px; float: left;">평점 주기 :</div>
			<div style="width: 200px;">
				<input type="radio" name="comgrade" value="1">★☆☆☆☆<br>
				<input type="radio" name="comgrade" value="2">★★☆☆☆<br>
				<input type="radio" name="comgrade" value="3">★★★☆☆<br>
				<input type="radio" name="comgrade" value="4">★★★★☆<br>
				<input type="radio" name="comgrade" value="5">★★★★★<br>
			</div>
			<br>
			<div style="width: 150px; float: left;">댓글 쓰기 :</div>
			<div style="width: 500px; float: left;" align="left">
				<textarea name="comvalue" rows="5" cols="65"  ></textarea>
			</div>
			<input type="button" name="procom" id="procom" value="등록하기"/>
		</form>
	<hr style="width: 600px">
	<!--  댓글이 있으면 화면에 뿌려준다.-->
	<c:forEach items="${okMallDto.pcdto }" var="pcdto">
		<form name="commentview">
		<div style="width: 150px; float: left;">평점 주기 :</div>
		<div style="width: 500px; float: left;" align="left">
			<c:choose>
				<c:when test="${pcdto.comgrade == '1' }">
					★☆☆☆☆
				</c:when>
				<c:when test="${pcdto.comgrade == '2' }">
					★★☆☆☆
				</c:when>
				<c:when test="${pcdto.comgrade == '3' }">
					★★★☆☆
				</c:when>
				<c:when test="${pcdto.comgrade == '4' }">
					★★★★☆
				</c:when>
				<c:when test="${pcdto.comgrade == '5' }">
					★★★★★
				</c:when>
			</c:choose>
	<!-- 	<c:if test="${pcdto.comgrade == 1 } ">
			★☆☆☆☆
			</c:if>
			<c:if test="${pcdto.comgrade == 2}">
			★★☆☆☆
			</c:if>
			<c:if test="${pcdto.comgrade == 3} ">
			★★★☆☆
			</c:if>
			<c:if test="${pcdto.comgrade == 4} ">
			★★★★☆
			</c:if>
			<c:if test="${pcdto.comgrade == 5}">
			★★★★★
			</c:if> -->
		</div>
		<br>
		<div style="width: 150px; float: left;">댓글 내용 :</div>
		<div style="width: 500px; float: left;" align="left">
			${pcdto.comvalue}
		</div>
		
		<hr style="width: 600px">
		</form>
	</c:forEach>
	
	



 
	
	
</body>
</html>