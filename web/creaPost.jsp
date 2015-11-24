<%-- 
    Document   : creaPost
    Created on : 22-nov-2015, 8.11.39
    Author     : Berta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.html" %>
        <script src="js/creaPost.js"></script>
        <title>Registrazione</title>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <%@include file="index.jsp" %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-2"></div>
                <div class="col-sm-8">
                    <div class="panel panel1 panel-default">
                        <div class="panel1 panel-heading">
                            CreatePost Form
                        </div>
                        <div class="panel1 panel-body">
                            <div class="row">
                                <div class="col-md-12 text-center">
                                    <form method="post" action="creaPost" id="creaPost">
                                        <table>
                                            <tr>
                                                <td>
                                                    <b>Categoria:</b>
                                                </td>
                                                <td>
                                                    <input type="text" name="categoria" maxlength="50" required>          
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>Titolo:</b>
                                                </td>
                                                <td>
                                                    <input type="text" name="titolo" maxlength="50" required>          
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>Testo:</b>
                                                </td>
                                                <td>
                                                    <textarea rows="4" cols="50"name="testo"required></textarea>          
                                                </td>
                                            </tr>
                                            
                                            <!--<tr  class="date">
                                                <td>
                                                    <b>Data di nascita:</b>
                                                </td>
                                                <td>
                                                    <select class="form-control birth" id="day"></select>
                                                </td>
                                                <td>
                                                    <select class="form-control birth" id="month"></select>
                                                </td>
                                                <td>
                                                    <select class="form-control birth" id="year"></select>
                                                </td>
                                                <td class="data"></td>-->
                                            </tr>
                                                <td colspan="2">
                                                    <input type="submit" value="Crea Post">
                                                </td>
                                            </tr>
                                        </table>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>