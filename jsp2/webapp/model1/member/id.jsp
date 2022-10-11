<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jsp2/src/main/webapp/model1/member/id.jsp 
	1. email, tel 파라미터 저장.
	2. db에서 email과 tel을 이용하여 id값을 리턴
		id = MemberDao.idSearch(email,tel)
	3. id 값이 존재
		id값을 화면에 출력.
		opener의 id 값을 저장. 현재 화면 닫기
	4. id 값이 없는 경우
		정보에 맞는 id를 찾을 수 없습니다. 메세지 출력 후
		idForm.jsp로 페이지 이동.
--%>
<%
	//1. email, tel 파라미터 저장.
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	
	//2. db에서 email과 tel을 이용하여 id값을 리턴
	//id 값이 null이 아닌 경우 : email, tel 
	//id 값이 null인 경우	: 
	String id = new MemberDao().idSearch(email,tel);
	if(id!=null) {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script type="text/javascript">
	function idsend(id) {
		opener.document.f.id.value=id
		self.close()
	}
</script>
</head>
<body>
<table><tr><th>아이디</th>
	<td><%=id %></td></tr>
	<tr><td colspan="2"><input type="button" value="아이디전송"
	onclick="idsend('<%=id %>')"></td></tr>

</table>
</body>
</html>
<% } else { // id == null인 경우%>
<script type="text/javascript">
	alert("정보에 맞는 id를 찾을 수 없습니다.")
	location.href="idForm.jsp"
</script>
<% } %>



