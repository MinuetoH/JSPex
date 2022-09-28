<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- /jsp1/src/main/webapp/chap4/application.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 객체</title>
</head>
<body>
	<h3>
		application 객체는 웹어플리케이션 당 한 개의 객체가 제공됩니다.<br> 현재 웹어플리케이션 jsp1
		프로젝트의 모든 jsp는 하나의 application 객체를 공유합니다.
	</h3>
	<table border="1" style="border-collapse: collapse;">
		<tr>
			<td>jsp버전</td>
			<td><%=application.getMajorVersion()%>. <%=application.getMajorVersion()%></td>
		</tr>
		<tr>
			<td>웹컨테이너 정보(WAS 서버 정보)</td>
			<td><%=application.getServerInfo()%></td>
		</tr>
		<tr>
			<td>웹어플리케이션 경로</td>
			<td><%=application.getRealPath("/")%></td>
		</tr>
	</table>
	<%
	application.setAttribute("test", "application.jsp 페이지에서 application 객체에 등록한 속성");
	session.setAttribute("test", "application.jsp 페이지에서 session 객체에 등록한 속성");
	%>
</body>
</html>