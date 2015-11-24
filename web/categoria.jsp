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
        <div class="container-fluid" id="pagina-categoria">
            <div class="row">
                
                
                <div class="col-sm-2"></div>
                    <div class="col-sm-8">
                <%
                    int j = 0;
                    while (rs.next()) {
                        if(j==0){
                %>
                        <h2><%= rs.getString("nome")%></h2>
                        <hr>
                <%
                        }
                        j++;
                %>
                            <div class="panel panel1 panel-default panel-chiaro">
                                
                                <div class="row content">   
                                
                                    <div class="col-md-3"><%= rs.getString("cognome")%></div>
                                    <div class="col-md-3">
                                        <a href="<%= rs.getString("media")%>" target="blank">
                                            <%= rs.getString("media")%>
                                        </a>                                        
                                    </div>
                                    <div class="col-md-3">
                                                <form method="get" action="post.jsp">
                                                    <input type="hidden" name="id" value="<%=rs.getString("id_post")%>">
                                                    <button type="submit" class="btn btn-primary img-responsive hp">
                <%= rs.getString("titolo")%>
                                                    </button>
                                                </form>
                                    </div>
                                    <div class="col-md-3"><%= rs.getString("testo")%></div>
                                </div>
                            </div>
                            <%
                    }

                %>
                    </div></div></div></div>
            </div>
        </div>
    </body>
</html>