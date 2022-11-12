<%--
  Created by IntelliJ IDEA.
  User: danii
  Date: 28.09.2022
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="static java.lang.System.out" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.Classmate" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>Title</title>

    <style>
        *{
            box-sizing: border-box;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
        }
        body{
            font-family: Helvetica;
            -webkit-font-smoothing: antialiased;
        }
        h2{
            text-align: center;
            font-size: 18px;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: white;
            padding: 30px 0;
        }

        /* Table Styles */

        .table-wrapper{
            margin: 10px 70px 70px;
            box-shadow: 0px 35px 50px rgba( 0, 0, 0, 0.2 );
        }

        .fl-table {
            border-radius: 5px;
            font-size: 12px;
            font-weight: normal;
            border: none;
            border-collapse: collapse;
            width: 100%;
            max-width: 100%;
            white-space: nowrap;
            background-color: white;
        }

        .fl-table td, .fl-table th {
            text-align: center;
            padding: 8px;
        }

        .fl-table td {
            border-right: 1px solid #f8f8f8;
            font-size: 12px;
        }

        .fl-table thead th {
            color: #ffffff;
            background: #4FC3A1;
        }


        /*.fl-table thead th:nth-child(odd) {*/
        /*    color: #ffffff;*/
        /*    background: #324960;*/
        /*}*/

        .fl-table tr:nth-child(even) {
            background: #F8F8F8;
        }

        /* Responsive */

        @media (max-width: 767px) {
            .fl-table {
                display: block;
                width: 100%;
            }
            .table-wrapper:before{
                content: "Scroll horizontally >";
                display: block;
                text-align: right;
                font-size: 11px;
                color: white;
                padding: 0 0 10px;
            }
            .fl-table thead, .fl-table tbody, .fl-table thead th {
                display: block;
            }
            .fl-table thead th:last-child{
                border-bottom: none;
            }
            .fl-table thead {
                float: left;
            }
            .fl-table tbody {
                width: auto;
                position: relative;
                overflow-x: auto;
            }
            .fl-table td, .fl-table th {
                padding: 20px .625em .625em .625em;
                height: 60px;
                vertical-align: middle;
                box-sizing: border-box;
                overflow-x: hidden;
                overflow-y: auto;
                width: 120px;
                font-size: 13px;
                text-overflow: ellipsis;
            }
            .fl-table thead th {
                text-align: left;
                border-bottom: 1px solid #f7f7f9;
            }
            .fl-table tbody tr {
                display: table-cell;
            }
            .fl-table tbody tr:nth-child(odd) {
                background: none;
            }
            .fl-table tr:nth-child(even) {
                background: transparent;
            }
            .fl-table tr td:nth-child(odd) {
                background: #F8F8F8;
                border-right: 1px solid #E6E4E4;
            }
            .fl-table tr td:nth-child(even) {
                border-right: 1px solid #E6E4E4;
            }
            .fl-table tbody td {
                display: block;
                text-align: center;
            }
        }
    </style>

    <link rel="stylesheet" href="../style/style.css" type="text/css" />

    <style>
        body {
            background: #f1f1f1;
            font-family: Helvetica;
            font-size: 100%;
        }
        form {
        margin: 200px   ;
    }

    input, button {
        padding: 15px 20px;
        border-radius: 1px;
        border: 2px solid #bdbdbd;
    }

    button {
        border-color: #4FC3A1;
        background: #4FC3A1;
        color: #f6f7f8;
        text-transform: uppercase;
        letter-spacing: 2px;
    }</style>
    <style>.test2 {
        border: solid 1px blue;
        padding: 10px;
        width: 100%;
        border-left: none;
        border-top: none;
    }
    </style>
</head>
<body>

<header class="site-header">
    <div class="site-identity">
        <h1><a href="jsp/group.jsp">11-103 Group</a></h1>
    </div>
    <nav class="site-navigation">
        <ul class="nav">
            <li><a href="list.jsp">List</a></li>
            <li><a href="#">News</a></li>
        </ul>
    </nav>
</header>
<div class="table-wrapper">
    <table class="fl-table">
        <thead>
        <tr>
            <th>Фамилия</th>
            <th>Имя</th>
            <th>Связь</th>
            <th>Комментарий</th>
            <th>
                <input form="deleteForm" type="password" name="password" placeholder="Delete password" required></th>
        </tr>
        </thead>
        <tbody>
            <% ArrayList<Classmate> list = inits.Init.main();
            session.setAttribute("users",list);
            %>


        <c:forEach items="${users}" var="cm">
        <tr>
            <form action="/HandlerServletDelete" method="post" id="deleteForm"></form>
            <td> ${cm.firstName} </td>
            <td> ${cm.lastName} </td>
            <td> ${cm.email} </td>
            <td> ${cm.comment} </td>
            <td>

<%--                <input type='submit' form="my_form" name=${cm.id.toString()}+"delete" required>--%>
                <button formaction="/HandlerServletDelete" value=${cm.id} name="delButton" type="submit" form="deleteForm">удалить</button>

            </td>
        </tr>
        </c:forEach>
        <tbody>
    </table>
</div>
<form action="/HandlerServlet" method="post">
    <input type="" name="firstName" placeholder="НОВЕНЬКИЙ?" required>
    <input type="" name="lastName" placeholder="ИЛИ" required>
    <input type="" name="email" placeholder="УЖЕ" required>
    <input type="" name="comment" placeholder="СМЕШАРИК?" required>
    <input type="password" name="password" placeholder="password" required>
    <button> добавить</button>
</form>

</body>
</html>
