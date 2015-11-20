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
        <% String id_cat = request.getParameter("id_cat"); %>
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
                + "FROM carpediem.Post P, carpediem.Categoria C, carpediem.Utente U "
                + "WHERE C.id_cat = ? "
                + "AND P.categoria = C.id_cat "
                + "AND U.id_utente = P.utente ";
            ResultSet rs = manager.getData(sql,id_cat);
        %>
        <div class="container-fluid">
            <div class="row">
                
                <%
                    while (rs.next()) {
                %>
                <span>     
                    <form method="get" action="post.jsp">
                        <input type="hidden" name="id" value="<%=rs.getString("id_post")%>">
                        <button type="submit" class="btn btn-primary img-responsive">
                            <%= rs.getString("titolo")%>
                        </button>
                    </form>
                            
                    <%= rs.getString("nome")%><br>
                    <%= rs.getString("cognome")%><br>
                </span>
                <br>
                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>