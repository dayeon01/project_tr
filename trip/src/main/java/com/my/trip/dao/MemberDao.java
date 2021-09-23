package com.my.trip.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.trip.vo.joinVO;

// dao�� ���� ���� ����Ŭ ������ �����Ͽ� SQL���� ������ �� �ִ� ��ü�̴�.

@Repository("mDao")
/*
 	 DBó���� �� DAO Ŭ������ �ۼ��� ��, @Repository ������̼��� �ٿ��ش�.(��ȣ�ȿ� Bean ID�� �ش��ϴ� �̸��� �ٿ��൵ �ȴ�.)
 	 
 	 �� Ŭ������ ��Ʈ �����̳ʿ� ��(Bean) ��ü�� �����ȴ�. 
 	 DB �۾��� ���� �� DAO ��ü�� �ҷ������� �����̳ʿ��� �޾ƿ;� �Ѵ�.(new�� �̿��� �����ϸ� �� ��) 
 	 ��Ʈ �����̳��� ��ü�� ��𼭵� ���������ϱ� ������, 
 	 ������ ����(DI) ������̼��� �̿��� ��ü�� �޾ƿ� �� �ִ�. ��> @Repository���
 
 
	�� ������̼ǵ��� ���� ��(Bean) ��ü������ �۵��Ѵ�.
	Bean���� ������ ���� �Ϲ� Ŭ�������� ����غ��� �ƹ� �ҿ� ����. 
	DTO��ü �� ������ ���� �۾��� ���� Ŭ������ �����ϰ� 
	������ ���� Ŭ������ ���� @Service ������̼��� ���� Bean ��ü�� ����Ѵ�.
 */
public class MemberDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	//id üũ
	public int idCheck(String id) {
		return sqlSession.selectOne("mSQL.idCheck", id);
	}
	
	//ȸ������
	public int joinMember(joinVO jVO) {
		return sqlSession.insert("mSQL.joinMemb", jVO);
	}
	
	//�α���
	public int getLogin(joinVO jVO) {
		return sqlSession.selectOne("mSQL.getLogin",jVO);
	}
	
}
