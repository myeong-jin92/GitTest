<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div id="bodyAll" align="center" style="width: 800px;">
		<header>
			<div style="width: 800px; margin: 0;">
				<a href="./index.jsp"><h1>메인페이지</h1></a>
			</div>
		</header>
		
		<div class="contents" style="width: 800px; margin: 0;">
			<aside>
				<div style="float: left;  width: 150px; height:700px; border: 2px; solid: #b6b8bb; background-color: #aaaaaa;">
					<br><br><br><br>
					<ul>
						<li><a href="http://inosys.net/">INOSYS</a></li>
						<li><a href="https://www.google.co.kr/">GOOGLE</a></li>
						<li><a href="https://www.naver.com/">NAVER</a></li>
						<li><a href="https://okky.kr/">OKKY</a></li>
						<li><a href="https://www.daum.net/">DAUM</a></li>
						<li><a href="https://www.kakaocorp.com/">KAKAO</a></li>
					</ul>
				</div>
			</aside>
			<section>
				<div style="background-color:#dedede; height:700px;">
					<a href="<%=request.getContextPath() %>/main.ino"><h1>자유게시판</h1></a>
				</div>
			</section>
		</div>
	</div>	
</body>
</html>