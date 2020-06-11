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


@WebServlet("/lectures/*")
public class LectureController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		
		KLectureDAO kld = new KLectureDAO();
		KBoardDAO kbd = new KBoardDAO();
		HttpSession session = request.getSession();
		
		if (request.getRequestURI().equals("/kostaProject/lectures/list")) {
			String courseName = request.getParameter("crs")==null?(String)session.getAttribute("crs"):request.getParameter("crs");

			try {
				ArrayList<Pair> lecs = kld.selectPairByCrs(courseName);
				ArrayList<Integer> lecnos = new ArrayList<>();
				
				for(int i=0;i<lecs.size();i++) lecnos.add(kld.getLecNo(lecs.get(i).first, lecs.get(i).second));
				
				session.setAttribute("lecs", lecs);
				session.setAttribute("lecnos", lecnos);
				
				session.setAttribute("crs", courseName); // writeLecture.jsp에 자동으로 couse name을 가져다 쓸 수 있도록 함. 경우에 따라 지울 수 있음
				
				response.sendRedirect("../kostaedu/course-grid-2.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if(request.getRequestURI().equals("/kostaProject/lectures/detail")) {
			int lcno = Integer.parseInt(request.getParameter("lcno"));
			
			try {
				ArrayList<String> bContents = kbd.selectByLecno(lcno);
				bContents.add(Integer.toString(lcno));
				session.setAttribute("bContents", bContents);
				
				response.sendRedirect("../kostaedu/showLecture.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if(request.getRequestURI().equals("/kostaProject/lectures/write")) {
			try {
				int lecno = kld.getNewLecno();
				String wllecname = request.getParameter("wllecname"); // klecture
				int lecdur = Integer.parseInt(request.getParameter("wllecdur"));
				int ktno = new KTeacherDAO().getKtnoById((String)session.getAttribute("id"));
				String crsname = (String)session.getAttribute("crs");
				
				kld.insert(new KLectureVO(lecno,wllecname,lecdur,ktno,crsname)); //  klecture table insert
				
				
				int boardno = kbd.getNewBoardno();
				String wlstartdate = request.getParameter("wlstartdate"); // kboard
				String wlloc = request.getParameter("wlloc"); // kboard
				String wlpurpose = request.getParameter("wlpurpose"); // kboard
				String wlcontents = request.getParameter("wlcontents"); // kboard
				String wlktarget = request.getParameter("wlktarget"); // kboard
				
				kbd.insert(new KBoardVO(boardno,lecno,wlstartdate,wlloc,wlpurpose,wlcontents,wlktarget)); // kboard table insert
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			response.sendRedirect("list");
		} else if(request.getRequestURI().equals("/kostaProject/lectures/uplec")) {
			int sllecno = Integer.parseInt(request.getParameter("sllecno"));
			try {
				if(new KStudentDAO().updateLecNo((String)session.getAttribute("id"), sllecno)>0) {
					System.out.println("success to enroll lecture");
				} else {
					System.out.println("fail to enroll lecture");
				}
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			response.sendRedirect("list");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
