<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jsp1/src/main/webapp/chap4/sessionAdd.jsp --%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 추가</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String product = request.getParameter("product");
	//Object session.getAttribute("cart") : session 객체에 속성 중 키가 cart인 객체를 리턴
	List<String> cart = (List<String>)session.getAttribute("cart");
	if(cart == null) {	//sessin 속성에 cart 속성이 등록되지 않음
		cart = new ArrayList<String>();
		session.setAttribute("cart",cart);
	}
	cart.add(product);	//cart에 추가
%>
<script type="text/javascript">
	alert("<%=product%>이(가) 장바구니에 추가되었습니다.")
	history.go(-1)	//앞페이지로 이동
</script>
</body>
</html>