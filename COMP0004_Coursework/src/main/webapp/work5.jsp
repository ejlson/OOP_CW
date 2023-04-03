<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="ucl.ac.uk.model.Item" %>
<%@ page import="ucl.ac.uk.model.List" %>
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

    <title>List example</title>
</head>

<body>

    <%-- Create a list to store all lists --%>
    <%
        ArrayList<ArrayList<Item>> allLists = (ArrayList<ArrayList<Item>>) application.getAttribute("allLists");
        if (allLists == null) {
            allLists = new ArrayList<>();
            application.setAttribute("allLists", allLists);
        }
    %>

    <%-- Check if a list is selected or create a new one --%>
    <%
        int listIndex = -1;
        String selectedList = request.getParameter("selectedList");
        if (selectedList != null) {
            try {
                listIndex = Integer.parseInt(selectedList);
            } catch (NumberFormatException e) {
                // ignore, listIndex will remain -1
            }
        }
        ArrayList<Item> list = null;
        if (listIndex >= 0 && listIndex < allLists.size()) {
            list = allLists.get(listIndex);
        }
        if (list == null) {
            list = new ArrayList<>();
            allLists.add(list);
            listIndex = allLists.size() - 1;
        }

        String deleteList = request.getParameter("deleteList");
        if (deleteList != null) {
            String listIndexStr = request.getParameter("listIndex");
            if (listIndexStr != null) {
                try {
                    int index = Integer.parseInt(listIndexStr);
                    if (index >= 0 && index < allLists.size()) {
                        allLists.remove(index);
                        if (index == listIndex) {
                            listIndex = -1;
                            list = null;
                        } else if (index < listIndex) {
                            listIndex--;
                        }
                    }
                } catch (NumberFormatException e) {
                    // ignore
                }
            }
        }
    %>

    <%-- Create a new list if requested --%>
    <%
        String newList = request.getParameter("newList");
        if (newList != null && !newList.trim().isEmpty()) {
            list = new ArrayList<>();
            allLists.add(list);
            listIndex = allLists.size() - 1;
        }
    %>

    <%-- Add an item to the selected list --%>
    <%
        String itemText = request.getParameter("itemText");
        String itemUrl = request.getParameter("itemUrl");
        String itemImage = request.getParameter("itemImage");


        if (itemText != null && !itemText.trim().isEmpty()) {
            Item item = new Item(itemText, "", "");
            assert list != null;
            list.add(item);
        } else if (itemUrl != null && !itemUrl.trim().isEmpty()) {
            Item item = new Item("", itemUrl, "");
            assert list != null;
            list.add(item);
        } else if (itemImage != null && !itemImage.trim().isEmpty()) {
            Item item = new Item("", "", itemImage);
            assert list != null;
            list.add(item);
        }

        String listName_a = null; //request.getParameter("listName_a");

        String newListName_a = request.getParameter("listName");
        if (newListName_a != null) {
            listName_a = newListName_a;
      }
    %>

    <%
        String deleteElement = request.getParameter("deleteElement");
        if (deleteElement != null) {
            String elemIndexStr = request.getParameter("elemIndex");
            if (elemIndexStr != null) {
                try {
                    int index_x = Integer.parseInt(elemIndexStr);
                    assert list != null;
                    list.remove(index_x);
                    } catch (NumberFormatException e) {
                    // ignore
                }
            }
        }
    %>

    <%-- Change elements --%>
    <%
        // CHANGE TEXT
        String changeText = request.getParameter("change_itemText");
        String change_elemIndexStr = request.getParameter("edit_text_elem_index");
        try {
            if (changeText != null) {
                if (change_elemIndexStr != null) {
                    Item item = new Item(changeText, "", "");
                    assert list != null;
                    list.set(Integer.parseInt(change_elemIndexStr), item);
                }
            }
        } catch (NumberFormatException e) {
            // ignore
        }
//        if (changeText != null) {
//            String change_elemIndexStr = request.getParameter("edit_text_elem_index");
//            if (change_elemIndexStr != null) {
//                try {
//                    Item item = new Item(changeText, "", "");
//                    list.set(Integer.parseInt(change_elemIndexStr), item);
//                } catch (NumberFormatException e) {
//                    // ignore
//                }
//            }
//        }
//
        // CHANGE URL
        String changeURL = request.getParameter("change_itemUrl");
        if (changeURL != null) {
            String change_elemIndexStr_b = request.getParameter("edit_url_elem_index");
            if (change_elemIndexStr_b != null) {
                try {
                    Item item = new Item("", changeURL, "");
                    assert list != null;
                    list.set(Integer.parseInt(change_elemIndexStr_b), item);
                } catch (NumberFormatException e) {
                    // ignore
                }
            }
        }

        // CHANGE IMAGE
        String changeImage = request.getParameter("change_itemImage");
        if (changeImage != null) {
            String change_elemIndexStr_c = request.getParameter("edit_image_elem_index");
            if (change_elemIndexStr_c != null) {
                try {
                    Item item = new Item("", "", changeImage);
                    assert list != null;
                    list.set(Integer.parseInt(change_elemIndexStr_c), item);
                } catch (NumberFormatException e) {
                    // ignore
                }
            }
        }
    %>

    <%-- Form to add items to the list --%>
    <form method="post">

        <div class="row">

            <div class="column">
                <div class="card" >

                    <h3>Search List: </h3>
                    <label>Select list:</label>
                    <label>
                        <select name="selectedList">
                            <% for (int i = 0; i < allLists.size(); i++) { %>
                            <option value="<%= i %>" <%= i == listIndex ? "selected" : "" %>><%= "List " + (i+1)%></option>
                            <% } %>
                        </select>
                    </label>
                    <input type="submit" value="View List">

                    <h3>Delete Element: </h3>
                    <label>Select element index:</label>
                    <label>
                        <select name="elemIndex">
                            <% for (int i = 0; i < Objects.requireNonNull(list).size(); i++) { %>
                            <option value="<%= i %>" <%= "Element selected: "  %>><%= "Element " + (i+1)%></option>
                            <% } %>
                        </select>
                    </label>
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
                            <% for (int i = 0; i < list.size(); i++) { %>
                            <option value="<%= i %>"><%= "Element " + (i+1) %></option>
                            <% } %>
                        </select>
                    </label>
                    <label>
                        <input placeholder="Text" type="text" name="change_itemText">
                    </label><input type="submit" value="Change Text"><br>
                    <br>
                    <label>
                        <select name="edit_url_elem_index">
                            <% for (int i = 0; i < list.size(); i++) { %>
                            <option value="<%= i %>"><%= "Element " + (i+1) %></option>
                            <% } %>
                        </select>
                    </label>
                    <label>
                        <input placeholder="URL" type="text" name="change_itemUrl">
                    </label><input type="submit" value="Change URL"><br>
                    <br>
                    <label>
                        <select name="edit_image_elem_index">
                            <% for (int i = 0; i < list.size(); i++) { %>
                            <option value="<%= i %>"><%= "Element " + (i+1) %></option>
                            <% } %>
                        </select>
                    </label>
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
                    <label>
                        <select name="listIndex">
                            <% for (int i = 0; i < allLists.size(); i++) { %>
                                <option value="<%= i %>"><%= "List " + (i+1) %></option>
                            <% } %>
                        </select>
                    </label>
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
    <h2><%= "List " + (listIndex+1) + " - " + listName_a + ": "%></h2>
    <ul>
        <% for (Item item : list) { %>
        <li><%= item.toString() %></li>
        <% } %>
    </ul>

</body>

</html>
