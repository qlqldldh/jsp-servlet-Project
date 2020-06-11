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
		HttpSession session = request.getSession();
		if(request.getRequestURI().equals("/kostaProject/question/list")) {
			
			try {
				ArrayList uploadq = qcd.selectList();
				session.setAttribute("uploadq", uploadq);
				
				response.sendRedirect("../kostaedu/uploadQ.jsp");
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} else if(request.getRequestURI().equals("/kostaProject/question/detail")) {
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
			KLectureDAO kld = new KLectureDAO();
			
			try {
				if (kld.hasLect(request.getParameter("qlect")) && request.getParameter("qtitle")!=null) {
					int queno = qcd.getNewQueNo();
					String qtitle = request.getParameter("qtitle");
					String id = (String) session.getAttribute("id");
					int lecno = new KLectureDAO().getNoByName(request.getParameter("qlect"));
					String qcontent = request.getParameter("qcontent");
					
					System.out.println(qcd.insert(new QcommentVO(queno,qtitle,id,lecno,qcontent)) + "inserted");
					response.sendRedirect("list");
				} else {
					PrintWriter out = response.getWriter();
					out.print("<html><body><script>alert('Wrong Access : there is no such lecture in the list'); location.href='../kostaedu/writeQ.jsp'</script></body></html>");
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} 
		} else if(request.getRequestURI().equals("/kostaProject/question/wreply")) {
			try {
				ArrayList<String> sq = (ArrayList<String>)session.getAttribute("showq");
				
				int qrno = new QreplyDAO().getNewQrno();
				String reply = request.getParameter("replytxt");
				int queno = qcd.getQueno(sq.get(0), sq.get(1), sq.get(3)); // get from session "showq" __ inf : 0_title / 1_id / 3_contents
				String id = (String)session.getAttribute("id");
				
				System.out.println(new QreplyDAO().insert(new QreplyVO(qrno,reply,queno,id)) + " inserted");
				
				PrintWriter out = response.getWriter();
				
				out.print("<script>alert('reply'); location.href='detail?uqdet="+sq.get(0)+"'</script>");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if(request.getRequestURI().equals("/kostaProject/question/rreply")) {
			try {
				PrintWriter out = response.getWriter();
				
				ArrayList<String> sq = (ArrayList<String>)session.getAttribute("showq");
				int queno = qcd.getQueno(sq.get(0), sq.get(1), sq.get(3)); // get from session "showq" __ inf : 0_title / 1_id / 3_contents
				
				ArrayList<QreplyVO> rpls = new QreplyDAO().select(queno);
				String json="{\"qreply\":[";
				for(int i=0;i<rpls.size();i++) {
					json+="{\"qrno\":";
					json+=rpls.get(i).getQrno()+",";
					json+="\"reply\":\"";
					json+=rpls.get(i).getReply()+"\",";
					json+="\"queno\":";
					json+=rpls.get(i).getQueno()+",";
					json+="\"id\":\"";
					json+=rpls.get(i).getId()+"\"}";
					
					if(i!=rpls.size()-1) json+=",";
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
