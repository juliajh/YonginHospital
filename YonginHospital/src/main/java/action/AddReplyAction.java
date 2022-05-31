package action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReplyDAOImpl;
import dto.Reply;
import jdbc.ConnectionProvider;

public class AddReplyAction implements Action {
	   public void execute(HttpServletRequest request, HttpServletResponse response) {
		   	String hospital_code = request.getParameter("hospital_code");
		   	String noStr = request.getParameter("setBoard_no");
		   	String id = request.getParameter("id");
			String reply_content = request.getParameter("reply_content");
			String gradeStr = request.getParameter("grade");
			int setBoard_no = Integer.parseInt(noStr);
			int grade = Integer.parseInt(gradeStr);
			
			Reply reply = new Reply(hospital_code,setBoard_no,id,reply_content,grade);
			Connection conn = null;
			try {
				conn = ConnectionProvider.getConnection();
			} catch (SQLException ex) {
			}
			ReplyDAOImpl dao = new ReplyDAOImpl(conn);
			dao.insert(reply);
	        System.out.println("Sucess Add Member");
	        try {
				response.sendRedirect("searchPage.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
}