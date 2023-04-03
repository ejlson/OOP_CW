package ucl.ac.uk.servlets;

import ucl.ac.uk.model.Item;
import java.util.Objects;

import java.io.*;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/helloworldservletandjsp.html")
public class HelloWorldServletAndJSP extends HttpServlet
{
  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException
  {
    // Code to use the model to process something would go here.

    // Then forward to JSP.
    ServletContext context = getServletContext();
    RequestDispatcher dispatch = context.getRequestDispatcher("/helloworld.jsp");
    dispatch.forward(request, response);
  }
}