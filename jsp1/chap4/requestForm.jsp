<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- /jsp1/src/main/webapp/chap4/requestForm.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청 페이지</title>
</head>
<body>
<%--
	submit 버튼 클릭
	1. submit 버튼이 속한 form 객체에 onsubmit 이벤트 발생
		-> 구현하지 않았으므로 무시됨.
	2. form 객체에 action 속성에 등록된 페이지를 서버에 요청
		-> form 객체의 하위 입력태그들의 값들을 서버에 함께 전달
		
	파라미트 : 서버에 전달되는  <input type="text" name="name">의 값
		파라미터의 이름 : name
		파라미터의 값 : 입력한 값
		
	method="post" : 서버에 파라미터 전달방식
		get	 : 파라미터를 url을 통해서 전달. 보안에 취약. 기본전달 방식.
		post : http 프로토콜의 body부분에 파라미터가 전달.
			   url에 파라미터 내용이 보이지 않음.
 --%>
	<h2>request 내장 객체 : 클라이언트의 요청 정보를 저장하고 있는 객체</h2>
	<form action="request1.jsp" method="post">
		이름 : <input type="text" name="name"><br> 
		나이 : <input type="text" name="age"><br> 
		성별 : <input type="radio"name="gender" value="1">남 
			 <input type="radio" name="gender" value="2">여<br> 
		취미 : <input type="checkbox" name="hobby" value="여행">여행 
		 	  <input type="checkbox" name="hobby" value="야구">야구
			  <input type="checkbox" name="hobby" value="축구">축구 
			  <input type="checkbox" name="hobby" value="요리">요리 
			  <input type="checkbox" name="hobby" value="독서">독서<br> 
		출생연도 : <select name="year">
			<% for (int i = 1990; i < 2001; i++) { %>
			<option><%=i%></option>
			<% } %>
		</select> <input type="submit" value="전송">

	</form>
</body>
</html>