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
	
	<a href="./okmalldiscount.ino?discount=10">
	<IMG src="img/10.jpg" width="150" height="150" border=1 vspace="30" hspace="30" align="middle">
	</a>
	<a href="./okmalldiscount.ino?discount=50">
	<IMG src="img/50.jpg" width="150" height="150" border=1 vspace="30" hspace="30" align="middle">
	</a>
	<a href="./okmalldiscount.ino?discount=80">
	<IMG src="img/80.jpg" width="150" height="150" border=1 vspace="30" hspace="30" align="middle">
	</a>
	<a href="./okmallname.ino?name=BAG">
	<IMG src="img/bag.jpg" width="150" height="150" border=1 vspace="30" hspace="30" align="middle">
	</a>
	<a href="./okmallname.ino?name=PADING">
	<IMG src="img/pading.jpg" width="150" height="150" border=1 vspace="30" hspace="30" align="middle">
	</a>
	<a href="./okmallname.ino?name=SHOSE">
	<IMG src="img/shose.jpg" width="150" height="150" border=1 vspace="30" hspace="30" align="middle">
	</a>
	<a href="./okmallname.ino?name=PANTS">
	<IMG src="img/pants.jpg" width="150" height="150" border=1 vspace="30" hspace="30" align="middle">
	</a>
	<a href="./okmallname.ino?name=TSIRTS">
	<IMG src="img/tsirts.jpg" width="150" height="150" border=1 vspace="30" hspace="30" align="middle">
	</a>
	<a href="./okmallname.ino?name=SLEEPER">
	<IMG src="img/sleeper.jpg" width="150" height="150" border=1 vspace="30" hspace="30" align="middle">
	</a>

	
	
</body>
</html>