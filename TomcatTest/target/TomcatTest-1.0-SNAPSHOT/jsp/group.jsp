<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="models.Classmate" %>
<%@ page import="static java.lang.System.out" %>
<%@ page import="java.util.Date" %>
<%@ page import="inits.Init" %><%--
  Created by IntelliJ IDEA.
  User: danii
  Date: 22.09.2022
  Time: 12:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Document</title>
    <style type="text/css">
        body {
            font-family: Helvetica;
            margin: 0;
        }
        a {
            text-decoration: none;
            color: #000;
        }
        .site-header {
            border-bottom: 1px solid #ccc;
            padding: .5em 1em;
            display: flex;
            justify-content: space-between;
        }

        .site-identity h1 {
            font-size: 1.5em;
            margin: .6em 0;
            display: inline-block;
        }


        .site-navigation ul,
        .site-navigation li {
            margin: 0;
            padding: 0;
        }

        .site-navigation li {
            display: inline-block;
            margin: 1.4em 1em 1em 1em;
        }
        .aligncenter {
            text-align: center;
        }
    </style>
</head>

<body>

<header class="site-header">
    <div class="site-identity">
        <h1><a href="#">11-103 Group</a></h1>
    </div>
    <nav class="site-navigation">
        <ul class="nav">
            <li><a href="list.jsp">List</a></li>
            <li><a href="#">News</a></li>
        </ul>
    </nav>
</header>
<p class="aligncenter">
<%--    <img src="assets/Screenshot_28.png" alt="изображение в центре параграфа" />--%>
</p>

<%=request.getAttribute("Message") %>
<a href="/catalog/profile">${sad}</a>
</body>
<h2>Сегодня: <%= inits.Init.main().get(0).getComment() %></h2>
<h3>Сегодня: <%= initCLassmates().get(0).getFirstName() %></h3>

</html>
<%!
    public static ArrayList<Classmate> initCLassmates() {
        ArrayList<Classmate> classmates = new ArrayList<Classmate>();
        try {
            String url = "jdbc:postgresql://localhost:5432/webappdb";
            String username = "postgres";
            String password = "18pohage";
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            try (Connection conn = DriverManager.getConnection(url, username, password)) {
                out.println("connected");
                Statement statement = conn.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM teachers");
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
%>