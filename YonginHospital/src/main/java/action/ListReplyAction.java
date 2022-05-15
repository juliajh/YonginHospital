package action;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReplyDAO;
import dao.ReplyDAOImpl;
import jdbc.ConnectionProvider;

public class ListReplyAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mode = request.getParameter("mode");
		String hospital_code = request.getParameter("hospital_code");

		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
		} catch (SQLException ex) {
		}
		ReplyDAO dao = new ReplyDAOImpl(conn);    
        
		request.setAttribute("replyList", dao.selectlist(hospital_code));		
        request.setAttribute("mode", mode);

        System.out.println("ListStudentAction mode=" + mode);
        System.out.println("pList.size()=" + dao.selectlist(hospital_code).size());
	}
}