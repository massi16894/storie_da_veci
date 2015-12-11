<%-- Document   : Post
    Created on : 30-nov-2015, 13.53.02
    Author     : Berta
--%>

<%@page import="db.DBManager"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="db.Utente"%>
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
        <% String id_post = request.getParameter("id"); %>
        
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
                + "FROM carpediem.Post P "
                + "WHERE P.id_post = ?";
            ResultSet rs = manager.getData(sql,id_post);
            
            String sql2 = " SELECT * "
                        +" FROM carpediem.Utente AS U"
                        +" INNER JOIN carpediem.Post AS P"
                        +" ON U.id_utente = P.utente"
                        +" WHERE P.id_post = ?";
            ResultSet info = manager.getData(sql2, id_post);
            
        %>
        <div class="container-fluid" id="pagina-categoria">
            <div class="row">
                <%  int j = 0;
                    while (rs.next() && info.next()) {
                        if(j==0){ %>
                <div class="col-sm-2"></div>
                <div class="col-sm-3 col-xs-12">
                    <div class="panel panel1 panel-default panel-chiaro" style="height: 230px">                               
                        <div class="panel1 panel-body">
                            <div class="col-sm-7" style="margin: auto">
                                <img class ="img-media" src="<%= info.getString("path_foto")%>"/>
                                <div class="col-sm-4 panel1 panel-heading" style="text-align: center">
                                    <form method="post" action="userPub.jsp">
                                    <input type="hidden" name="id" value="<%=rs.getString("utente")%>">                                          
                                    <input type="submit" class="link-a-utente" value="<%= info.getString("nome") +" "+ info.getString("cognome")%>">
                                    </form>
                                </div> 
                                    <% } %>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <div class="col-sm-5">
                    <div class="panel panel1 panel-default panel-chiaro">                               
                        <br><br>
                        <div class="panel1 panel-heading title" style="text-align: center;">
                            <strong><%= rs.getString("titolo")%></strong>
                            <% 
                                j++;
                            %>
                        </div>
                        <br><br><br>
                    </div>
                </div>     
            </div>
            <br>
            <div class="row content">
                <div class="col-sm-2"></div>
                <div class="col-sm-8 panel panel1 panel-default panel-chiaro"><%= rs.getString("testo")%></div>
                <div class="col-sm-2"></div>                    
            </div>
            <% if (rs.getString("media") != null) {%>
            <div class="row content">
                <div class="col-sm-2"></div>    
                <div class="col-sm-8 panel panel1 panel-default panel-chiaro">
                    
                        <!--<a href="<1%= rs.getString("media")%>" target="blank" class="link-a-utente">Vai al contenuto multimediale per questo post.</a>-->
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="<%= rs.getString("media") %>"></iframe>
                        </div>
                    
                </div>    
                <div class="col-sm-2"></div>
            </div>
            <% } else  {} %>
            <div class="row content">
                <div class="col-sm-2"></div>
                <div class="col-sm-8 panel panel1 panel-default panel-chiaro">
                    <form method="post" action="userPub.jsp">
                        <input type="hidden" name="id" value="<%=rs.getString("utente")%>">
                        <input type="submit" class="link-a-utente" value="<%= "Vedi tutto dell'utente " + info.getString("nome") +" "+ info.getString("cognome")%>"> 
                    </form>
                    </div>        
                    <div class="col-sm-2"></div>    
                </div>
            <div class="row"></div>
            <% } %>
        </div>
    </body>
</html>
