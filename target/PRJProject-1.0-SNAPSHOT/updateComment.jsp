<%@page import="Models.Account"%>
<%@page import="java.util.List"%>
<%@page import="Models.Product"%>
<%@page import="Models.Comment"%>
<%@page import="DAOs.commentDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Comment</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
                margin: 0;
                padding: 0;
                text-align: center;
            }

            h1 {
                background-color: #333;
                color: #fff;
                padding: 10px 0;
            }

            form {
                background-color: #fff;
                max-width: 500px;
                margin: 0 auto;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            label {
                display: block;
                font-weight: bold;
                margin-top: 10px;
            }

            textarea, input[type="text"] {
                width: 100%;
                padding: 10px;
                margin-top: 5px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            input[type="text"] {
                background-color: #f5f5f5;
                font-weight: normal;
            }

            input[type="submit"] {
                background-color: #333;
                color: #fff;
                border: none;
                padding: 10px 20px;
                margin-top: 20px;
                cursor: pointer;
                border-radius: 4px;
            }
        </style>


    </head>
    <body>
        <h1>Edit Comment</h1>

        <% 
            if (session.getAttribute("quantri") == null) {
                Cookie[] cookies = request.getCookies();
                boolean foundCookie = false;
                if (cookies != null) {
                    for (Cookie c : cookies) {
                        if (c.getName().equals("quantri")) {
                            foundCookie = true;
                            break;
                        }
                    }
                }
                if (!foundCookie && session.getAttribute("quantri") == null) {
                    response.sendRedirect("/PRJProject/home");
                }
            }

            if (session.getAttribute("quantri") != null) {
                Account ad = (Account) session.getAttribute("quantri");
                if (ad.getIsSell() != 1 && ad.getIsAdmin() != 1) {
                    response.sendRedirect("/PRJProject/home");
                }
            }

            Comment cm = (Comment) request.getAttribute("cm");
        %>



        <form action="<%=request.getContextPath()%>/manager" method="post">
            <input type="hidden" name="updateId" value="<%= cm.getComment_id()%>">
            <!-- Hidden field for the comment ID -->

            <label for="commentText">Comment:</label>
            <textarea id="commentText" name="commentText" rows="4" cols="50"><%= cm.getComment_text()%></textarea>
            <!-- Textarea for updating the comment text -->

            <label for="commentDate">Date:</label>
            <input type="text" id="commentDate" name="commentDate" value="<%= cm.getComment_date()%>" readonly>
            <!-- Date field (readonly) for the comment date -->

            <label for="username">Username:</label>
            <input type="text" id="username" name="username" value="<%= cm.getUsername()%>" readonly>
            <!-- Username field (readonly) -->

            <input type="submit" name="btnSubmit" value="EditCommentByAD">
        </form>


        <!-- Include any additional HTML, CSS, or JavaScript as needed -->
    </body>
    <script type="text/javascript">
        // Check if a success message exists in the URL query parameters
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has("success")) {
            // Display a success message (you can customize this)
            alert("Update successful!");

            // Reload the page to clear the URL parameter and show the updated content
            location.reload();
        }
    </script>
</html>