<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	   	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/styles.css">
	    <title>Admin Dashboard</title>
	</head>
	<body>
		<div class="navbar">
		    <a href="<%= request.getContextPath() %>/index.jsp" class="active">Home</a>
		    <a href="<%= request.getContextPath() %>/jsp/registerPage.jsp">Register New Student</a>
		    <a href="<%= request.getContextPath() %>/fetchAllStudentsServlet">View All Students</a>
		    <a href="<%= request.getContextPath() %>/jsp/searchPage.jsp">Search Student</a>
		    <a href="<%= request.getContextPath() %>/jsp/updatePage.jsp">Update Student</a>
		    <a href="<%= request.getContextPath() %>/jsp/deletePage.jsp">Delete Student</a>
		</div>
	    <div class="card">
	        <h1>Welcome to Student Management Dashboard</h1>
	        <div class="card-content">
	            <div class="card-item">
	                <button onclick="location.href='<%= request.getContextPath() %>/jsp/registerPage.jsp'">Register New Student</button>
	                <p>Add a new student to the database.</p>
	            </div>
	            <div class="card-item">
	                <button onclick="location.href='<%= request.getContextPath() %>/fetchAllStudentsServlet'">View All Existing Students</button>
	                <p>View the list of all students.</p>
	            </div>
	            <div class="card-item">
	                <button onclick="location.href='<%= request.getContextPath() %>/jsp/searchPage.jsp'">Search Student</button>
	                <p>Find a specific student details by ID.</p>
	            </div>
	            <div class="card-item">
	                <button onclick="location.href='<%= request.getContextPath() %>/jsp/updatePage.jsp'">Update Existing Student</button>
	                <p>Modify the details of an existing student.</p>
	            </div>
	            <div class="card-item">
	                <button onclick="location.href='<%= request.getContextPath() %>/jsp/deletePage.jsp'">Delete Student</button>
	                <p>Remove a student from the database.</p>
	            </div>
	        </div>
	    </div>
	</body>
</html>