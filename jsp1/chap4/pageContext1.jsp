<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jsp1/src/main/webapp/chap4/pageContext1.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pageContext 예제</title>
</head>
<body>
<%--
  영역담당 객체
  page 영역    : pageContext 객체. 각각의 페이지 한개가 page 영역.
  request 영역 : request 객체. 
                하나의 request 객체를 공유하는 여러개의 페이지를 같은 request
                영역이라 한다.
  session 영역 : session 객체. 브라우저당 한개의 session 객체를 할당.              
                하나의 session 객체를 공유하는 여러개의 페이지를 같은 session
                영역이라 한다.
  application 영역 : application 객체. 같은 웹어플리케이션에 속한 모든 jsp는
                같은 application 영역임.   
                
  => 영역담당 객체들은 속성관련 메서드를 멤버로 가진다.                            
 --%>
<h2>pageContext 객체 : 현재 페이지의 자원을 관리하는 객체<br>
                   page 영역을 담당하고 있는 객체다.</h2>
<h3>영역담당 객체는 속성관련 메서드를 멤버로 가진다<br>
   pageContext.setAttribute("속성명","속성값")<br>
   Object pageContext.getAttribute("속성명")<br>
   pageContext.removeAttribute("속성명")<br>
</h3>
<% if(request == pageContext.getRequest()) {%>
request 객체와 pageContext.getRequest()가 리턴한 객체는 같은 객체임<br>
<% } %>
<% if(response == pageContext.getResponse()) {%>
response 객체와 pageContext.getResponse()가 리턴한 객체는 같은 객체임<br>
<% } %>
<% if(session == pageContext.getSession()) {%>
session 객체와 pageContext.getSession()가 리턴한 객체는 같은 객체임<br>
<% } %>
</body>
</html>