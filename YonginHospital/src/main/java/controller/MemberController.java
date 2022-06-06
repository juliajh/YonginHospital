package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.AddMemberAction;
import action.AddReplyAction;
import action.DeleteMemberAction;
import action.EditMemberAction;
import action.ListReplyAction;
import action.LoginMemberAction;
import action.SelectMemberAction;

public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		Action action = null;
		if (command.equals("/ListReplyMemberAction.do")) { // list view
			action = new ListReplyAction(); // return personList w/ mode
			action.execute(request, response);
		} else if (command.equals("/DetailViewMemberAction.do")) { // detail view
			action = new SelectMemberAction(); // return person
			action.execute(request, response);
			RequestDispatcher rd = request.getRequestDispatcher("detailView.jsp");
			rd.forward(request, response);
		} else if (command.equals("/AddViewMemberAction.do")) { // add view
			RequestDispatcher rd = request.getRequestDispatcher("addView.jsp");
			//RequestDispatcher rd = request.getRequestDispatcher("updateView.jsp?mode=add");
			rd.forward(request, response);
		} else if (command.equals("/LoginMemberAction.do")) { // add view
			action = new LoginMemberAction(); // return person
			action.execute(request, response);
		} else if (command.equals("/EditViewMemberAction.do")) { // edit view
			action = new SelectMemberAction(); // return person
			action.execute(request, response);
			RequestDispatcher rd = request.getRequestDispatcher("editView.jsp");
			//RequestDispatcher rd = request.getRequestDispatcher("updateView.jsp?mode=edit");
			rd.forward(request, response);
		} else if (command.equals("/AddMemberAction.do")) { // add
			action = new AddMemberAction(); // add person
			action.execute(request, response);
		} else if (command.equals("/EditMemberAction.do")) { // edit
			action = new EditMemberAction(); // edit person
			action.execute(request, response);
			RequestDispatcher rd = request.getRequestDispatcher("/ListViewMemberAction.do?mode=edit");
			rd.forward(request, response);
		} else if (command.equals("/DeleteMemberAction.do")) { // delete
			action = new DeleteMemberAction(); // delete person
			action.execute(request, response);
			RequestDispatcher rd = request.getRequestDispatcher("/ListViewMemberAction.do?mode=delete");
			rd.forward(request, response);
		} else if (command.equals("/AddReplyAction.do")) { // delete
			action = new AddReplyAction(); // delete person
			action.execute(request, response);
		} 
	}

}
