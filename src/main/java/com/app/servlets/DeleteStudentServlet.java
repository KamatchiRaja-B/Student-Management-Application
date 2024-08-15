package com.app.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.dao.StudentDao;
import com.app.daoimpl.StudentDaoImpl;

@SuppressWarnings("serial")
@WebServlet("/deleteStudentServlet")
public class DeleteStudentServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int univId = Integer.parseInt(req.getParameter("university-id"));

        StudentDao studentDao = new StudentDaoImpl();
        int result = studentDao.deleteStudent(univId);

        String message;
        if (result > 0) {
            message = "success";
        } else if (studentDao.fetchStudentById(univId) == null) {
            message = "none";
        } else {
            message = "error";
        }

        req.setAttribute("message", message);
        req.getRequestDispatcher("/jsp/deletePage.jsp").forward(req, resp);
    }
}
