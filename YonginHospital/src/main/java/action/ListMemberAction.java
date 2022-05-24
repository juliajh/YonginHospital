package action;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dao.MemberDAOImpl;
import jdbc.ConnectionProvider;

public class ListMemberAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mode = request.getParameter("mode");

		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
		} catch (SQLException ex) {
		}
		MemberDAO dao = new MemberDAOImpl(conn);    
        
		request.setAttribute("MemberList", dao.selectlist());		
        request.setAttribute("mode", mode);

        System.out.println("ListMemberAction mode=" + mode);
        System.out.println("pList.size()=" + dao.selectlist().size());
	}
}
