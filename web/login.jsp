<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.html" %>
        <title>Log in</title>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <%
            HttpSession ses = request.getSession();
            Utente utente;
            utente = (Utente)ses.getAttribute("utente");
            if(utente!=null){
                response.sendRedirect("index.jsp");
            }
        %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-2"></div>
                <div class="col-sm-8">
                    <div class="panel-chiaro panel panel1 panel-default">
                        <div class="panel1 panel-heading">
                            Log in
                        </div>
                        <div class="panel1 panel-body">
                            <div class="row">
                                <div class="col-md-12 text-center">
                                    <form id="login" action="user" method="POST">
                                        <table>
                                            <tr>
                                                <td>
                                                    <b>E-mail:</b>
                                                </td>
                                                <td>
                                                    <input type="text" name="email" maxlength="50">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>Password:</b>
                                                </td>
                                                <td>
                                                    <input type="password" name="password" maxlength="50">
                                                </td>
                                            </tr>
                                            <tr class="errore invisibile" id="login-error">
                                                <td colspan="2">
                                                    <em>Email o password errati</em>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <input type="submit" value="Accedi">
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