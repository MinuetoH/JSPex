<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--
    	page 지시어
    	<사용되는 속성>
    	language="java : 기본언어. 기본값. 생략가능
    	contentType : 반드시 기술.
    				  문서의 형식을 MIME 타입으로 설정.
    	pageEncoding : 문서의 인코딩 방식 설정
    	import : 페이지에서 사용되는 클래스를 지정. 여러번 사용 가능
     --%>
    <%-- /jsp1/src/main/webapp/chap3/commentex1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp에서 사용되는 주석</title>
<%
	String str ="jsp 주석 예제입니다.";
	Date today = new Date();
%>
</head>
<body>
<h1>jsp 페이지에서 사용되는 주석</h1>
<ol>
<%-- 
	 &lt; : < 표시 문자
	 &gt; : > 표시 문자
 --%>
	<li>jsp 주석: &lt;%-- jsp 주석 표현--%&gt;</li>
	<%-- jsp 주석입니다. : jsp 페이지에서만 보여집니다.
		서블릿 변환 시 제외되는 부분입니다. 변환된 서블릿에서는 볼 수 없습니다. --%>
	<li>java 주석: &lt;%// java 한줄 주석 표현
					또는 /* 자바 여러줄 주석 */%&gt;</li>
	<%	//스크립트릿 영역
		//자바 한줄 주석입니다.
		/* 
			자바 여러줄 주석입니다. 자바주석은 서블릿이 컴파일될 때 주석이므로
			서블릿 페이지에서 볼 수 있습니다.
		*/
	%>
	<li>HTML 주석: &lt;!-- //HTML 주석 표현 --%&gt;</li>
	<!-- 
		html 주석입니다. jsp 페이지나, 서불릿에서는 주석이 아닙니다.
		브라우저의 소스보기에서 볼 수 있습니다.
		브라우저가 실행 시 주석으로 인식합니다.<%=str %>
	 -->
</ol>
</body>
</html>