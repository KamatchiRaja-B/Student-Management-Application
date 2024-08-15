<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/styles.css">
	    <title>Update Student</title>
	</head>
	<body>
		<div class="navbar">
	    <a href="<%= request.getContextPath() %>/index.jsp">Home</a>
	    <a href="<%= request.getContextPath() %>/jsp/registerPage.jsp">Register New Student</a>
	    <a href="<%= request.getContextPath() %>/fetchAllStudentsServlet">View All Students</a>
	    <a href="<%= request.getContextPath() %>/jsp/searchPage.jsp">Search Student</a>
	    <a href="<%= request.getContextPath() %>/jsp/updatePage.jsp" class="active">Update Student</a>
	    <a href="<%= request.getContextPath() %>/jsp/deletePage.jsp">Delete Student</a>
	</div>
	    
	        <div class="form-card">
	            <h1>Update Student Details</h1>
	            <form action="<%= request.getContextPath() %>/updateStudentServlet" method="post">
	                <div class="form-group">
	                    <label for="university-id">University ID</label>
	                    <input type="text" id="university-id" name="university-id" required>
	                </div>
	                <div class="form-group">
	                    <label for="name">Name</label>
	                    <input type="text" id="name" name="name" required>
	                </div>
	                <div class="form-group">
	                    <label for="email">Email</label>
	                    <input type="email" id="email" name="email" required>
	                </div>
	                <div class="form-group">
	                    <label for="branch">Branch</label>
	                    <input type="text" id="branch" name="branch" required>
	                </div>
	                <div class="form-group">
	                    <label for="address">Address</label>
	                    <input type="text" id="address" name="address" required>
	                </div>
	                <!-- Success/Error Message -->
			        <%
				        String message = (String) request.getAttribute("message");
				        if ("success".equals(message)) {
				    %>
				        <div class="alert success">
				            &#x2714; Updated successfully!
				        </div>
				    <%
				        } else if ("none".equals(message)) {
				    %>
				        <div class="alert error">
				            &#x274C; University ID doesn't exists. Please use a different ID.
				        </div>
				    <%
				        } else if ("error".equals(message)) {
				    %>
				        <div class="alert error">
				            &#x274C; An error occurred during registration. Please try again.
				        </div>
				    <%
				        }
				    %>
	                <button type="submit">Update Student</button>
	            </form>
	        </div>
	</body>
</html>