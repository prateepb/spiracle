<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <body>
    <h1>Open Redirect!</h1>
    <%
      String url = (String) request.getParameter("url");
      if (url != null) {
        response.sendRedirect(url);
      }
    %>
  </body>
</html>
