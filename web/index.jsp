<%@page import="java.io.PrintWriter"%>
<%@page import="db.Categoria"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.DBManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
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
        <%
            String sql = "SELECT * FROM carpediem.Categoria";
            ResultSet rs = manager.getData(sql);
        %>
        <div class="container-fluid">
            <div class="row">
                <%
                    while(rs.next()) {
                        String id = rs.getString("id_cat");
                %>
                <form method="get" action="categoria.jsp">
                    <input type="hidden" name="id_cat" value="<%=rs.getString("id_cat")%>">
                    <button type="submit" class="btn btn-primary img-responsive">
                        <span class="<%= rs.getString("colore")%>">
                            <%= rs.getString("nome")%>
                        </span>
                    </button>
                </form>
                <br>
                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>