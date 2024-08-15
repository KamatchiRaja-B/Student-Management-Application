package com.app.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.app.dao.StudentDao;
import com.app.daoimpl.StudentDaoImpl;
import com.app.model.Student;

@SuppressWarnings("serial")
@WebServlet("/searchStudentServlet")
public class SearchStudentServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String searchIdParam = req.getParameter("search-id");
		int univId;
		String message = "";
		Student student = null;
		
		try {
			univId = Integer.parseInt(searchIdParam);
			StudentDao studentDao = new StudentDaoImpl();
			student = studentDao.fetchStudentById(univId);
			if (student != null) {
				message = "success";
			} else {
				message = "error";
			}
		} catch (NumberFormatException e) {
			message = "error";
		}
		
		req.setAttribute("message", message);
		req.setAttribute("student", student);
		req.getRequestDispatcher("jsp/searchPage.jsp").forward(req, resp);

	}
}
