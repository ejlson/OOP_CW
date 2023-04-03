<%--
  Created by IntelliJ IDEA.
  User: ethanjameslegson
  Date: 25/03/2023
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="ucl.ac.uk.model.Item" %>
<%@ page import="java.util.*"%>


<html>
<head>

    <title>List Example</title>

</head>
<body>

    <%-- Create new list --%>
    <%
        ArrayList<Item> list = new ArrayList<Item>();
    %>
    <%-- Create list name --%>
    <%
        String listName = request.getParameter("listName");
        if (listName == null || listName.trim().isEmpty())
        {
            listName = "My List";
        }
    %>
    <%-- Add items to the list --%>
    <%
        String itemText = request.getParameter("itemText");
        String itemUrl = request.getParameter("itemUrl");
        String itemImage = request.getParameter("itemImage");
        if (itemText != null && !itemText.trim().isEmpty()) {
            Item item = new Item(itemText, itemUrl, itemImage);
            list.add(item);
        }
    %>

    <%-- Form to add items to the list --%>
    <form method="post">
        <label>List Name:</label>
        <input type="text" name="listName" value="<%= listName %>">
        <label>Item Text:</label>
        <input type="text" name="itemText"><br>
        <label>Item URL:</label>
        <input type="text" name="itemUrl"><br>
        <label>Item Image:</label>
        <input type="text" name="itemImage"><br>
        <input type="submit" value="Add Item">
    </form>

    <%-- Display the list --%>
    <h2><%= listName %></h2>
    <ul>
        <% for (Item item : list) { %>
        <li><%= item.toString() %><br></br></li>
        <% } %>
    </ul>

    <%
        class Item {
            private String text;
            private String url;
            private String image;

            public Item (String text, String url, String image) {
                this.text = text;
                this.url = url;
                this.image = image;
            }

            public String getText() {
                return text;
            }

            public String getUrl() {
                return url;
            }

            public String getImage() {
                return image;
            }

            public String toString() {
                StringBuilder sb = new StringBuilder();
                sb.append(text);
                if (url != null && !url.trim().isEmpty()) {
                    sb.append(" (").append(url).append(")");
                }
                if (image != null && !image.trim().isEmpty()) {
                    sb.append(" <img src=\"").append(image).append("\">");
                }
                return sb.toString();
            }
        }
    %>
</body>
</html>
