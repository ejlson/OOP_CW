<%@ page import="ucl.ac.uk.model.Item" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.Objects" %>

<html>

<head>

    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }
        .column {
            float: left;
            width: 23.6%;
            padding: 0 10px;
        }
        .row {margin: 0 -5px;}
        .row:after {
            content: "";
            display: table;
            clear: both;
        }
        .card {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            padding: 5px;
            text-align: left;
            background-color: #f1f1f1;
            height: 220px;
        }
        @media screen and (max-width: 600px) {
            .column {
                width: 100%;
                display: block;
                margin-bottom: 20px;
            }
        }
    </style>

    <title>List example v2</title>
</head>

<body>

<% ArrayList<Item> list = (ArrayList<Item>) request.getSession().getAttribute("list"); %>

<%

%>

<%-- Form to add items to the list --%>
<form action="work5Servlet" method="post">

    <div class="row">

        <div class="column">
            <div class="card" >

                <h3>Search List: </h3>
                <label>Select list:</label>
<%--                <label>--%>
<%--                    <select name="selectedList">--%>
<%--                        <% for (int i = 0; i < list.size(); i++) { %>--%>
<%--                        <option value="<%= i %>" <%= i == listIndex ? "selected" : "" %>><%= "List " + (i+1)%></option>--%>
<%--                        <% } %>--%>
<%--                    </select>--%>
<%--                </label>--%>
<%--                <input type="submit" value="View List">--%>

<%--                <h3>Delete Element: </h3>--%>
<%--                <label>Select element index:</label>--%>
<%--                <label>--%>
<%--                    <select name="elemIndex">--%>
<%--                        <% for (int i = 0; i < allLists.size(); i++) { %>--%>
<%--                        <option value="<%= i %>" <%= "Element selected: "  %>><%= "Element " + (i+1)%></option>--%>
<%--                        <% } %>--%>
<%--                    </select>--%>
<%--                </label>--%>
                <input type="submit" name="deleteElement" value="Delete element">

            </div>
        </div>

        <%-- ADD ELEMENTS TO CURRENT LIST--%>
        <div class="column">
            <div class="card">
                <h3>Add Elements To The List: </h3>
                <label>
                    <input placeholder="Text" type="text" name="itemText">
                </label><input type="submit" value="Add Text"><br>
                <br>
                <label>
                    <input placeholder="URL" type="text" name="itemUrl">
                </label><input type="submit" value="Add URL"><br>
                <br>
                <label>
                    <input placeholder="Image URL" type="text" name="itemImage">
                </label><input type="submit" value="Add Image"><br>
            </div>
        </div>

        <%-- EDIT ELEMENTS TO CURRENT LIST--%>
        <div class="column">
            <div class="card">
                <h3>Edit Elements In The List: </h3>
                <label>
                    <select name="edit_text_elem_index">
<%--                        <% for (int i = 0; i < allLists.size(); i++) { %>--%>
<%--                        <option value="<%= i %>"><%= "Element " + (i+1) %></option>--%>
<%--                        <% } %>--%>
<%--                    </select>--%>
<%--                </label>--%>
<%--                <label>--%>
<%--                    <input placeholder="Text" type="text" name="change_itemText">--%>
<%--                </label><input type="submit" value="Change Text"><br>--%>
<%--                <br>--%>
<%--                <label>--%>
<%--                    <select name="edit_url_elem_index">--%>
<%--                        <% for (int i = 0; i < allLists.size(); i++) { %>--%>
<%--                        <option value="<%= i %>"><%= "Element " + (i+1) %></option>--%>
<%--                        <% } %>--%>
<%--                    </select>--%>
<%--                </label>--%>
<%--                <label>--%>
<%--                    <input placeholder="URL" type="text" name="change_itemUrl">--%>
<%--                </label><input type="submit" value="Change URL"><br>--%>
<%--                <br>--%>
<%--                <label>--%>
<%--                    <select name="edit_image_elem_index">--%>
<%--                        <% for (int i = 0; i < allLists.size(); i++) { %>--%>
<%--                        <option value="<%= i %>"><%= "Element " + (i+1) %></option>--%>
<%--                        <% } %>--%>
<%--                    </select>--%>
<%--                </label>--%>
                <label>
                    <input placeholder="Image URL" type="text" name="change_itemImage">
                </label><input type="submit" value="Change Image"><br>
            </div>
        </div>

        <%-- EDIT CURRENT LIST--%>
        <div class="column">
            <div class="card">
                <h3>List Options</h3>

                <%-- ADD NEW LIST--%>
                <input name="newList" type="submit" value="Create New List"><br><br>

                <%-- DELETE CURRENT LIST--%>
<%--                <label>--%>
<%--                    <select name="listIndex">--%>
<%--                        <% for (int i = 0; i < allLists.size(); i++) { %>--%>
<%--                        <option value="<%= i %>"><%= "List " + (i+1) %></option>--%>
<%--                        <% } %>--%>
<%--                    </select>--%>
<%--                </label>--%>
                <input type="submit" name="deleteList" value="*Delete Selected List"><br><br>

                <%-- RENAME CURRENT LIST--%>
                <label>
                    <input type="text" name="listName" placeholder="Enter new name...">
                </label>
                <button type="submit">**Rename</button>
                <h6>*When deleting a list, the list on screen must not be the list you want to delete.
                    **Name of list is the first element of the list</h6>

            </div>
        </div>

    </div>

</form>

<hr>

    <%-- DISPLAY SELECTED LIST --%>

    <ul>
        <% for (Item item : list) {  %>
        <li><%= item.toString() %></li>
        <% } %>
    </ul>

</body>

</html>
