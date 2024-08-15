<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/styles.css">
    <title>Delete Student</title>
</head>
<body>
    <div class="navbar">
        <a href="<%= request.getContextPath() %>/index.jsp">Home</a>
        <a href="<%= request.getContextPath() %>/jsp/registerPage.jsp">Register New Student</a>
        <a href="<%= request.getContextPath() %>/fetchAllStudentsServlet">View All Students</a>
        <a href="<%= request.getContextPath() %>/jsp/searchPage.jsp">Search Student</a>
        <a href="<%= request.getContextPath() %>/jsp/updatePage.jsp">Update Student</a>
        <a href="<%= request.getContextPath() %>/jsp/deletePage.jsp" class="active">Delete Student</a>
    </div>

    <div class="form-card">
        <h1>Delete Student</h1>
        <p class="warning">Warning: This action cannot be undone. Please be certain before proceeding.</p>
        <form action="<%= request.getContextPath() %>/deleteStudentServlet" method="post">
            <div class="form-group">
                <label for="university-id">University ID</label>
                <input type="text" id="university-id" name="university-id" required>
            </div>
            <!-- Success/Error Message -->
            <%
                String message = (String) request.getAttribute("message");
                if ("success".equals(message)) {
            %>
                <div class="alert success">
                    &#x2714; Student removed successfully!
                </div>
            <%
                } else if ("none".equals(message)) {
            %>
                <div class="alert error">
                    &#x274C; University ID doesn't exist. Please enter a valid ID.
                </div>
            <%
                } else if ("error".equals(message)) {
            %>
                <div class="alert error">
                    &#x274C; An error occurred during the deletion. Please try again.
                </div>
            <%
                }
            %>
            <button type="submit" class="delete-button">Delete Student</button>
        </form>
    </div>
</body>
</html>
