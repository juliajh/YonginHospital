package action;

import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReplyDAOImpl;
import jdbc.ConnectionProvider;

public class ListReplyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String code = request.getParameter("hospital_code");

		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
		} catch (SQLException ex) {
		}
		ReplyDAOImpl dao = new ReplyDAOImpl(conn);    
        
		request.setAttribute("ReplyList", dao.selectlist(code));		

        System.out.println("pList.size()=" + dao.selectlist(code).size());
	}
}
