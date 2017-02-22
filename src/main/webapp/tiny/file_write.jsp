<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>File Write</title>
    </head>
    <%
        String filePath = (String) request.getParameter("filePath");
        String fileContent = (String) request.getParameter("fileContent");

        if (filePath != null && fileContent != null) {
            File outputFile = new File(filePath);
            FileWriter fileWriter = new FileWriter(outputFile);
            BufferedWriter writer = new BufferedWriter(fileWriter);

            writer.write(fileContent);
            writer.close();
            fileWriter.close();

            pageContext.setAttribute("filePath", outputFile.getAbsolutePath());
            pageContext.setAttribute("fileContent", fileContent);
        }
    %>
    <body>
        <h1>File Write!</h1>
        File Path = ${filePath}
        <br/>
        File Content = ${fileContent}
    </body>
</html>
