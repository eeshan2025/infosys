<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%! 
    // Use same in-memory storage
    static java.util.HashMap<String,String> users = signup.jsp.users;
%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
<%
    String message = "";
    if(request.getMethod().equalsIgnoreCase("POST")) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if(users.containsKey(username) && users.get(username).equals(password)) {
            response.sendRedirect("welcome.jsp?username=" + username);
        } else {
            message = "Invalid username or password!";
        }
    }
%>
<p style="color:red;"><%= message %></p>
<a href="login.html">Back to Login</a>
</body>
</html>
