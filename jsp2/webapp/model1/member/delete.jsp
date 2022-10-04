<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jsp2/src/main/webapp/model1/member/delete.jsp 
	1. 파라미터값 변수에 저장
	2. method=POST 여부 확인.
	3. id가 관리자인 경우 탈퇴 불가. list.jsp 페이지로 이동
		=>추가 : 
		3-1. 로그인 여부 
		3-2. 본인탈퇴 여부 검증 추가
	4. 비밀번호 검증
		관리자가 강제 탈퇴인 경우 : 관리자 비밀번호
		본인 탈퇴인 경우 : 본인 비밀번호
		비밀번호 불일치 : 비밀번호 오류 메세지 출력 후 deleteForm.jsp 페이지 이동
	5. 비밀번호 일치하는 경우
		boolean MemberDao().delete(id) 메서드 호출
		회원정보 삭제 성공 
			일반사용자	: 로그아웃 실행.
					  탈퇴 성공 메세지 출력. loginForm.jsp 페이지 이동
			관리자    : 탈퇴 성공 메세지 출력. list.jsp 페이지 이동
		회원정보 삭제 실패 
			일반사용자	: 탈퇴 실패 메세지 출력. deleteForm.jsp 페이지 이동
			관리자    : 탈퇴 실패 메세지 출력. list.jsp 페이지 이동 
--%>
<%
	//1. 파라미터값 변수에 저장
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	//2. method=POST 여부 확인.
	String msg = null;
	String url = null;
	String login = (String)session.getAttribute("login");
	if(!request.getMethod().equals("POST")) {
		msg = "입력항목이 오류입니다.";
		url = "deleteForm.jsp?id="+id;
	//3. id가 관리자인 경우 탈퇴 불가. list.jsp 페이지로 이동
	} else if(id.equals("admin")) {
		msg = "관리자는 탈퇴 불가합니다.";
		url = "list.jsp";
	//3-1. 로그아웃 상태인 경우 오류 검증
	} else if(login == null) {
		msg = "로그인하세요.";
		url = "loginForm.jsp";
	//3-2. 본인 탈퇴 검증
	} else if(!login.equals("admin") && !id.equals(login)) {
		msg = "본인만 탈퇴 가능합니다.";
		url = "main.jsp";
	} else {	//기본 검증 완료
		MemberDao dao = new MemberDao();
		Member mem = dao.selectOne(login);
		//4. 비밀번호 검증
		//pass : 입력된 비밀번호
		//mem.getPass() : db에 등록된 비밀번호
		if(!pass.equals(mem.getPass())) {	//비밀번호 오류
			msg = "비밀번호 오류";
			url = "deleteForm.jsp?id="+id;
		} else {	//비밀번호 일치
			//5. 비밀번호 일치하는 경우
			if(dao.delete(id)) {
				msg = id+"회원이 탈퇴 되었습니다.";
				if(login.equals("admin")){	//관리자
					url = "list.jsp";
				} else {	//일반사용자
					session.invalidate();	//회원정보 삭제
					url = "loginForm.jsp";
				}
			} else {	//회원 정보 삭제 시 db 오류 발생한 경우
				msg = id+"회원이 탈퇴 실패";
				if(login.equals("admin")){	//관리자
					url = "list.jsp";
				} else {	//일반사용자
					url = "deleteForm.jsp?id="+id;
				}
			}
		}
	}
	
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url %>"
</script>