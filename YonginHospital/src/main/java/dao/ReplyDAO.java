package dao;

import java.util.List;

import dto.Reply;

public interface ReplyDAO { //FoodDAO�������̽� ����
	
	int insert(Reply reply); //�������̽����� FoodDAOImpl���� ������ �޼ҵ� ����
	int delete(int id);
	int edit(Reply reply);
	List<Reply> selectlist(String hospital_code);
}
