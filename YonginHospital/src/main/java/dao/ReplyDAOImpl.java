package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Reply;

public class ReplyDAOImpl {
	private Connection conn = null;
	public ReplyDAOImpl(Connection conn) {
		this.conn = conn;
	}
	
	public int insert(Reply bean) { //sql�� ���� �߰��ϴ� insert �޼ҵ�
		PreparedStatement pstmt = null;
		try {
			String sql = "insert into reply values (?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getHospital_code());
			pstmt.setString(2, bean.getId());
			pstmt.setString(3, bean.getReply_content());
			pstmt.setInt(4, bean.getGrade());			
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
	
	public int delete(String reply_content) { //id�� �Է¹޾Ƽ� �� id�� ���� �׸��� �����ϴ� delete �޼ҵ�
		PreparedStatement pstmt = null;
		try {
			String sql = "delete from reply where reply_content=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reply_content);
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
	
	public Reply createFromResultSet(ResultSet rs) { //resultSet�� �޾Ƽ� FoodBean�� �����ϴ� createFromResultSet �޼ҵ�
		try {
			String code = rs.getString("hospital_code");
			String id = rs.getString("id");
			String content = rs.getString("reply_content");
			int grade = rs.getInt("grade");
			Reply replys = new Reply(code,id,content,grade);
			return replys;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<Reply> selectlist(String hosptial_code) { //FoodBean Ÿ���� List�� ���Ϲ޴� selectList �޼ҵ�
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select * from reply where hospital_code=?";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<Reply> replyList = new ArrayList<>();
			while (rs.next()) {
				replyList.add(createFromResultSet(rs));
			}
			return replyList;
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