package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ListReplyAction;
import action.ReplyWriteAction;


public class Controller extends HttpServlet {
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
		
		if (command.equals("/ReplyWriteAction.do")) { 
			action = new ReplyWriteAction(); 
			action.execute(request, response);
			RequestDispatcher rd = request.getRequestDispatcher("searchPage.jsp");
			rd.forward(request, response);
		}
		else if (command.equals("/ListReplyAction.do")) { 
			action = new ListReplyAction(); 
			action.execute(request, response);
			RequestDispatcher rd = request.getRequestDispatcher("replyView.jsp");
			rd.forward(request, response);
		}
		
	}

}
