<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script>
function modify(){
	var form = document.insertForm;
	form.action = "./freeBoardModify.ino";
	form.method="POST";
	form.submit();
}

	
</script>
<body>

	<div>
		<h1>�����Խ���</h1>
	</div>
	<div style="width:650px;" align="right">
		<a href="./main.ino">����Ʈ��</a>
	</div>
	<hr style="width: 600px">
	
	<form name="insertForm">
		<input type="hidden" name="num" value="${freeBoardDto.num }" />
		
		<div style="width: 150px; float: left;">�̸� :</div>
		<div style="width: 500px; float: left;" align="left"><input type="text" name="name" value="${freeBoardDto.name }" readonly/></div>
		
		<div style="width: 150px; float: left;">���� :</div>
		<div style="width: 500px; float: left;" align="left"><input type="text" name="title"  value="${freeBoardDto.title }"/></div>
	
		<div style="width: 150px; float: left;">�ۼ�����</div>
		<div style="width: 500px; float: left;" align="left"><input type="text" name="regdate"  value="${freeBoardDto.regdate }"/></div>
	
		<div style="width: 150px; float: left;">���� :</div>
		<div style="width: 500px; float: left;" align="left"><textarea name="content" rows="25" cols="65"  >${freeBoardDto.content }</textarea></div>
		<div align="right">
		<input type="button" value="����" onclick="modify()">
		<input type="button" value="����" onclick="location.href='./freeBoardDelete.ino?num=${freeBoardDto.num }'">
		
		<input type="button" value="���" onclick="location.href='./main.ino'">
		&nbsp;&nbsp;&nbsp;
		</div>
		
	</form>
	
</body>
</html>