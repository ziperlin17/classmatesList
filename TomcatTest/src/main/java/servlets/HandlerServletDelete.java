package servlets;

import inits.Save;
import models.Classmate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.net.http.HttpClient;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import static java.lang.System.out;

@WebServlet("/HandlerServletDelete")
public class HandlerServletDelete extends HttpServlet {
    protected void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String password = request.getParameter("password");
        String id = request.getParameter("delButton");

        String SQLInsert = "DELETE FROM grouplist WHERE id = " + String.valueOf(id);
        try {
            if (password.equals("12")) {
                inits.Delete.delete(SQLInsert);
            }
            else {
                out.println("wrong pass?");
            }
        } catch (Exception ex) {
            out.println(ex);
        }
        request.setCharacterEncoding("UTF-8");
        response.sendRedirect(request.getContextPath() + "/jsp/list.jsp");


    }

}
