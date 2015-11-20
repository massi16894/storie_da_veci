<%@page import="java.sql.ResultSetMetaData"%>
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
        <%
            String sql = "SELECT * "
                + "FROM carpediem.Post, carpediem.Categoria "
                + "WHERE carpediem.Categoria.url = 'ricette-della-nonna' "
                + "AND carpediem.Post.categoria = carpediem.Categoria.id_cat";
            ResultSet rs = manager.getData(sql);
        %>
        <div class="container-fluid">
            <div class="row">
                
                <%
                    while (rs.next()) {
                %>
                <span>
                    <%= rs.getString("id_post")%>
                    <%= rs.getString("categoria")%>
                    <%= rs.getString("utente")%>
                    <%= rs.getString("testo")%>
                    <%= rs.getString("media")%>
                    <%
                        //out.print(rs.getString("colore"));
                    /*    ResultSetMetaData rsmd = rs.getMetaData();
                        out.print(rs.getString("titolo"));
                        out.print(rsmd.getColumnName(1));
                        out.print(rsmd.getColumnName(2));
                        out.print(rsmd.getColumnName(3));                       
                        out.print(rsmd.getColumnName(4));  */

                %></span>
                <br>
                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>