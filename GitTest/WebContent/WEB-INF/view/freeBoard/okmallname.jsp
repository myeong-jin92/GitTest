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
	
	<c:forEach items="${okmallList }" var="dto">
			 
			<a href="./okmalldetail.ino?name=${dto.name }">
			<IMG src="img/${dto.name }.jpg" width="150" height="150" border=1 vspace="30" hspace="30" align="middle">
			</a>
			<br>
			<div style="width: 150px; float: left;">제품명: ${dto.name }</div>	
			<div style="width: 150px; float: left;">가격:  ${dto.price }</div>
			<div style="width: 150px; float: left;">할인율: ${dto.discount*100 } %</div> 
			<div style="width: 150px; float: left;">할인가격: ${dto.dp } </div> 
		<hr style="width: 600px">
	</c:forEach>
	
	
</body>
</html>