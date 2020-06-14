package testPack;

import javax.servlet.http.*;

import java.sql.SQLException;
import java.util.ArrayList;
import models.*;

public class ListAction implements Action{
	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		forward.setPath("select.jsp");
		forward.setRedirect(false);
		
		try {
			request.setAttribute("sels",new TestDAO().select());
			return forward;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
