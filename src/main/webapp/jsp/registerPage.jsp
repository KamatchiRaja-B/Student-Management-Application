<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/styles.css">
    <title>Register New Student</title>
</head>
	<body>
	    <div class="navbar">
		    <a href="<%= request.getContextPath() %>/index.jsp">Home</a>
		    <a href="<%= request.getContextPath() %>/jsp/registerPage.jsp" class="active">Register New Student</a>
		    <a href="<%= request.getContextPath() %>/fetchAllStudentsServlet">View All Students</a>
		    <a href="<%= request.getContextPath() %>/jsp/searchPage.jsp">Search Student</a>
		    <a href="<%= request.getContextPath() %>/jsp/updatePage.jsp">Update Student</a>
		    <a href="<%= request.getContextPath() %>/jsp/deletePage.jsp">Delete Student</a>
		</div>
		<div class="form-card">
            <h1>Register New Student</h1>
            
            <form action="<%= request.getContextPath() %>/registerServlet" method="post">
                <div class="form-group">
                    <label for="university-id">University ID</label>
                    <input type="text" id="university-id" name="univId" required>
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
			            &#x2714; Student registered successfully!
			        </div>
			    <%
			        } else if ("duplicate".equals(message)) {
			    %>
			        <div class="alert error">
			            &#x274C; University ID already exists. Please use a different ID.
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
                <input type="submit" value="Add Student" class="btn">
            </form>
        </div>
	</body>
</html>
