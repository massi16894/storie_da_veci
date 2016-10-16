<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.html" %>
        <script src="js/registrazione.js"></script>
        <title>Registrazione</title>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-2"></div>
                <div class="col-sm-8">
                    <div class="panel-chiaro panel panel1 panel-default">
                        <div class="panel1 panel-heading">
                            Registration Form
                        </div>
                        <div class="panel1 panel-body">
                            <div class="row">
                                <div class="col-md-12 text-center">
                                    <form method="post" action="registrazione" id="registrazione">
                                        <table>
                                            <tr>
                                                <td>
                                                    <b>Nome:</b>
                                                </td>
                                                <td>
                                                    <input type="text" name="nome" maxlength="50" required>          
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>Cognome:</b>
                                                </td>
                                                <td>
                                                    <input type="text" name="cognome" maxlength="50" required>          
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>Data di nascita:</b>
                                                </td>
                                                <td  class="date">
                                                    <select class="form-control birth" id="day"></select>
                                                    <select class="form-control birth" id="month"></select>
                                                    <select class="form-control birth" id="year"></select>
                                                </td>
                                                <td class="data">
                                                    <input type="hidden" name="date" value="1900-1-1">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>Indirizzo:</b>
                                                </td>
                                                <td>
                                                    <input type="text" name="indirizzo" maxlength="50" required>          
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>Numero di Telefono:</b>
                                                </td>
                                                <td>
                                                    <input type="text" name="num_tel" maxlength="50" required>          
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>E-mail:</b>
                                                </td>
                                                <td>
                                                    <input type="email" name="email" maxlength="50" required>          
                                                </td>
                                            </tr>
                                            <tr class="errore invisibile" id="email">
                                                <td colspan="2">
                                                    <em>Email già utilizzata</em>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>Password:</b>
                                                </td>
                                                <td>
                                                    <input type="password" name="pass1" maxlength="50" required>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>Ripeti password:</b>
                                                </td>
                                                <td>
                                                    <input type="password" name="pass2" maxlength="50" required>
                                                </td>
                                            </tr>
                                            <tr class="errore invisibile" id="pass">
                                                <td colspan="2">
                                                    <em>Password non corrispondono</em>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td>
                                                <label class="control-label">Aggiungi Foto Profilo
                                                    <input id="up-img" name="profile-img" type="file" multiple class="file-loading">
                                                </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <input type="submit" value="Registrati">
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