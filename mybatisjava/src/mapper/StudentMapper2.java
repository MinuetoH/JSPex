package mapper;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.Select;

import main.Student;
/*
 * 같은 이름을 가진 메서드가 여러 개 존재 불가 : Mybatis에서 실행 시 오류 발생
 * 오버로딩 불가함.
 * 메서드이름 : sql 문장의 구분할 수 있는 이름.
 */
public interface StudentMapper2 {
	//@Select("select * from student")
	//List<Student> selcet();
	
	//동적 sql 문장
	@Select({"<script>",
		"select * from student ",
		"<choose>" 
		+ "<when test='grade != null and height != null'>"
		+ "where grade = #{grade} and height >= #{height}</when>"
		+ "<when test='grade != null'>where grade=#{grade}</when>"
		+ "<when test='height != null'>where height >= #{height}</when>"
		+ "</choose>",
		"</script>"})
	List<Student> select(Map<String, Object> map);
	/*	1.
	 * <when test='grade != null and height != null'>
	 * : map 객체에 grade, height 키 값이 둘다 존재
	 * {"grade":1, "height":175}
	 * select * from student
	 * where grade = 1 and height >= 175
	 * 
	 * 2.
	 * map : {"height" : 175}
	 * <when test='height != null'>where height >= #{height}</when>'>
	 * select * from student 
	 * where height >= 175
	 * 
	 * 3.
	 * map : {"grade" : 2}
	 * <when test='grade != null'>where grade >= #{grade}</when>'>
	 * select * from student 
	 * where grade = 2
	 * 
	 * 4.
	 * map : null
	 * select * from student => 모든 데이터 조회
	 */
	
}
