<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jsp1/src/main/webapp/chap3/include1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include 지시어 예제</title>
</head>
<body>
<%
	String msg = "include1.jsp 페이지의 msg 변수";
%>
<h1>include.jsp 페이지입니다.</h1>
<%@include file="include2.jsp" %>
<h2>include 지시어를 이용하여 다른 페이지의 내용을 가져올 수 있습니다.
	두 개의 jsp 페이지는 하나의 서블릿으로 변환되므로 변수의 공유가 가능합니다.</h2>
</body>
</html>