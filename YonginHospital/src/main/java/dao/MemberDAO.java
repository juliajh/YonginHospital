package dao;

import java.util.List;

import dto.Member;

public interface MemberDAO { //FoodDAO�������̽� ����
	
	int insert(Member member); //�������̽����� FoodDAOImpl���� ������ �޼ҵ� ����
	int delete(String id);
	int edit(Member member);
	int login(String id, String pw);
	Member select(String id);
	List<Member> selectlist();
}
