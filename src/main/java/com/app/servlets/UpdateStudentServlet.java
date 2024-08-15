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
@WebServlet("/updateStudentServlet")
public class UpdateStudentServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int univId = Integer.parseInt(req.getParameter("university-id"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String branch = req.getParameter("branch");
        String address = req.getParameter("address");

        StudentDao studentDao = new StudentDaoImpl();
        Student student = new Student(univId, name, email, branch, address);

        int result = studentDao.updateStudent(student);

        String message;
        if (result > 0) {
            message = "success";
        } else if (studentDao.fetchStudentById(univId) == null) {
            message = "none";
        } else {
            message = "error";
        }

        req.setAttribute("message", message);
        req.getRequestDispatcher("/jsp/updatePage.jsp").forward(req, resp);
	}
}
