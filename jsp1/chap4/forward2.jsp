<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jsp1/src/main/webapp/chap4/forward2.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forward된 페이지</title>
</head>
<body>
<h2>forward2.jsp 페이지입니다.</h2>
forward1.jsp 페이지를 요청하면 forward2.jsp 페이지가 출력됩니다.
하지만 url은 forward1.jsp로 남아있습니다.
<hr>
<h3>name=<%=request.getParameter("name") %></h3>
</body>
</html>