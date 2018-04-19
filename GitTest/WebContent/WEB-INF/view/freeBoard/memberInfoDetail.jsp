<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<div>
		<h1>인적사항검색페이지</h1>
	</div>
	
	<div style="width:650px;" align="right">
		<a href="./memberInfoSearch.ino">검색창으로</a>
	</div>
	<hr style="width: 600px">
	
	<form name="serachform">
	
		<div style="width: 150px; float: left;">이름 :</div>
		<div style="width: 500px; float: left;" align="left"><input type="text" name="name" value="${memberInfoDto.name }" readonly/></div>
		
		<div style="width: 150px; float: left;">나이 :</div>
		<div style="width: 500px; float: left;" align="left"><input type="text" name="age"  value="${memberInfoDto.age }" readonly/></div>
	
		<div style="width: 150px; float: left;">주소</div>
		<div style="width: 500px; float: left;" align="left"><input type="text" name="adr"  value="${memberInfoDto.adr }" readonly/></div>
	
		<div style="width: 150px; float: left;">전화번호 :</div>
		<div style="width: 500px; float: left;" align="left"><input type="text" name="phone"  value="${memberInfoDto.phone }" readonly/></div>
		<div align="right">
		<input type="button" value="뒤로" onclick="location.href='./memberInfoSearch.ino'">
		&nbsp;&nbsp;&nbsp;
		</div>
		
	</form>
	
</body>
</html>