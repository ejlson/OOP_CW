<%--
  Created by IntelliJ IDEA.
  User: ethanjameslegson
  Date: 16/03/2023
  Time: 12:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  // create cookie
  Cookie listName = new Cookie("list_name", request.getParameter("list_name"));
  Cookie listElements = new Cookie("list_elements", request.getParameter("list_elements"));
  Cookie submit = new Cookie("submit");

  // set expiry date
  listName.setMaxAge(60*60*24*365);
  listElements.setMaxAge(60*60*24*365);
  submit.setMaxAge(60*60*24*365);

  // add both cookies to response header
  response.addCookie(listName);
  response.addCookie(listElements);
  response.addCookie(submit);
%>

<html>
<head>
</head>
<body>
  <h1>Set List</h1>

  <title>Set List</title>
  <b>List name: </b><%=request.getParameter("list_name")%><br /><br />
  <b>List elements: </b><%=request.getParameter("list_elements")%><br /><br />

</body>
</html>
