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
            
            String sql2 = "SELECT * FROM carpediem.Utente";
            ResultSet utente = manager.getData(sql2);
        %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-2"></div>
                <div class="col-sm-8">
                    <div class="row content">
                        <div class="panel panel1 panel-default">
                            <div class="row content">
                                <div class="col-sm-8">
                                    <img src="img/youtube.png">
                                </div>
                                <div class="col-sm-4">
                                    <div class="botoni">
                                        <div class="row">
                                            <form action=profilo.jsp method=GET>
                                                <button type="submit" class="btn btn-primary hp" style="margin-bottom: 10px;">Profilo</button>
                                                <input type=hidden name=id value="ciao">
                                            </form>
                                        </div>
                                        <div class="row">
                                            <form action=crea.jsp method=GET>
                                                <button type="submit" class="btn btn-primary hp">Crea Post</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row content">
                        <div class="panel panel1 panel-default con-cat">
                            <div class="row content">
                            <%
                                while(rs.next()) {
                                    String id = rs.getString("id_cat");
                            %>
                            <div class="col-md-4 cat">
                                <form method="get" action="categoria.jsp">
                                <input type="hidden" name="id_cat" value="<%=rs.getString("id_cat")%>">
                                <button type="submit" class="btn <%= rs.getString("colore")%> btn-cat truncate">
                                    <span>
                                        <%= rs.getString("nome")%>
                                    </span>
                                </button>
                                </form>
                            </div>
                            <%
                                }
                            %>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>