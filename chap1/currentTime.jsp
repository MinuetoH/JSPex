<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- src/main/webapp/currentTime.jsp 
	1. jsp 코딩 : currentTime.jsp
		- 서블릿으로 변경 : currentTime_jsp.java
		- 서블릿을 컴파일 : currentTime_jsp.class(바이트코드)
		- 바이트코드 실행.(_jspService 메서드 실행.)
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재시간</title>
</head>
<body>
	<%	//자바영역
	Calendar c = Calendar.getInstance();
	int h = c.get(Calendar.HOUR_OF_DAY);
	int m = c.get(Calendar.MINUTE);
	int s = c.get(Calendar.SECOND);
	%>
	<h1>
		현재시간:<%=h%>시<%=m%>분<%=s%>초
	</h1>
	<%= request.getRealPath("/") %>
</body>
</html>