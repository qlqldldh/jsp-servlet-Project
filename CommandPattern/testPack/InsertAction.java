package testPack;

import javax.servlet.http.*;
import models.*;
import java.sql.*;

public class InsertAction implements Action{
	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		TestDAO td = new TestDAO();
		int nums = Integer.parseInt(request.getParameter("nums"));
		int id = Integer.parseInt(request.getParameter("id"));
		
		try {
			System.out.println(td.insert(new TestVO(nums,id))+" inserted");
		} catch (SQLException e) {
			// TODO: handle exception
		}
		
		forward.setPath("main.jsp");
		forward.setRedirect(true);
		
		return forward;
	}
}
