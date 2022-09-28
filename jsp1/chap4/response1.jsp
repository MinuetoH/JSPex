<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- /jsp1/src/main/webapp/chap4/response1.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응답 객체:response</title>
</head>
<body>
<h2>지금 작성 중인 내용은 화면에 출력되지 않습니다.</h2>
<h3>response 객체는 브라우저에 결과를 전달해 주는 객체입니다.<br>
	내부에 출력 버퍼를 가지고 있습니다.<br>
	브라우저에 결과를 전달할 때 다른 페이지를 요청하도록 할 수 있습니다.
	=> 이러한 기능을 redirect라고 합니다.
</h3>
<% response.sendRedirect("response2.jsp"); %>
</body>
</html>