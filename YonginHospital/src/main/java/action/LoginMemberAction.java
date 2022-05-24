package action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dao.MemberDAOImpl;
import jdbc.ConnectionProvider;

public class LoginMemberAction implements Action {
	   public void execute(HttpServletRequest request, HttpServletResponse response) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			HttpSession session = request.getSession();
			Connection conn = null;
			try {
				conn = ConnectionProvider.getConnection();
			} catch (SQLException ex) {
			}
			MemberDAO dao = new MemberDAOImpl(conn);
			if(dao.login(id, pw)==1) {
				session.setAttribute("userid", id);
				try {
					response.sendRedirect("main.jsp");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else {
				try {
					response.sendRedirect("login.jsp");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			

	        System.out.println("LoginMemberAction");	
	    }
}
