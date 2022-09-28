<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jsp1/src/main/webapp/chap3/script1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트 예제</title>
</head>
<body>
<%	//스크립트릿 : 자바 알고리즘 부분
	System.out.println("스크립트 예제");
	String msg = "스크립트 예제";
	for(int i=0;i<=10;i++){
%>
<%--
	표현식 : 화면에 값을 출력. ;, //한줄 주석 안됨.
		   반드시 값이 있어야 함 : 변수, 상수, 수식, 리턴타입이 void가 아닌 메서드.
	서블릿 : out.print(i+":"+msg); 변경됨
 --%>
<input type="text" value='<%=i+":"+msg /* 여러줄 주석만 가능 */ %>'><br>
<%=getMsg() %><br>
<% } //for 구문 끝%>
</body>
</html>
<%!	//선언문
	String msg = "script.jsp 페이지의 멤버 변수";
	String getMsg() {
	return msg;
}
%>