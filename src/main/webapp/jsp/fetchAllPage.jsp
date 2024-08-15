<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.app.model.Student" %>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/styles.css">
	    <title>View All Students</title>
	</head>
	<body>
		<div class="navbar">
	        <a href="<%= request.getContextPath() %>/index.jsp">Home</a>
	        <a href="<%= request.getContextPath() %>/jsp/registerPage.jsp">Register New Student</a>
	        <a href="<%= request.getContextPath() %>/fetchAllStudentsServlet"" class="active">View All Students</a>
	        <a href="<%= request.getContextPath() %>/jsp/searchPage.jsp">Search Student</a>
	        <a href="<%= request.getContextPath() %>/jsp/updatePage.jsp">Update Student</a>
	        <a href="<%= request.getContextPath() %>/jsp/deletePage.jsp">Delete Student</a>
	    </div>
	    <div class="table-container">
	        <h1>Students List</h1>
	        <table class="student-table">
	            <thead>
	                <tr>
	                    <th>University ID</th>
	                    <th>Name</th>
	                    <th>Email</th>
	                    <th>Branch</th>
	                    <th>Address</th>
	                </tr>
	            </thead>
	            <tbody>
	                <%
	                    List<Student> studentsList = (List<Student>) request.getAttribute("studentsList");
	                    if (studentsList != null && !studentsList.isEmpty()) {
	                        for (Student student : studentsList) {
	                %>
	                <tr>
	                    <td><%= student.getUnivId() %></td>
	                    <td><%= student.getName() %></td>
	                    <td><%= student.getEmail() %></td>
	                    <td><%= student.getBranch() %></td>
	                    <td><%= student.getAddress() %></td>
	                </tr>
	                <%
	                        }
	                    } else {
	                %>
	                <tr>
	                    <td colspan="5">No students found.</td>
	                </tr>
	                <%
	                    }
	                %>
	            </tbody>
	        </table>
	    </div>
	</body>
</html>