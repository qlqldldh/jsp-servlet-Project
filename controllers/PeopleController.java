package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.*;
import java.sql.*;
import java.io.PrintWriter;



/**
 * Servlet implementation class LoginController
 */
@WebServlet("/people/*")
public class PeopleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		KostaPeopleDAO kpd=new KostaPeopleDAO();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String str = request.getRequestURI();
		HttpSession session = request.getSession();
		
		if(str.equals("/kostaProject/people/login")) {
			
			try {
				if (session.getAttribute("id") == null) {
					String id = request.getParameter("id");
					String pwd = request.getParameter("pwd");
					if (kpd.hasLogData(id, pwd)) {
						session.setAttribute("id", id);
						session.setAttribute("pwd", pwd);
						response.sendRedirect("../kostaedu/index.jsp");
					} else {
						response.sendRedirect("../kostaedu/loginFail.html"); // send to login false page
					}
				}
				else {
					session.invalidate();
					out.print(
							"<html><body><script>alert('Success to Log out'); location.href='../kostaedu/index.jsp'</script></body></html>");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		} else if(str.equals("/kostaProject/people/regis")) {
			 // 유효성 검사는 front단에서 해결 //
			String id= request.getParameter("regid");
			String pwd= request.getParameter("regpwd");
			String name= request.getParameter("regname");
			int age= Integer.parseInt(request.getParameter("regage"));
			String email= request.getParameter("regemail");
			String memType = request.getParameter("regsel");
			
			try {
				System.out.println(kpd.insert(new KostaPeopleVO(id,pwd,name,age,email))+" datas recorded.");
				if(memType.equals("Student")) { 
					KStudentDAO ksd = new KStudentDAO();
					int seq = ksd.getNewStudNumber();
					System.out.println(ksd.insert(new KStudentVO(seq,id))+" datas recorded"); 
					System.out.println("option Student regis success");
				} else if(memType.equals("Teacher")) {
					KTeacherDAO ktd = new KTeacherDAO();
					int seq=ktd.getNewTeacherNumber();
					System.out.println(ktd.insert(new KTeacherVO(seq,id))+" datas recorded");
					System.out.println("option Teacher regis success");
				}
				response.sendRedirect("../kostaedu/index.jsp");
				//out.println("<html><body><h1>register Success!</h1></body></html>"); // for test.
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {
			out.println("<html><body><h1> Wrong Page Access </h1></body></html>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
