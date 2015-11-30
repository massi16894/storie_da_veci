<%-- 
    Document   : presentazionePost
    Created on : 30-nov-2015, 13.53.02
    Author     : Berta
--%>

<%@page import="java.io.PrintWriter"%>
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
                + "WHERE P.id_post = ? ";
            ResultSet rs = manager.getData(sql,id_post);
        %>
        <div class="container-fluid" id="pagina-categoria">
            <div class="row">
                
                
                <div class="col-sm-2"></div>
                    <div class="col-sm-8">
                <%
                    int j = 0;
                    while (rs.next()) {
                        if(j==0){
                %>
                        <h2><%= rs.getString("titolo")%></h2>
                        <hr>
                <%
                        }
                        j++;
                %>
                            <div class="panel panel1 panel-default panel-chiaro">
                                
                                <div class="row content">   
                                
                                    <div class="col-md-12"><%= rs.getString("testo")%></div>
                                    
                                     
                                    
                                </div>
                            </div>
                            <%
                    }

                %>
                    </div>
            </div>
        </div>
    </body>
</html>