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

@WebServlet("/HandlerServlet")
public class HandlerServlet extends HttpServlet {
    protected void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String formFirstName = request.getParameter("firstName");
        String formLastName = request.getParameter("lastName");
        String formEmail = request.getParameter("email");
        String formComment = request.getParameter("comment");
        String formPass = request.getParameter("password");


        String SQLInsert = "INSERT INTO grouplist (first_name, last_name, email, comment) " + " VALUES(?,?,?,?)";
        try {
            if (formPass.equals("12")) {
                inits.Save.save(SQLInsert,formFirstName,formLastName,formEmail,formComment);

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
