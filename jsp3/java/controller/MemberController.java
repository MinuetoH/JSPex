package controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kic.mskim.MskimRequestMapping;
import kic.mskim.RequestMapping;
import model.Member;
import model.MemberDao;
//http://localhost:8088/jsp3/member/joinForm
/*
 * @WebServlet("/member/*") : url의 정보가 
 * 	http://localhost:8088/jsp3/member/....
 * 	MemberController를 호출.
 */
@WebServlet("/member/*")
public class MemberController extends MskimRequestMapping{
	//http://localhost:8088/jsp3/member/joinForm 요청 시 호출되는 메서드
	@RequestMapping("joinForm")
	public String joinForm(HttpServletRequest request, HttpServletResponse response) {
		return "/view/member/joinForm.jsp"; //forward 됨			
	}
	
	@RequestMapping("join")
	/*
	 * 1.파라미터 값들을 Member 객체에 저장
	 * 2.Member 객체의 내용을 db에 저장
	 * 3.저장성공 : 화면에 내용 출력하기
	 * 	 저장실패 : joinForm.jsp 페이지 이동
	 */
	public String join(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		//1.파라미터 값들을 Member 객체에 저장
		Member mem = new Member();
		mem.setId(request.getParameter("id"));
		mem.setPass(request.getParameter("pass"));
		mem.setName(request.getParameter("name"));
		mem.setGender(Integer.parseInt(request.getParameter("gender")));
		mem.setTel(request.getParameter("tel"));
		mem.setEmail(request.getParameter("email"));
		mem.setPicture(request.getParameter("picture"));
		//2.Member 객체의 내용을 db에 저장
		MemberDao dao = new MemberDao();
		if(dao.insert(mem)) {
			//3. 저장성공 : 화면에 내용 출력하기
			request.setAttribute("mem", mem);
			return "/view/member/join.jsp";
		} else {
			//3. 저장실패 : joinForm.jsp 페이지 이동
			return "/view/member/joinForm.jsp";
		}
	}
	
	@RequestMapping("loginForm")
	public String loginForm(HttpServletRequest request, HttpServletResponse response) {
		return "/view/member/loginForm.jsp"; //forward 됨			
	}
	
