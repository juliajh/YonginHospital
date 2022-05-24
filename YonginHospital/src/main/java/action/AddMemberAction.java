package action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dao.MemberDAOImpl;
import dto.Member;
import jdbc.ConnectionProvider;

public class AddMemberAction implements Action {
	   public void execute(HttpServletRequest request, HttpServletResponse response) {
		   	String id = request.getParameter("id");
		   	String pw = request.getParameter("pw");
		   	String name = request.getParameter("name");
			String age = request.getParameter("age");
			String gender = request.getParameter("gender");
			
			Member student = new Member(id,pw,name,age,gender);

			Connection conn = null;
			try {
				conn = ConnectionProvider.getConnection();
			} catch (SQLException ex) {
			}
			MemberDAO dao = new MemberDAOImpl(conn);
			dao.insert(student);
	        System.out.println("Sucess Add Student");
	        try {
				response.sendRedirect("login.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
}
