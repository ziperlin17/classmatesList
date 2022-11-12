package inits;

import models.Classmate;

import java.lang.reflect.InvocationTargetException;
import java.sql.*;
import java.util.ArrayList;

import static java.lang.System.out;

public class Init {
    public static ArrayList<Classmate> main(){
            ArrayList<Classmate> classmates = new ArrayList<Classmate>();
            try {
                String url = "jdbc:postgresql://localhost:5432/webappdb";
                String username = "postgres";
                String password = "18pohage";
                Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
                try (Connection conn = DriverManager.getConnection(url, username, password)) {
                    Statement statement = conn.createStatement();
                    ResultSet resultSet = statement.executeQuery("SELECT * FROM grouplist");
                    while (resultSet.next()) {
                        Long id = resultSet.getLong(1);
                        String fname = resultSet.getString(2);
                        String lname = resultSet.getString(3);
                        String email = resultSet.getString(4);
                        String comment = resultSet.getString(5);
                        Classmate cm = new Classmate(id, fname, lname, email, comment);
                        classmates.add(cm);
                    }
                }
            } catch (Exception ex) {
                out.println(ex);
            }
            return classmates;
        }


    }
