package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.TestDAO;
import models.TestVO;

/**
 * Servlet implementation class TestServer
 */
@WebServlet("/test/*")
public class TestServer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		
		if(request.getRequestURI().equals("/kostaProject/test/insert")) {
			int nums = Integer.parseInt(request.getParameter("nums"));
			int id = Integer.parseInt(request.getParameter("id"));
			try {
				new TestDAO().insert(nums,id);
				out.print("<html><body><script>alert('insert success'); location.href='../index.jsp'</script></body></html>");
				System.out.println("insert success");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} else if(request.getRequestURI().equals("/kostaProject/test/select")) {
			try {
				ArrayList<TestVO> numbers = new TestDAO().select();
				String json="{\"test\":[";
				for(int i=0;i<numbers.size();i++) {
					json+="{\"id\":";
					json+=numbers.get(i).getId()+",";
					json+="\"nums\":";
					json+=numbers.get(i).getNums()+"}";
					if(i!=numbers.size()-1) json+=",";
				}
				json+="]}";
				
				out.print(json);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
