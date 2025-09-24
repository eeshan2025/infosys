<%@ include file="users.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>
</head>
<body>
<%
    String message = "";

    // Only process if this is a POST request
    if("POST".equalsIgnoreCase(request.getMethod())) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if(username != null && password != null && !username.isEmpty() && !password.isEmpty()) {
            synchronized(users) { // avoid concurrency issues
                if(users.containsKey(username)) {
                    message = "User already exists!";
                } else {
                    users.put(username, password);
                    response.sendRedirect("login.html"); // redirect to login page
                }
            }
        } else {
            message = "Username and Password cannot be empty!";
        }
    }
%>

<h2>Sign Up</h2>
<form action="signup.jsp" method="post">
    Username: <input type="text" name="username" required /><br/>
    Password: <input type="password" name="password" required /><br/>
    <input type="submit" value="Sign Up" />
</form>

<p style="color:red;"><%= message %></p>
<a href="signup.html">Back to Signup</a>
</body>
</html>
