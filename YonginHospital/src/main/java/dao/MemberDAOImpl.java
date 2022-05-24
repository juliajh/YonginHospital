package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Member;
public class MemberDAOImpl implements MemberDAO {
	private Connection conn = null;
	public MemberDAOImpl(Connection conn) {
		this.conn = conn;
	}
	@Override
	public int insert(Member bean) { //sql에 값을 추가하는 insert 메소드
		PreparedStatement pstmt = null;
		try {
			String sql = "insert into members values (?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPw());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getAge());
			pstmt.setString(5, bean.getGender());			
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
	public int delete(String id) { //id를 입력받아서 그 id를 가진 항목을 제거하는 delete 메소드
		PreparedStatement pstmt = null;
		try {
			String sql = "delete from members where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
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
	public int edit(Member bean) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "update members set pw=?, name=?, age=?, gender=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getPw());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getAge());
			pstmt.setString(4, bean.getGender());
			pstmt.setString(5, bean.getId());
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

	@Override
	public Member select(String id) { //id를 parameter로 받아서 하나의 FoodBean을 선택하는 select 메소드
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select * from members where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return createFromResultSet(rs);
			}
			else {
				return null;
			}
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
	
	@Override
	public int login(String id, String pw)  { //id를 parameter로 받아서 하나의 FoodBean을 선택하는 select 메소드
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select * from members where id = ? and pw = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return 1;
			}
			else {
				return 0;
			}
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
	
	public Member createFromResultSet(ResultSet rs) { //resultSet을 받아서 FoodBean을 리턴하는 createFromResultSet 메소드
		try {
			String id = rs.getString("id");
			String pw = rs.getString("pw");
			String name = rs.getString("name");
			String age = rs.getString("age");
			String gender = rs.getString("gender");
			int grade = rs.getInt("grade");
			Member members = new Member(id,pw,name,age,gender);
			return members;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Member> selectlist() { //FoodBean 타입의 List를 리턴받는 selectList 메소드
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select * from members";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<Member> foodList = new ArrayList<>();
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
