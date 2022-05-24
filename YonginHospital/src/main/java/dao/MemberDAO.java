package dao;

import java.util.List;

import dto.Member;

public interface MemberDAO { //FoodDAO인터페이스 선언
	
	int insert(Member member); //인터페이스에서 FoodDAOImpl에서 구현할 메소드 정의
	int delete(String id);
	int edit(Member member);
	int login(String id, String pw);
	Member select(String id);
	List<Member> selectlist();
}
