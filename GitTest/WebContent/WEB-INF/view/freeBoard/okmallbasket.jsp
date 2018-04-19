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
		var j = document.getElementById("true").value;
		for(var i = 1; i <= j; i++){
			$("#couponname"+i).val($("#coupon"+i+" option:selected").text());
			$("#coupondc"+i).val($("#coupon"+i).val());
		}
		
		add();
		addall();
		
		for(var i = 1; i <= j; i++){
			$("#coupon"+i).on("change",function() {
				$("#couponname"+i).val($("#coupon"+i+" option:selected").text());
				$("#coupondc"+i).val($("#coupon"+i).val());
				add();
				addall();
			});
		}
		
		$("#basketBuy").on("click",function() {
			var result = confirm("정말사실껍니까???\n현재 금액 :"
					+ document.getElementById("allsum").value + "입니다.");
			var chk = document.getElementsByName("chkone");
			var len = chk.length;
			
			if(result){
				var pointp = document.getElementById("point").value;;
				var couponp = 0;
				$.ajax({
					url:"./okmallbuy.ino",
					type:"post",
					data:{point:pointp, coupon:couponp},
					success:function(result){
						href:location="/mavenBoard/okmallbasket.ino";
					}
				});
				for(var i = 0; i < len; i++){
					if(chk[i].checked == true){
						
						var coupon = parseFloat(document.getElementById("coupon"+(i+1)).value);
						var userno = 0;
						var name = document.getElementById("name"+(i+1)).value;
						var price = parseInt(document.getElementById("price"+(i+1)).value);
						var discount = parseFloat(document.getElementById("discount"+(i+1)).value);
						var brand = document.getElementById("brand"+(i+1)).value;
						var kind = document.getElementById("kind"+(i+1)).value;
						var couponname = document.getElementById("couponname"+(i+1)).value;
						var coupondc = parseFloat(document.getElementById("coupondc"+(i+1)).value);
						var point = 0;//parseFloat(document.getElementById("coupon"+i).value)
						var count = parseInt(document.getElementById("count"+(i+1)).value);
						
						$.ajax({
							url:"./okmallbuy.ino",
							type:"post",
							data:{userno:userno, name:name,
								  price:price, discount:discount,
								  brand:brand, kind:kind,
								  couponname:couponname, coupondc:coupondc,
								  point:point, count:count,
								  coupon:coupon,
								  },
							success:function(result){
								href:location="/mavenBoard/okmallbasket.ino";
							}
						});
						$.ajax({
							url:"./okmallbasketDelete.ino",
							type:"post",
							data:{name:name},
							success:function(result){
								href:location="/mavenBoard/okmallbasket.ino";
							}
						});
					}
				}
				return false;
			}else{
			}
		});
		
		$("#basketDeleteAll").on("click",function() {
			var result = confirm("선택품목이 모두 삭제 됩니다.\n 삭제하시겠습니까?");
			var chk = document.getElementsByName("chkone");
			var len = chk.length;
			
			if(result){
				for(var i = 0; i < len; i++){
					if(chk[i].checked == true){
						var name = document.getElementById("name"+(i+1)).value;
						$.ajax({
							url:"./okmallbasketDelete.ino",
							type:"post",
							data:{name:name},
							success:function(result){
								href:location="/mavenBoard/okmallbasket.ino";
							}
						});
					}
				}
				return false;
			}else{
			}
		});
	});
	
	
	var check = false;
	function chkall(){
		var chk = document.getElementsByName("chkone");

		if(check == false){
		check = true;
			for(var i=0; i<chk.length;i++){
			chk[i].checked = true;     //모두 체크
			}
		}else{
		check = false;
			for(var i=0; i<chk.length;i++){
			chk[i].checked = false;     //모두 해제
			}
		}
	}

	
	function add() {
		
		var j = document.getElementById("true").value;
		var i;
		
		for(i = 1; i <= j; i++){
			var countbuy =document.getElementById("countbuy"+i).value;
			//console.log("countbuy:>>>>>" + countbuy);
			var coupon =parseFloat(document.getElementById("coupon"+i).value);
			var price = parseInt(document.getElementById("price"+i).value);
			var dc = parseFloat(document.getElementById("discount"+i).value);
			var num = 0;
			var couponname = document.getElementById("couponname"+i).value
			countbuy = parseInt(countbuy);
			
			if(parseInt(coupon) < 1 ){
				num = (price - (price*(dc+coupon)))*countbuy ;
			}else{
				num = (price - (price*(dc)))*countbuy -coupon;
			}
			document.getElementById("sum"+i).value = num;
			document.getElementById("count"+i).value = countbuy;
		}
		
	}
	
	function addall(){
		var point =parseInt(document.getElementById("point").value);
		var chk = document.getElementsByName("chkone");
		var len = chk.length;
		var sum =0;
		
		for(var i = 0; i < len; i++){
			if(chk[i].checked == true){
				sum = parseInt(sum) + parseInt(document.getElementById("sum"+(i+1)).value);
			}
		}
		sum = parseInt(sum) - point;
		document.getElementById("allsum").value = sum;
		
		
	}
	
	function basketUpdate(i){
		var result = confirm(i+ "번 물품을 저장하시겠습니까?");
		//alert( i + " 버튼을 누르셨습니다.");
		if(result) { //yes 
			document.getElementById("form"+i).action="./okmallbasketUpdate.ino";
			document.getElementById("form"+i).submit();
			//document.i.action="./okmallbasketUpdate.ino"; //여기에 주소
			//document.i.submit();
		} else { 
		}
	}
		
	
	function basketDelete(i){
		var result = confirm(i+"번 품목을 삭제 하시겠습니까?");
		
		if(result) { //yes 
			document.getElementById("form"+i).action='./okmallbasketDelete.ino';//여기에 주소
			document.getElementById("form"+i).submit();
		} else { 
		}
	}
