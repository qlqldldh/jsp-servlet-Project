package controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import models.*;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class TestServvlet
 */
@WebServlet("/lectures")
public class LectureController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		
		KLectureDAO kld = new KLectureDAO();
		KBoardDAO kbd = new KBoardDAO();
		HttpSession session = request.getSession();
		
		String courseName = request.getParameter("crs");
		//System.out.println(courseName); // for test

		try {
			ArrayList<String> lecs = kld.selectNameByCrs(courseName);
			ArrayList<String> lconts = new ArrayList<>();
			for(int i=0;i<lecs.size();i++) lconts.add(kbd.selectContentByLec(lecs.get(i)));
//			System.out.println(courseName);
			session.setAttribute("lecs", lecs);
			session.setAttribute("lconts", lconts);
			response.sendRedirect("kostaedu/course-grid-2.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
