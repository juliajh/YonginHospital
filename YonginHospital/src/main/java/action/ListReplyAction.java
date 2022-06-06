package action;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReplyDAOImpl;
import jdbc.ConnectionProvider;

public class ListReplyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String code = request.getParameter("hospital_name");

		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
		} catch (SQLException ex) {
		}
		ReplyDAOImpl dao = new ReplyDAOImpl(conn);    
        
		request.setAttribute("replyList", dao.selectlist(code));
		RequestDispatcher rd = request.getRequestDispatcher("searchPage.jsp?hospital_name="+code);
        System.out.println("pList.size()=" + dao.selectlist(code).size());
	}
}
