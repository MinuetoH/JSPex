<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- /jsp1/src/main/webapp/chap4/forward1.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forward하는 페이지</title>
</head>
<body>
<h2>forward하는 페이지입니다. 이 내용은 화면에 출력되지 않습니다.</h2>
<% pageContext.forward("forward2.jsp"); %>
</body>
</html>