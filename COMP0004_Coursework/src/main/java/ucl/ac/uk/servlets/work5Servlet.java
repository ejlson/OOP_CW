package ucl.ac.uk.servlets;

import ucl.ac.uk.model.Item;
import ucl.ac.uk.model.List;

import java.io.*;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import static java.lang.System.out;

@WebServlet("/work6.html")
public class work5Servlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // throws IOException, ServletException

        // CREATE LIST TO STORE ALL LISTS
        ArrayList<ArrayList<Item>> allLists = (ArrayList<ArrayList<Item>>) getServletContext().getAttribute("allLists");
        if (allLists == null) {
            allLists = new ArrayList<>();
            getServletContext().setAttribute("allLists", allLists);
        }

        // CHECK IF LIST IS SELECTED OR CREATE A NEW ONE
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

        String newList = request.getParameter("newList");
        if (newList != null && !newList.trim().isEmpty()) {
            list = new ArrayList<>();
            allLists.add(list);
            listIndex = allLists.size() - 1;
            request.setAttribute("newList", newList);
        }

        String itemText = request.getParameter("itemText");
        String itemUrl = request.getParameter("itemUrl");
        String itemImage = request.getParameter("itemImage");

        if (itemText != null && !itemText.trim().isEmpty()) {
            Item item = new Item(itemText, "", "");
            list.add(item);
        } else if (itemUrl != null && !itemUrl.trim().isEmpty()) {
            Item item = new Item("", itemUrl, "");
            list.add(item);
        } else if (itemImage != null && !itemImage.trim().isEmpty()) {
            Item item = new Item("", "", itemImage);
            list.add(item);
        }

        request.setAttribute("list", list);

        RequestDispatcher dispatch = request.getRequestDispatcher("/work6.jsp");
        dispatch.forward(request, response);

    }

}
