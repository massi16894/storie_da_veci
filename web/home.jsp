<%@page import="java.io.PrintWriter"%>
<%@page import="db.Categoria"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.DBManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.html" %>
        <title>Storie da Veci</title>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <%! private DBManager manager; %>
        <%! 
            public void init() throws ServletException {
                // inizializza il DBManager dagli attributi di Application
                this.manager = (DBManager)super.getServletContext().getAttribute("dbmanager");
                //System.out.println("DBManager attivato\n");
            } 
        %>
        <div class="container-fluid">
            <div class="row">
                
                <%
                    ResultSet rs = (ResultSet) request.getAttribute("todo");
                    while (rs.next()) {
                        //user.setId(rs.getString("id_utente"));
                        //Categoria categoria = (Categoria) rs;
                %>
                <a href="<%
                        out.print(rs.getString("url"));
                %>">
                <span class="<%
                        out.print(rs.getString("colore"));
                %>">
                <%
                        out.print(rs.getString("nome"));
                %></span></a>
                <br>
                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>