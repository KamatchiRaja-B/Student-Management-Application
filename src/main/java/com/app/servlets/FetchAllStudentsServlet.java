package com.app.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.dao.StudentDao;
import com.app.daoimpl.StudentDaoImpl;
import com.app.model.Student;

@SuppressWarnings("serial")
@WebServlet("/fetchAllStudentsServlet")
public class FetchAllStudentsServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StudentDao studentDao = new StudentDaoImpl();
		List<Student> studentsList = studentDao.fetchAllStudents();
		
		req.setAttribute("studentsList", studentsList);
		
		req.getRequestDispatcher("jsp/fetchAllPage.jsp").forward(req, resp);
	}
}
