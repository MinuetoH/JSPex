<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- /jsp1/src/main/webapp/chap4/request1.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청 정보 출력</title>
</head>
<body>
<%--
	request : 요청객체. 요청정보(파라미터)를 저장하고 있는 객체.
			  파라미터값을 인코딩 설정 필요.
		주요 메서드
		String getParameter(파라미터이름) : 파라미터이름에 해당하는 값을 한 개 리턴
		String[] getParameterValues(파라미터이름) : 파라미터이름에 해당하는 값을 여러 개 리턴
		Enumeration getParameterNames() : 요청객체에 존재하는 모든 파라미터이름들을 리턴
		setCharacterEncoding(인코딩값) : 요청객체에 존재하는 파라미터의 코드값 설정
									  기본인코딩값 ISO8859 코딩임.
			  
	request.getParameter("name") : name 파라미터의 값
	
	request.setCharacterEncoding("UTF-8") : method 방식이 POST인 경우 적용될 수 있음.
	
 --%>
	<%
	request.setCharacterEncoding("UTF-8");	//파라미터 인코딩
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	String hobby = request.getParameter("hobby");
	String year = request.getParameter("year");
	%>
	이름 : <%=name%><br> 
	나이 : <%=age%><br> 
	성별 : <%=gender%><br> 
	취미 : <%=hobby%><br> 
	출생년도 : <%=year%><br>
<hr>
<h3>모든 취미 정보 조회하기</h3>
<%
	String[] hobs = request.getParameterValues("hobby");
	for(String h : hobs) {
%>
<%=h %>&nbsp;&nbsp;
<%} %>
<hr>
<h3>모든 파라미터 정보 조회하기</h3>
<table><tr><td>파라미터이름</td><td>파라미터값</td>
<%
//Enumeration : 반복자. Iterator 구버전.
	Enumeration e = request.getParameterNames();	//파라미터이름들 리턴
	while(e.hasMoreElements()) {
		//object nextElement()
		//pname : 파라미터 이름
		String pname = (String)e.nextElement();
		String[] values = request.getParameterValues(pname);
%>
<tr><td><%=pname %></td>
<td>
<% for(String v : values) { %>
<%=v %>&nbsp;&nbsp;
<% } %>
</td>
</tr>
<% } %>

</table>
</body>
</html>