</script>


	<div>
		<h1>OKMALLDIY</h1>
	</div>
	<div style="width: 650px;" align="center">
		<input type="button" value="MAIN"
			onclick="location.href='./okmall.ino'"> &nbsp;&nbsp;&nbsp; <input
			type="button" value="NIKE"
			onclick="location.href='./okmallname.ino?name=NIKE'">
		&nbsp;&nbsp;&nbsp; <input type="button" value="ADIDAS"
			onclick="location.href='./okmallname.ino?name=ADIDAS'">
		&nbsp;&nbsp;&nbsp; <input type="button" value="NEWBALANCE"
			onclick="location.href='./okmallname.ino?name=NEWBALANCE'">
		&nbsp;&nbsp;&nbsp; <input type="button" value="장바구니"
			onclick="location.href='./okmallbasket.ino'">
		&nbsp;&nbsp;&nbsp; <input type="button" value="구매내역"
			onclick="location.href='./okmallbuylist.ino'">
	</div>
	<hr style="width: 600px">
	<div style="float: left;">
		<input type="checkbox" name="chkall" id="chkall"
			onclick="chkall(); addall()">전체선택
	</div>



	<hr style="width: 600px">
	<c:forEach items="${okmallList.list }" var="dto" varStatus="tablenum">
		<input type="hidden" name=${tablenum.last } id=${tablenum.last }
			value=${tablenum.count }>
		<div style="float: left;"></div>
		<div style="width: 300px; float: center;">테이블 번호:
			${tablenum.count }</div>
		<hr style="width: 600px">
		<form name="form${tablenum.count }" id="form${tablenum.count }"
			method="post">
			<input type="hidden" name="name" id="name${tablenum.count }"
				value=${dto.name }> <input type="hidden" name="price"
				id="price${tablenum.count }" value=${dto.price }> <input
				type="hidden" name="discount" id="discount${tablenum.count }"
				value=${dto.discount }> <input type="hidden" name="brand"
				id="brand${tablenum.count }" value=${dto.brand }> <input
				type="hidden" name="kind" id="kind${tablenum.count }"
				value=${dto.kind }> <input type="hidden" name="couponname"
				id="couponname${tablenum.count }"> <input type="hidden"
				name="coupondc" id="coupondc${tablenum.count }"> <input
				type="hidden" name="count" id="count${tablenum.count }"> <a
				href="./okmalldetail.ino?name=${dto.name }"> <IMG
				src="img/${dto.name }.jpg" width="250" height="250" border=1
				vspace="0" hspace="0" align="left">
			</a> <br>
			<div style="width: 300px; float: left;">제품명: ${dto.name }</div>
			<br>
			<div style="width: 300px; float: left;">가격: ${dto.price }</div>
			<br>
			<div style="width: 300px; float: left;">할인율: ${dto.discount*100 }
				%</div>
			<br>
			<div style="width: 300px; float: left;">할인가격: ${dto.dp }</div>
			<br>
			<div style="width: 300px; float: left;">
				사용가능쿠폰 : <select name="coupon" id="coupon${tablenum.count }">
					<option value="${dto.coupondc }">${dto.couponname }</option>
					<!-- 여기에 쿠폰 갖지고 와서 뿌려주기 -->
					<c:forEach items="${okmallList.clist }" var="cdto">
						<c:if test="${cdto.brand.equals(dto.brand) }">
							<option value="${cdto.dc }">${cdto.couponname }</option>
						</c:if>
					</c:forEach>
					<option value="0">사용안함</option>
				</select>
			</div>
			<br>
			<div style="width: 300px; float: left;">
				구매 수량 : <input type="number" name="countbuy"
					id="countbuy${tablenum.count }" min="0" onchange="add(); addall()"
					value=${dto.count }>
			</div>
			<br>
			<div style="width: 300px; float: left;">
				<h3>
					금액 : <input type="number" name="sum" id="sum${tablenum.count }"
						min="0" readonly>원
				</h3>
			</div>
			<br>
			<div style="width: 300px; float: left;">
				상품선택: <input type="checkbox" name="chkone" id="chkone"
					onclick="addall()">
				<button id="basketUpdate${tablenum.count }"
					onclick="basketUpdate(${tablenum.count });">저장</button>
				<button id="basketDelete${tablenum.count }"
					onclick="basketDelete(${tablenum.count });">삭제</button>
			</div>
			<br>
		</form>
		<hr style="width: 600px">
	</c:forEach>

	<div style="width: 300px; float: center;">보유포인트:
		${okmallList.pdto.point }</div>
	<br>
	<div style="width: 300px; float: center;">
		사용포인트: <input type="number" name="point" id="point" min="0"
			max="${okmallList.pdto.point }" onchange="addall()" value="0">
		<!-- max는 포인트 불러온값으로  -->
	</div>
	<br>
	<div style="width: 300px; float: center;">
		<h3>
			합계금액 : <input type="number" name="allsum" id="allsum" min="0"
				readonly> 원
		</h3>
	</div>
	<br>
	<hr style="width: 600px">


	<input type="button" style="width: 100pt; height: 40pt;" value="구매"
		id="basketBuy" />
	<input type="button" style="width: 100pt; height: 40pt;" value="삭제"
		id="basketDeleteAll" />



</body>
</html>