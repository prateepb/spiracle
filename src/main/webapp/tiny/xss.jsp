<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <body>
    <h1>Reflected XSS!</h1>
      <%
        List<String> attrList = new ArrayList<String>();
        Enumeration<String> attrs = request.getParameterNames();
        for (String str : Collections.list(attrs)) {
          String buf = (String) request.getParameter(str);
          if (buf != null) {
            out.print(str + " -- " + buf);
            out.println("<br>");
          }
        }
      %>
  </body>
</html>
