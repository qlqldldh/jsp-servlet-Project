package testPack;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

/**
 * Servlet implementation class TestController
 */
@WebServlet("*.do")
public class TestController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String path = requestURI.substring(contextPath.length()+1);
		
		ActionForward forward=null;
		Action action=null;
//		System.out.println(path);
		if(path.equals("main.do")) {
			String from = request.getParameter("but");
			System.out.println(from);
			
			forward=new ActionForward();
			
			forward.setRedirect(true);
			
			if(from.equals("select")) forward.setPath("select.do");
			else if(from.equals("insert")) forward.setPath("insert.do");
			
		} else if(path.equals("select.do")) {
			action=new ListAction();
			forward=action.execute(request, response);
			
		} else if(path.equals("insert.do")) {
			// need to fill this space (not yet to create InsertAction)
			forward=new ActionForward();
			forward.setPath("insert.jsp");
			forward.setRedirect(false);
		} else if(path.equals("insertAction.do")) {
			action=new InsertAction();
			forward=action.execute(request, response);
		}
		
		
		if(forward!=null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}
			else {
				RequestDispatcher dispatch = request.getRequestDispatcher(forward.getPath());
				dispatch.forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
