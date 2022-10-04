<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jsp2/src/main/webapp/model1/member/password.jsp 
	1. 로그아웃 상태인 경우. 로그인하세요. 메세지 출력.
		opener 페이지를 loginForm.jsp 페이지 이동.
		현재 페이지 닫기
	2. pass, chgpass 파라미터 값 저장
	3. pass 비밀번호가 db에 저장된 비밀번호와 틀리면
		비밀번호 오류 메세지 출력. 현재 페이지를 passwordForm.jsp 페이지 이동
	4. pass 비밀번호 db에 저장된 비밀번호와 같으면 => 비밀번호 검증 완료
		MemberDao.updatePass(login, chgpass) => 새로운 비밀번호로 수정
		비밀번호 수정 성공.
			메세지 출력 후 opener 페이지를 info.jsp 페이지 이동. 현재 페이지 닫기
		비밀번호 수정 실패.
			메세지 출력 후 opener 페이지를 updateForm.jsp 페이지 이동. 현재 페이지 닫기
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>