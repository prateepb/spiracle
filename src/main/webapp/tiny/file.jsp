<%@page import="java.io.IOException"%>
<%@page import="java.util.Scanner"%>
<%@page import="java.io.File"%>
<!DOCTYPE html>
<html>
    <%
      String pathName = (String) request.getParameter("path");
      String output = "";
          if (pathName != null) {
              File file = new File(pathName);
              StringBuilder fileContents = new StringBuilder((int) file.length());
              Scanner scanner = new Scanner(file);
              String lineSeparator = System.getProperty("line.separator");

              try {
                  while (scanner.hasNextLine()) {
                      fileContents.append(scanner.nextLine() + lineSeparator);
                  }
                  output = fileContents.toString();
              } finally {
                  scanner.close();
              }
              pageContext.setAttribute("output", output);
          }
    %>

    <%
      String outputPasswd = "";
      File file = new File("/etc/passwd");
      StringBuilder fileContents = new StringBuilder((int) file.length());
      Scanner scanner = new Scanner(file);
      String lineSeparator = System.getProperty("line.separator");
      try {
          while (scanner.hasNextLine()) {
              fileContents.append(scanner.nextLine() + lineSeparator);
          }
          outputPasswd = fileContents.toString();
      } finally {
          scanner.close();
      }
      pageContext.setAttribute("outputPasswd", outputPasswd);
    %>
    
    <body>
        <h1>Reading path from querystring</h1>
        <pre>${output}</pre>

        <h1>Reading directly from /etc/passwd</h1>
        <pre>${outputPasswd}</pre>
    </body>
</html>
