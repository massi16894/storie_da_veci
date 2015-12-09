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
        <% String id_cat = request.getParameter("id_cat"); %>
        <%! private DBManager manager; %>
        <%!

            public void init() throws ServletException {
                // inizializza il DBManager dagli attributi di Application
                this.manager = (DBManager) super.getServletContext().getAttribute("dbmanager");
                //System.out.println("DBManager attivato\n");
            }
        %>
        <%
            String sql = "SELECT * "
                    + "FROM carpediem.Post P, carpediem.Categoria C, carpediem.Utente U "
                    + "WHERE C.id_cat = ? "
                    + "AND P.categoria = C.id_cat "
                    + "AND U.id_utente = P.utente ";
            String sql2 = "SELECT * "
                    + "FROM carpediem.Categoria C "
                    + "WHERE C.id_cat = ? ";
            ResultSet rs = manager.getData(sql, id_cat);
            ResultSet rs2 = manager.getData(sql2, id_cat);
        %>
        <div class="container-fluid" id="pagina-categoria">
            <div class="row">

                <div class="col-sm-2"></div>
                <div class="col-sm-8">
                    <%
                        int found = 0;
                        if (rs2.next()) {

                    %>
                    <div class="panel panel1 panel-default panel-chiaro">

                        <div class="panel1 panel-heading" style="text-align: center">
                            <h2 class="<%= rs2.getString("colore")%>-titolo"><%= rs2.getString("nome")%></h2>
                        </div>

                        <%
                            }
                            while (rs.next()) {
                                found = 1;
                        %>

                        <div class="row content">   
                            <hr class="linea-categoria">

                            <div class="col-md-4">
                                <form method="get" action="post.jsp">
                                    <input type="hidden" name="id" value="<%=rs.getString("id_post")%>">
                                    <button type="submit" class="btn btn-primary img-responsive hp truncate">
                                        <%= rs.getString("titolo")%>
                                    </button>
                                </form>
                            </div>
                            <div class="col-md-2">
                                <%if (user == null) {%>
                                    <form method="post" action="userPub.jsp">
                                        <input type="hidden" name="id" value="<%=rs.getString("utente")%>">
                                        <input type="submit" class="link-a-utente" value="<%= rs.getString("cognome")%>">
                                    </form>
                                <% } else {%>
                                    <%if (user.getCognome().equals(rs.getString("cognome"))) {%>
                                        <form method="post" action="userPriv.jsp">
                                            <input type="hidden" name="id" value="<%=rs.getString("utente")%>">
                                            <input type="submit" class="link-a-utente" value="<%= rs.getString("cognome")%>">
                                        </form>
                                    <% } else { %>
                                        <form method="post" action="userPub.jsp">
                                            <input type="hidden" name="id" value="<%=rs.getString("utente")%>">
                                            <input type="submit" class="link-a-utente" value="<%= rs.getString("cognome")%>">
                                        </form>
                                    <% } %>
                                <% } %>
                            </div>
                            <!--<div class="col-md-2">
                                <img class="img-piccola" src="img/My_Grandfather_Photo_from_January_17.JPG" alt="<%= rs.getString("cognome")%>" />
                            </div>-->

                            <!--<div class="col-md-3">
                            <% if (rs.getString("media") == null) { %>
                                solo testo
                            <% } else {%>
                                <a href="<%= rs.getString("media")%>" target="blank">Contenuto multimediale</a>
                            <% }%>
                            </div>    -->
                            <%
                                if (rs.getString("media") != null) {
                            %>
                            <div class="col-md-3 truncate"><%= rs.getString("testo")%></div>
                            <div class="col-md-3">
<<<<<<< HEAD
                                <a class="btn btn-primary img-responsive truncate" href="<%= rs.getString("media")%>" target="blank">
                                    Contenuto multimediale
                                </a>
=======
                                <!-- <form method="get" action="post.jsp"> -->
                                <form method="get" action="post.jsp">
                                    <input type="hidden" name="id" value="<%=rs.getString("id_post")%>">
                                    <button type="submit" class="btn btn-primary img-responsive hp truncate">
                                        <%= rs.getString("titolo")%>
                                    </button>
                                </form>
                            </div>
                            <div class="col-md-5"><%= rs.getString("testo")%>

                                <% if (rs.getString("media") != null) {%>
                                <br><br><a href="<%= rs.getString("media")%>" target="blank">Contenuto multimediale</a>
                                <% } %>
>>>>>>> master
                            </div>
                            <%  } else { %>
                            <div class="col-md-6 truncate"><%= rs.getString("testo")%></div>
                            <%  } %>
                        </div>
                        
                        <% } if (found == 0){ %>
                        <div class="row content">
                            <div class="col-sm-12" style="margin-top:20px">Non ci sono ancora storie in questa categoria.</div>
                        </div>
                        <% } %>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>