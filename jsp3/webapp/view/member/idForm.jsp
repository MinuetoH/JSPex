<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jsp3/src/main/webapp/view/member/idForm.jsp 
	
	현재 url 정보 기준으로 경로 설정.
	http://localhost:8088:/jsp3/member/idForm
	
	http://localhost:8088:/jsp3/css/main.css => 절대경로
						  /jsp3/css/main.css => 절대경로
						  	 ../css/main.css => 상대경로
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<h3>아이디 찾기</h3>
<form action="id" method="post">
<table>
	<tr><th>이메일</th><td><input type="text" name="email"></td></tr>
	<tr><th>전화번호</th><td><input type="text" name="tel"></td></tr>
	<tr><td colspan="2"><input type="submit" value="아이디찾기"></td></tr>
</table>
</form>
</body>
</html>