	@RequestMapping("login")
	/*
	 * 1. 아이디, 비밀번호 파라미터를 변수 저장 
  	   2. db 정보를 읽기. id에 해당하는 db정보를 읽어서 Member 객체에 저장 
     	  Member MemberDao.selectOne(id);
  	   3. 아이디와 비밀번호 검증. 
    	  - 아이디가 없는 경우      
       	    아이디가 없습니다. 메세지확인. loginForm.jsp 페이지 이동
    	  - 아이디 존재. 비밀번호가 틀린경우   
       	    비밀번호오류 메세지확인. loginForm.jsp 페이지 이동
    	  - 아이디 존재. 비밀번호가 맞는경우 => 정상적인 로그인.
      	    session 객체에 로그인 정보 저장.
      	  main.jsp로 페이지 이동.  
	 */
	public String login(HttpServletRequest request, HttpServletResponse response) {
		 //1.아이디, 비밀번호 파라미터를 변수 저장 
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		//2.db 정보를 읽기. id에 해당하는 db정보를 읽어서 Member 객체에 저장
		Member mem = new MemberDao().selectOne(id);
		String msg = null;
		String url = null;
		if(mem == null) {	//아이디 없음.
			msg = "아이디를 확인하세요";
			url = "loginForm";
		} else if(!pass.equals(mem.getPass())) {	//비밀번호 오류
			msg = "비밀번호가 틀립니다";
			url = "loginForm";
		} else {	//정상 로그인.
			//session에 login 정보 등록.
			//request.getSession() : session 객체 리턴
			request.getSession().setAttribute("login", id);
			msg = "반갑습니다."+mem.getName() + "님";
			url = "main";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "/view/alert.jsp";
	}
	/*
	 * 1. 로그인 여부 검증
    	  로그인상태 : 화면 보여주기
    	  로그아웃상태 : 로그인하세요. 메세지 출력 후 loginForm.jsp 로 이동
	 */
	@RequestMapping("main")
	public String main(HttpServletRequest request, HttpServletResponse response) {
		String login = (String)request.getSession().getAttribute("login");
		if(login == null) { //로그아웃 상태	
			request.setAttribute("msg", "로그인하세요");
			request.setAttribute("url", "loginForm");
			return "/view/alert.jsp";
		}
		return "/view/member/main.jsp";
	}
	/*
	 * 1. session에 등록된 로그인 정보제거
	 * 2. loginForm.jsp 페이지 이동
	 */
	@RequestMapping("logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		//1.session에 등록된 로그인 정보제거
		request.getSession().invalidate();
		//2.loginForm.jsp 페이지 이동
		return "redirect:loginForm";
	}
	
	/*
	 * 1. id 파라미터 값을 변수 저장하기
	 * 2. login 상태 검증.
	 * 	  로그아웃상태 : 로그인하세요 메세지 출력 후 loginForm 페이지 이동
	 * 3. login 상태 검증 2.
	 * 	  로그인상태 : 관리자가 아닌 경우 id 파라미터 값과 login 정보가 다르면
	 * 				본인정보만 조회 가능합니다. 메세지 출력 후 main 페이지 이동
	 * 4. id에 해당하는 정보를 읽어서 /view/member/info.jsp 출력하기
	 */
	@RequestMapping("info")
	public String info(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String login = (String)request.getSession().getAttribute("login");
		if(login == null) {	//로그아웃 상태
			request.setAttribute("msg", "로그인하세요");
			request.setAttribute("url", "loginForm");
			return "/view/alert.jsp";
		} else if(!login.equals("admin") && !id.equals(login)) {
			request.setAttribute("msg", "본인정보만 조회 가능합니다.");
			request.setAttribute("url", "main");
			return "/view/alert.jsp";
		}
		Member mem = new MemberDao().selectOne(id);
		request.setAttribute("mem", mem);
		return "/view/member/info.jsp";
	}
	
	@RequestMapping("updateForm")
	public String updateForm(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String login = (String)request.getSession().getAttribute("login");
		if(login == null) {	//로그아웃 상태
			request.setAttribute("msg", "로그인하세요");
			request.setAttribute("url", "loginForm");
			return "/view/alert.jsp";
		} else if(!login.equals("admin") && !id.equals(login)) {
			request.setAttribute("msg", "본인정보만 수정 가능합니다.");
			request.setAttribute("url", "main");
			return "/view/alert.jsp";
		}
		//정상적인 조회
		Member mem = new MemberDao().selectOne(id);
		request.setAttribute("mem", mem);
		return "/view/member/updateForm.jsp";
	}
	
	/*
	 * 1. 모든 파라미터 정보를 Member 객체에 저장
 	   2. 입력된 비밀번호와, db에 저장된 비밀번호 비교 => db에서 읽기
          관리자인경우 관리자비밀번호로 비교하기.
    	  본인인 경우 본인의 비밀번호로 비교하기
    	 	- 비밀번호가 틀린 경우 : "비밀번호 오류" 메세지 출력 
                               updateForm.jsp 페이지 이동
 	   3. 비밀번호가 맞는 경우
    	  입력된 내용을 저장하고 있는 Member 객체를 이용하여 db 정보 수정.
    	  boolean MemberDao.update(Member)
    	  결과가 true 면 수정성공 info 페이지 이동
    	  결과가 false면 수정실패 메세지 출력후 , updateForm 페이지 이동
    	  =>jsp2 프로젝트의 update.jsp 페이지 참조
	 */
	@RequestMapping("update")
	public String update(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		Member mem = new Member();
		mem.setId(request.getParameter("id"));
		mem.setPass(request.getParameter("pass"));
		mem.setName(request.getParameter("name"));
		mem.setGender(Integer.parseInt(request.getParameter("gender")));
		mem.setTel(request.getParameter("tel"));
		mem.setEmail(request.getParameter("email"));
		mem.setPicture(request.getParameter("picture"));
		
		String login = (String)request.getSession().getAttribute("login");
		MemberDao dao = new MemberDao();
		Member dbmem = dao.selectOne(login);
		String msg = "비밀번호가 틀렸습니다.";
		String url = "updateForm?id="+mem.getId();
		if(mem.getPass().equals(dbmem.getPass())) {
			if(dao.update(mem)) {
				msg = "회원 정보 수정이 완료되었습니다.";
				url = "info?id="+mem.getId();
			} else {
				  msg = "회원 정보 수정 시 오류발생.";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "/view/alert.jsp";
	}
	/*
	 * 1. id 파라미터 저장하기
	   2. login 여부 검증하기
			로그아웃 상태인 경우
			로그인하세요. 메세지 출력 후 loginForm.jsp 페이지로 이동
		  관리자가 아니면서 id 파라미터 정보와 login 정보가 다른 경우
		  본인만 탈퇴 가능합니다. 메세지 출력 후 main.jsp 페이지로 이동
	   3. 현재 화면 출력
	 */
	@RequestMapping("deleteForm")
	public String deleteForm(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String login = (String)request.getSession().getAttribute("login");
		if(login == null) {
			request.setAttribute("msg", "로그인하세요");
			request.setAttribute("url", "loginForm");
			return "/view/alert.jsp";
		} else if(!login.equals("admin") && !id.equals(login)) {
			request.setAttribute("msg", "본인만 탈퇴 가능합니다.");
			request.setAttribute("url", "main");
			return "/view/alert.jsp";
		}
		//3
		return "/view/member/deleteForm.jsp"; 
	}
	/*
	 * 1. 파라미터값 변수에 저장
	   2. method=POST 여부 확인.
	   3. id가 관리자인 경우 탈퇴 불가. list 페이지로 이동
		   =>추가 : 
		   3-1. 로그인 여부 
		   3-2. 본인탈퇴 여부 검증 추가
	   4. 비밀번호 검증
		   관리자가 강제 탈퇴인 경우 : 관리자 비밀번호
		   본인 탈퇴인 경우 : 본인 비밀번호
		   비밀번호 불일치 : 비밀번호 오류 메세지 출력 후 deleteForm 페이지 이동
	   5. 비밀번호 일치하는 경우
		   boolean MemberDao().delete(id) 메서드 호출
		   회원정보 삭제 성공 
		   	일반사용자	: 로그아웃 실행.
					  탈퇴 성공 메세지 출력. loginForm 페이지 이동
			관리자    : 탈퇴 성공 메세지 출력. list 페이지 이동
		   회원정보 삭제 실패 
			일반사용자	: 탈퇴 실패 메세지 출력. deleteForm 페이지 이동
			관리자    : 탈퇴 실패 메세지 출력. list 페이지 이동 
	 */
	@RequestMapping("delete")
	public String delete(HttpServletRequest request, HttpServletResponse response) {
		
	}
}






