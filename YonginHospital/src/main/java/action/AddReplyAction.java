package action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReplyDAOImpl;
import dto.Reply;
import jdbc.ConnectionProvider;

public class AddReplyAction implements Action {
	   public void execute(HttpServletRequest request, HttpServletResponse response) {
		   	String hospital_name = request.getParameter("hospital_name");
		   	String id = request.getParameter("id");
			String reply_content = request.getParameter("reply_content");
			String gradeStr = request.getParameter("grade");
			int grade = Integer.parseInt(gradeStr);
			System.out.println(hospital_name);
			System.out.println(id);
			System.out.println(reply_content);
			System.out.println(grade);
			Reply reply = new Reply(hospital_name,id,reply_content,grade);
			Connection conn = null;
			try {
				conn = ConnectionProvider.getConnection();
			} catch (SQLException ex) {
			}
			ReplyDAOImpl dao = new ReplyDAOImpl(conn);
			dao.insert(reply);
	        System.out.println("Sucess Add reply");
	        System.out.println(hospital_name);
	        RequestDispatcher rd = request.getRequestDispatcher("searchPage.jsp?hospital_name="+hospital_name);
			try {
				rd.forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
}