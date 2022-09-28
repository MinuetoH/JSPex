<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jsp1/src/main/webapp/chap4/sessionView.jsp --%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 보기</title>
</head>
<body>
<%
	List<String> cart = (List<String>)session.getAttribute("cart");
	if(cart == null || cart.size() == 0) { %>
		<h3>장바구니에 상품이 없습니다.</h3>
	<% } else { %>
		<h3>장바구니 상품</h3>
		<% for (String p : cart) { %>
			<h4><%=p %></h4>
<% } } %>
<h4>장바구니 내용을 제거</h4>
<% session.removeAttribute("cart"); %>
<h4>application, session 객체의 test 속성을 출력하기</h4>
application 객체의 test 속성 : <%=application.getAttribute("test")%><br>
session 객체의 test 속성 : <%=session.getAttribute("test")%><br>
</body>
</html>