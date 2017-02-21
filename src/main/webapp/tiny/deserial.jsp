<%@ page import="java.io.*,java.util.*" %>
<html>
<body>

<%
    out.println("Performing the deserialization of the HTTP request input stream.<br/>");

    // get the request's input stream
    ServletInputStream untrusted = request.getInputStream();

    // pass it to a new ObjectInputStream instance
    ObjectInputStream ois = new ObjectInputStream( untrusted );

    // deserialize it
    Object deserialized = ois.readObject();

    out.println("Completed the deserialization of the HTTP request input stream.<br/>");
%>

</body>
</html>
