package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Reply;

public class ReplyDAOImpl implements ReplyDAO{
	private Connection conn = null;
	public ReplyDAOImpl(Connection conn) {
		this.conn = conn;
	}
	
	@Override
	public int insert(Reply reply) { //sql�� ���� �߰��ϴ� insert �޼ҵ�
		PreparedStatement pstmt = null;
		try {
			String sql = "insert into Reply values (?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reply.getHospital_code());
			pstmt.setInt(2, reply.getSetBoard_no());
			pstmt.setString(3, reply.getId());
			pstmt.setString(4, reply.getReply_content());
			pstmt.setInt(5, reply.getGrade());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return 0;
	}

	@Override
	public int delete(int id) { //id�� �Է¹޾Ƽ� �� id�� ���� �׸��� �����ϴ� delete �޼ҵ�
		PreparedStatement pstmt = null;
		try {
			String sql = "delete from Reply where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return 0;
	}
//�����ؾ���
	@Override 
	public int edit(Reply reply) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "update Reply set hospital_code=?, subject=?, grade=? where name=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reply.getHospital_code());
			pstmt.setInt(2, reply.getSetBoard_no());
			pstmt.setString(3, reply.getId());
			pstmt.setString(4, reply.getReply_content());
			pstmt.setInt(5, reply.getGrade());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return 0;
	}
	
	public Reply createFromResultSet(ResultSet rs) { //resultSet�� �޾Ƽ� FoodBean�� �����ϴ� createFromResultSet �޼ҵ�
		try {
			String hospital_code = rs.getString("hospital_code");
			int setBoard_no = rs.getInt("setBoard_no");
			String id = rs.getString("id");
			String reply_content = rs.getString("reply_content");
			int grade = rs.getInt("grade");
			Reply Reply = new Reply(hospital_code,setBoard_no,id,reply_content,grade);
			return Reply;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Reply> selectlist(String hospital_code) { //FoodBean Ÿ���� List�� ���Ϲ޴� selectList �޼ҵ�
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select * from reply where hospital_code = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hospital_code);
			rs = pstmt.executeQuery();
			List<Reply> foodList = new ArrayList<>();
			while (rs.next()) {
				foodList.add(createFromResultSet(rs));
			}
			return foodList;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}

}