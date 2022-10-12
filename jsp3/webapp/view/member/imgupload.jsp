<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jsp3/src/main/webapp/view/member/imgupload.jsp --%>    
<script>
  //opener 윈도우의 id="pic"인 태그 선택  => <img 태그 ...>
  img = opener.document.querySelector("#pic")
  img.src="picture/${filename}";	//opener화면의 img 태그에 src 설정
  //opener form 태그의 picture 파라미터에 파일이름 설정
  opener.document.f.picture.value="${filename}";
  self.close()	//현재 창 종료
</script>