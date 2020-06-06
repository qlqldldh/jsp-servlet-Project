package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.*;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.sql.*;
import java.io.PrintWriter;

/**
 * Servlet implementation class QuestionController
 */
@WebServlet("/question/*")
public class QuestionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		QcommentDAO qcd = new QcommentDAO();
		
		if(request.getRequestURI().equals("/kostaProject/question/list")) {
			HttpSession session = request.getSession();
			try {
				ArrayList uploadq = qcd.selectList();
				session.setAttribute("uploadq", uploadq);
				
				response.sendRedirect("../kostaedu/uploadQ.jsp");
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} else if(request.getRequestURI().equals("/kostaProject/question/detail")) {
			HttpSession session = request.getSession();
			try {
				String title = request.getParameter("uqdet");
				ArrayList<String> showq = qcd.selectDetail(title);
				
				session.setAttribute("showq", showq);
				
				response.sendRedirect("../kostaedu/showQ.jsp");
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} else if(request.getRequestURI().equals("/kostaProject/question/write")) {
			HttpSession session = request.getSession();
			KLectureDAO kld = new KLectureDAO();
			
			try {
				if (kld.hasLect(request.getParameter("qlect"))) {
					int queno = qcd.getQueNo();
					String qtitle = request.getParameter("qtitle");
					String id = (String) session.getAttribute("id");
					int lecno = new KLectureDAO().getNoByName(request.getParameter("qlect"));
					String qcontent = request.getParameter("qcontent");
					
					System.out.println(qcd.insert(new QcommentVO(queno,qtitle,id,lecno,qcontent)) + "inserted");
					response.sendRedirect("list");
				} else {
					PrintWriter out = response.getWriter();
					out.print("<html><body><script>alert('Wrong Access : there is no lecture in the list'); location.href='../kostaedu/writeQ.jsp'</script></body></html>");
				}
				
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
