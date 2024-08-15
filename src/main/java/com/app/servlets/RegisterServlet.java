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
@WebServlet("/registerServlet")
public class RegisterServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int univId = Integer.parseInt(req.getParameter("univId"));
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String branch = req.getParameter("branch");
		String address = req.getParameter("address");
		
		Student student = new Student(univId, name, email, branch, address);
		
		StudentDao studentDao = new StudentDaoImpl();
		int status = 0;
		String message = "";
		try {
			status = studentDao.addStudent(student);
			if (status > 0) {
				message = "success";
			} else {
				message = "duplicate";
			}
		} catch (Exception e) {
			message = "error";
		}
		
		req.setAttribute("message", message);
		req.getRequestDispatcher("jsp/registerPage.jsp").forward(req, resp);
		
	}

}
