package action;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReplyDAO;
import dao.ReplyDAOImpl;
import dto.Reply;
import jdbc.ConnectionProvider;

public class ReplyWriteAction implements Action {

	@Override
	 public void execute(HttpServletRequest request, HttpServletResponse response) {
	   	String hospital_code = request.getParameter("hostpital_code");
	   	String setBoard_noStr = request.getParameter("setBoard_no");
		String id = request.getParameter("id");
		String reply_content = request.getParameter("reply_content");
		String gradeStr = request.getParameter("grade");
		int setBoard_no = Integer.valueOf(setBoard_noStr);
		int grade = Integer.valueOf(gradeStr);
		
		Reply reply = new Reply(hospital_code,setBoard_no,id,reply_content,grade);

		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
		} catch (SQLException ex) {
		}
		ReplyDAO dao = new ReplyDAOImpl(conn);
		dao.insert(reply);
        System.out.println("Sucess Add Student");
    }
}


