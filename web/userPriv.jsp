<%-- 
    Document   : userPriv
    Created on : 25-nov-2015, 16.02.58
    Author     : Massimiliano
--%>

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
        <title>userPriv</title>
    </head>
    <body>
        <%
            HttpSession ses = request.getSession();
            Utente utente;
            utente = (Utente)ses.getAttribute("utente");
            String id_utente = "0";
            if(utente==null){
                response.sendRedirect("index.jsp");
            }else{
                id_utente = utente.getId();
            }
        %>
        <%! private DBManager manager; %>
        <%! 
            public void init() throws ServletException {
            // inizializza il DBManager dagli attributi di Application
                this.manager = (DBManager)super.getServletContext().getAttribute("dbmanager");
                //System.out.println("DBManager attivato\n");
            } 
        %>
        <%@include file="navbar.jsp" %>
        <%--Dati utente--%>
        <%
            String sql1 = "SELECT * FROM carpediem.Utente WHERE id_utente = ?";
            ResultSet info = manager.getData(sql1, id_utente);
            info.next();
        %>
        <%--Post utente--%>
        <%
            String sql2 = " SELECT * "
                        +" FROM carpediem.Utente AS U"
                        +" INNER JOIN carpediem.Post AS P"
                        +" ON U.id_utente = P.utente"
                        +" WHERE U.id_utente = ?";
            
            ResultSet post = manager.getData(sql2, id_utente);
            
        %>
        <%--Post utente--%>
        <%
            String sql3 = " SELECT * "
                        +" FROM carpediem.Categoria AS C"
                        +" INNER JOIN carpediem.Post AS P"
                        +"  INNER JOIN carpediem.Utente AS U"
                        +"  ON U.id_utente = P.utente"
                        +" ON C.id_cat = P.categoria"
                        +" WHERE U.id_utente = ?";
            
            ResultSet cate = manager.getData(sql3, id_utente);   
        %>
        
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-sm-3 col-xs-12">
                    <div class="panel panel1 panel-default panel-chiaro">                               
                        <div class="panel1 panel-heading" style="text-align: center">
                            <strong>Foto</strong>
                        </div>
                        <div class="panel1 panel-body">
                            <div class="col-sm-8" style="margin: auto">
                                <img src="<%= info.getString("path_foto")%>">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 col-xs-12">
                    <div class="panel panel1 panel-default panel-chiaro">                               
                        <div class="panel1 panel-heading" style="text-align: center">
                            <strong>Info generali</strong>
                        </div>
                        <div class="panel1 panel-body">
                            <!--Info-->
                            <%
                                out.println("<b>Nome:</b> "+info.getString("nome")+"<br><b>Cognome:</b> "+info.getString("cognome")+"<br><b>Indirizzo:</b> "+info.getString("indirizzo")+"<br><b>Email:</b> "+info.getString("email")+"<br><br>");
                            %>
                        </div>
                    </div>
                </div>     
            </div>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-sm-6 col-xs-12">
                    <div class="panel panel1 panel-default panel-chiaro">                               
                        <div class="panel1 panel-heading" style="text-align: center">
                            <strong>Post pubblicati</strong>
                        </div>
                        <div class="panel1 panel-body">
                            <!--Post-->
                            <table style="margin-left: auto; margin-right: auto" class="table">
                                <tr>
                                    <td>
                                        <b>Nome</b>
                                    </td>
                                    <td>
                                        <b>Categoria</b>
                                    </td>
                                    <td colspan="3">
                                        <b>Descrizione</b>
                                    </td>

                                </tr>
                                <% while(post.next() && cate.next()){%>
                                <tr>
                                    <td>
                                        <%=post.getString("titolo")%>
                                    </td> 
                                    <td>
                                        <%=cate.getString("nome")%>
                                    </td>
                                    <td>
                                        <%=post.getString("testo")%>
                                    </td>
                                    <td>
                                        <form method="GET" action="">
                                            <button type="submit" class="btn btn-default" aria-label="Left Align">
                                                <input type="hidden" name="id_post" value="<%=post.getString("id_post")%>">
                                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                            </button>
                                        </form>
                                    </td>
                                    <td>
                                        <form method="GET" action="delete">
                                            <button type="submit" class="btn btn-default" aria-label="Left Align">
                                                <input type="hidden" name="id_post" value="<%=post.getString("id_post")%>">
                                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                                <%}%>
                            </table>    
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
