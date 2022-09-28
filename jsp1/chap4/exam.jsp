<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- /jsp1/src/main/webapp/chap4/exam.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행지 정보</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String local = request.getParameter("local");
	/*
		exam.jsp 페이지와 exam_seoul.jsp 페이지는 같은 requeast 영역이 아님
		=> request 객체를 공유하지 못함.
		request 객체를 공유해야 하는 경우 redirect는 안됨.
		forward 방식을 사용해야 함.
		
		redirect : 브라우저가 요청. redirect되는 jsp 페이지도 request 객체 할당
		forward : 서버내부에서 페이지이동. forward 페이지의 request 객체를 forward되는 페이지로 전달함.
				  => 같은 request 영역의 페이지		
		
	*/
	//response.sendRedirect("exam_" + local + ".jsp");
	pageContext.forward("exam_"+local+".jsp");
	%>
</body>
</html>