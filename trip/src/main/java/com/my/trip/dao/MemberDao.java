package com.my.trip.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.trip.vo.memberVO;

// dao는 쉽게 말해 오라클 서버에 접근하여 SQL문을 실행할 수 있는 객체이다.

@Repository("mDao")
/*
 	 DB처리를 할 DAO 클래스를 작성한 뒤, @Repository 어노테이션을 붙여준다.(괄호안에 Bean ID에 해당하는 이름을 붙여줘도 된다.)
 	 
 	 이 클래스는 루트 컨테이너에 빈(Bean) 객체로 생성된다. 
 	 DB 작업을 위해 이 DAO 객체를 불러오려면 컨테이너에서 받아와야 한다.(new를 이용해 생성하면 안 됨) 
 	 루트 컨테이너의 객체는 어디서든 공유가능하기 때문에, 
 	 의존성 주입(DI) 어노테이션을 이용해 객체를 받아올 수 있다. ㅡ> @Repository사용
 
 
	이 어노테이션들은 같은 빈(Bean) 객체에서만 작동한다.
	Bean으로 만들지 않은 일반 클래스에서 사용해봤자 아무 소용 없다. 
	DTO객체 등 데이터 변경 작업이 많은 클래스를 제외하고 
	로직을 가진 클래스는 거의 @Service 어노테이션을 통해 Bean 객체로 등록한다.
 */
public class MemberDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	//id 체크
	public int idCheck(String id) {
		return sqlSession.selectOne("mSQL.idCheck", id);
	}
	
	//회원가입
	public int joinMember(memberVO jVO) {
		return sqlSession.insert("mSQL.joinMemb", jVO);
	}
	
	//로그인
	public int getLogin(memberVO jVO) {
		return sqlSession.selectOne("mSQL.getLogin",jVO);
	}
	
	//내정보조회
	public memberVO myinfo(String id) {
		return sqlSession.selectOne("mSQL.myinfo",id);
	}
	
}
