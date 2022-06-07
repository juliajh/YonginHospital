package action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dao.MemberDAOImpl;
import jdbc.ConnectionProvider;

public class LoginMemberAction implements Action {
	   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			HttpSession session = request.getSession();
			Connection conn = null;
			try {
				conn = ConnectionProvider.getConnection();
			} catch (SQLException ex) {
			}
			MemberDAO dao = new MemberDAOImpl(conn);
			int loginResult = dao.login(id, pw);
			if(loginResult==1) {
				request.setAttribute("loginResult", loginResult);
				System.out.println("loginSuccess");
				session = request.getSession();
				System.out.println(session);
				session.setAttribute("sessionID", id);
				RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
				rd.forward(request, response);
			}
			else {
				request.setAttribute("loginResult", loginResult);
				RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
				rd.forward(request, response);
			}
	        System.out.println("LoginMemberAction");
	    }
}
