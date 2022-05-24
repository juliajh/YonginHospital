package action;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dao.MemberDAOImpl;
import dto.Member;
import jdbc.ConnectionProvider;

public class DeleteMemberAction implements Action {
	   public void execute(HttpServletRequest request, HttpServletResponse response) {
			String id = request.getParameter("id");

			Connection conn = null;
			try {
				conn = ConnectionProvider.getConnection();
			} catch (SQLException ex) {
			}
			MemberDAO dao = new MemberDAOImpl(conn);
			dao.delete(id);
		
	        System.out.println("Sucess Delete Student");
	    }
}
