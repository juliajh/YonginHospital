package dao;

import java.util.List;

import dto.Reply;

public interface ReplyDAO { //FoodDAO인터페이스 선언
	
	int insert(Reply reply); //인터페이스에서 FoodDAOImpl에서 구현할 메소드 정의
	int delete(int id);
	int edit(Reply reply);
	List<Reply> selectlist(String hospital_code);
}
