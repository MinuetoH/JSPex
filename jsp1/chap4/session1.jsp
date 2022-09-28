<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jsp1/src/main/webapp/chap4/session1.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session 내장 객체</title>
</head>
<body>
<%
  //세션 유지시간:유지시간 초과시 새로운 세션 할당. 
  session.setMaxInactiveInterval(10); //초단위. 10초 설정  
%>
<h3>session 객체 : 브라우저 별로 session이 할당됨.<br>
              클라이언트(브라우저)의 상태 정보를 저장하는 기능</h3>
<%-- session이 새로 할당된경우 true, session 객체가 달라짐을 의미  --%>
isNew() : <%=session.isNew() %><br>              
<%-- session 생성시간 : 1970년 이후부터 현재까지를 밀리초로 리턴  --%>
생성시간 : <%=session.getCreationTime() %><br>              
<%-- session 브라우저에서 페이지가 최종 요청된 시간: 
     1970년 이후부터 현재까지를 밀리초로 리턴 
     세션 유지시간은 최종 접속시간부터 계산.  --%>
최종접속시간 : <%=session.getLastAccessedTime() %><br>  
<%-- 세션의 고유한 id값. id값이 다른경우는 다른 세션임 --%>            
session id : <%=session.getId() %><br>              
</body>
</html>