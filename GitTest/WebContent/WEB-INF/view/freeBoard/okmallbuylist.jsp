<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	$( document ).ready(function() {
		add();
	});
	
	function add() {
		
		var j = document.getElementById("true").value;
		var i;
		
		for(i = 1; i <= j; i++){
			var count =parseInt(document.getElementById("count"+i).value);
			//console.log("countbuy:>>>>>" + countbuy);
			var coupondc =parseFloat(document.getElementById("coupondc"+i).value);
			var price = parseInt(document.getElementById("price"+i).value);
			var dc = parseFloat(document.getElementById("discount"+i).value);
			var point = parseInt(document.getElementById("point"+i).value);
			var num = 0;
			
			if(parseInt(coupondc) < 1 ){
				num = (price - (price*(dc+coupondc)))*count -point ;
			}else{
				num = (price - (price*(dc)))*count -coupondc -point ;
			}
			document.getElementById("sum"+i).value = num;
		}
		
	}
	
	function refund(i){//환불시 구매내역 삭제로 변경 아직 안함
		var result = confirm(i+"번 품목을 환불 받으시겠습니까?");
		var point = parseInt(document.getElementById("point"+i).value);
		var	sum = parseInt(document.getElementById("sum"+i).value);
		if(result) { //yes 
			document.getElementById("form"+i).action='./okmallrefund.ino';//여기에 주소
			document.getElementById("form"+i).submit();
			alert("POINT :"+ point + "포인트 \n"
					+ "현금 :"+ sum + "원 \n"
					+"정상적으로 환불 되셨습니다.")
		} else { 
		}
	}
	
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
		<c:forEach  items="${okmallList }" var="dto" varStatus="tablenum">
			<input type="hidden" name=${tablenum.last } id=${tablenum.last } value=${tablenum.count }> 
			<div style=" float: left;">
			</div>
			<c:set var="cname" value="${dto.name }"></c:set>

			<div style="width: 300px; float: center;">테이블 번호: ${tablenum.count }</div>
			<hr style="width: 600px">
			<c:choose>
				<c:when test="${cname=='포인트사용'}">
					<form name="form${tablenum.count }" id="form${tablenum.count }" method="post">
						<input type="hidden" name="num" id="num${tablenum.count }" value=${dto.num }> 
						<input type="hidden" name="name" id="name${tablenum.count }" value=${dto.name }> 
						<input type="hidden" name="price" id="price${tablenum.count }" value=${dto.price }>	
						<input type="hidden" name="discount" id="discount${tablenum.count }" value=${dto.discount }>
						<input type="hidden" name="brand" id="brand${tablenum.count }" value=${dto.brand }> 
						<input type="hidden" name="kind" id="kind${tablenum.count }" value=${dto.kind }> 
						<input type="hidden" name="couponname" id="couponname${tablenum.count }" value=${dto.couponname }> 
						<input type="hidden" name="coupondc" id="coupondc${tablenum.count }" value=${dto.coupondc }> 
						<input type="hidden" name="count" id="count${tablenum.count }" value=${dto.count }> 
						<input type="hidden" name="point" id="point${tablenum.count }" value=${dto.point }> 
						<input type="hidden" name="buydate" id="buydate${tablenum.count }" value=${dto.buydate }> 
						
						<IMG src="img/${dto.name }.jpg" width="300" height="300" border=1 vspace="0" hspace="0" align="left">
						<br>
						<div style="width: 300px; float: left;">사용 일 : ${dto.buydate}</div>
						<br>
						<div style="width: 300px; float: left;">사용포인트: ${dto.point}</div>
						<br>
						<div style="width: 300px; float: left;">
						<input type="hidden" name="sum" id="sum${tablenum.count }"  min="0" readonly> 
						</div>
						<br>
						<div style="width: 300px; float: left;">
						<button id="refund${tablenum.count }" onclick="refund(${tablenum.count });">환불</button>
						</div>
						<br>
					</form>
				</c:when>
				<c:otherwise>
					<form name="form${tablenum.count }" id="form${tablenum.count }" method="post">
						<input type="hidden" name="num" id="num${tablenum.count }" value=${dto.num }> 
						<input type="hidden" name="name" id="name${tablenum.count }" value=${dto.name }> 
						<input type="hidden" name="price" id="price${tablenum.count }" value=${dto.price }>	
						<input type="hidden" name="discount" id="discount${tablenum.count }" value=${dto.discount }>
						<input type="hidden" name="brand" id="brand${tablenum.count }" value=${dto.brand }> 
						<input type="hidden" name="kind" id="kind${tablenum.count }" value=${dto.kind }> 
						<input type="hidden" name="couponname" id="couponname${tablenum.count }" value=${dto.couponname }> 
						<input type="hidden" name="coupondc" id="coupondc${tablenum.count }" value=${dto.coupondc }> 
						<input type="hidden" name="count" id="count${tablenum.count }" value=${dto.count }> 
						<input type="hidden" name="point" id="point${tablenum.count }" value=${dto.point }> 
						<input type="hidden" name="buydate" id="buydate${tablenum.count }" value=${dto.buydate }> 
						
						<a href="./okmalldetail.ino?name=${dto.name }">
						<IMG src="img/${dto.name }.jpg" width="300" height="300" border=1 vspace="0" hspace="0" align="left">
						</a>
						<br>
						<div style="width: 300px; float: left;">구매 일 : ${dto.buydate }</div>
						<br>
						<div style="width: 300px; float: left;">제품명: ${dto.name }</div>
						<br>
						<div style="width: 300px; float: left;">가격:  ${dto.price }</div>
						<br>
						<div style="width: 300px; float: left;">할인율: ${dto.discount*100 } %</div> 
						<br>
						<div style="width: 300px; float: left;">할인가격: ${dto.dp } </div> 
						<br>
						<div style="width: 300px; float: left;">사용한 쿠폰: ${dto.couponname }</div>
						<br>
						<div style="width: 300px; float: left;">구매 수량 : ${dto.count }</div>
						<br>
						<div style="width: 300px; float: left;">사용포인트: ${dto.point }</div>
						<br>
						<div style="width: 300px; float: left;">
						<h3>금액 : <input type="number" name="sum" id="sum${tablenum.count }"  min="0" readonly>원</h3> 
						</div>
						<br>
						
						<div style="width: 300px; float: left;">
						<button id="refund${tablenum.count }" onclick="refund(${tablenum.count });">환불</button>
						</div>
						<br>
					</form>
				</c:otherwise>
			</c:choose>
			<hr style="width: 600px">
		</c:forEach>
</body>
</html>