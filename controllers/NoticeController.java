package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.*;
import java.util.ArrayList;
import java.sql.*;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class NoticeController
 */
@WebServlet("/notice/*")
public class NoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		NoticeDAO ntd = new NoticeDAO();
		if(request.getRequestURI().equals("/kostaProject/notice/list")) {
			HttpSession session = request.getSession();
			try {
				ArrayList notlst = ntd.selectList();
				session.setAttribute("notlst", notlst);
				
				response.sendRedirect("../kostaedu/notice.jsp");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if(request.getRequestURI().equals("/kostaProject/notice/detail")) {
			HttpSession session = request.getSession();
			try {
				ArrayList<String> notDetails = ntd.selectDetail(request.getParameter("ntcDetail"));
				session.setAttribute("notdet", notDetails);
				
				response.sendRedirect("../kostaedu/showNotice.jsp");
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} else if(request.getRequestURI().equals("/kostaProject/notice/write")) {
			String ntitle = request.getParameter("ntitle");
			String ncontent = request.getParameter("ncontent");
			try {
				System.out.println(ntd.insert(new NoticeVO(ntitle,ncontent))+" inserted");
				response.sendRedirect("list");
			} catch (SQLException e) {
				// TODO: handle exception
			}
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
