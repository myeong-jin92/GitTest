<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 페이지</title>
</head>
<script>
function nomemberLogin(){
	var nml = confirm("비회원으로 이용하시 겠습니까? \n 열람만 가능합니다.")
	
	if(nml == true){
		var form = document.login;
		form.action = "./nomemberLogin.ino";
		form.method="POST";
		form.submit();
	}else{
	}
}

function memberSign(){
	var nml = confirm("회원가입 페이지로 이동합니다.")
	
	if(nml == true){
		var form = document.login;
		form.action = "./memberSign.ino";
		form.method="POST";
		form.submit();
	}else{
	}
}

function memberLogin(){
	var nml = confirm("로그인 하시겠습니까?")
	
	if(nml == true){
		var form = document.login;
		form.action = "./memberLogin.ino";
		form.method="POST";
		form.submit();
	}else{
	}
}
</script>
<body>
	<form name="login">
		<div style="width: 150px; float: left;">
			ID :
		</div>
		<div style="width: 500px; float: left;" align="left">
			<input type="text" name="id">
		</div>
		<div style="width: 150px; float: left;">
			PW :
		</div>
		<div style="width: 500px; float: left;" align="left">
			<input type="password" name="password">
		</div>
		
		<div align="right">
		<input type="button" value="비회원 이용" onclick="nomemberLogin()">
		<input type="button" value="회원가입" onclick="memberSign()">
		<input type="button" value="로그인" onclick="memberLogin()">
		</div>
	</form>
</body>
</html>