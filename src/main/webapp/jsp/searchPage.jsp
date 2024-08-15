<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.app.model.Student" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/styles.css">
	    <title>Search Student</title>
	</head>
	<body>
		<div class="navbar">
		    <a href="<%= request.getContextPath() %>/index.jsp">Home</a>
		    <a href="<%= request.getContextPath() %>/jsp/registerPage.jsp">Register New Student</a>
		    <a href="<%= request.getContextPath() %>/fetchAllStudentsServlet">View All Students</a>
		    <a href="<%= request.getContextPath() %>/jsp/searchPage.jsp" class="active">Search Student</a>
		    <a href="<%= request.getContextPath() %>/jsp/updatePage.jsp">Update Student</a>
		    <a href="<%= request.getContextPath() %>/jsp/deletePage.jsp">Delete Student</a>
		</div>
		<div class="form-card">
	            <h1>Search for a Student</h1>
	            <form action="<%= request.getContextPath() %>/searchStudentServlet" method="get">
	                <div class="form-group">
	                    <label for="univId">University ID</label>
	                    <input type="text" id="univId" name="search-id" 
	                           value="<%= request.getParameter("search-id") != null ? request.getParameter("search-id") : "" %>" 
	                           required>
	                </div>
			        <!-- Success/Error Message -->
			        <%
				        String message = (String) request.getAttribute("message");
				        if ("success".equals(message)) {
				    %>
				        <div class="alert success">
				            &#x2714; Student fetched successfully!
				        </div>
				    <%
				        } else if ("error".equals(message)) {
				    %>
				        <div class="alert error">
				            &#x274C; No such student exists. Please try again.
				        </div>
				    <%
				        }
				    %>
	                <input type="submit" value="Search Student" class="btn">
	            </form>
	        </div>
	    <%
        // Fetch the student object and message
        Student student = (Student) request.getAttribute("student");
		if ("success".equals(message) && student != null) {
		%>
	    <div class="table-container">
	        <h1>Student Details</h1>
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
	                <tr>
	                    <td><%= student.getUnivId() %></td>
	                    <td><%= student.getName() %></td>
	                    <td><%= student.getEmail() %></td>
	                    <td><%= student.getBranch() %></td>
	                    <td><%= student.getAddress() %></td>
	                </tr>
	            </tbody>
	        </table>
	    </div>
	    <%
		}
		%>
	</body>
</html>
