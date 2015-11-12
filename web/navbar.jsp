<%@page import="db.Utente"%>
<header class="navbar navbar-default">
    <div class="container-fluid">
        <nav class="navbar navbar-inverse navbar-default navbar-fixed-top" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-main">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" id="titolo" href="index.jsp">Storie da Veci</a>
            </div>

            <div class="collapse navbar-collapse" id="navbar-main">
                <%
                    HttpSession sess = request.getSession();
                    Utente user = null;
                    user = (Utente)sess.getAttribute("utente");
                    if(user==null){
                %>
                <form class="navbar-form navbar-right" action="user" method="POST" id="login-normal">
                    <div class="form-group">
                        <input type="text" class="form-control" name="email" maxlength="50" placeholder="Email" required>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" name="password" maxlength="50" placeholder="Password" required>
                    </div>
                    <button type="submit" class="btn btn-default">Accedi</button>
                    <div id="pop-up-login" class="pop-up">Email o password errati</div>
                    <div class="registrazione">
                        <a href="registrazione.jsp">Se non hai ancora un account, registrati!</a>
                    </div>
                </form>
                <ul class="nav navbar-nav navbar-right" id="login-collapsed">
                    <li><a href="registrazione.jsp"><span class="glyphicon glyphicon-user"></span> Registrati</a></li>
                    <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Accedi</a></li>
                </ul>
                <%
                    } else {
                %>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="user">Esci</a></li>
                    <!--
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true">Logged in as <%= user.getNome()+" "+user.getCognome()%> <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="user.jsp">Menu utente</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="user">Logout</a></li>
                        </ul>
                    </li>
                    -->
                </ul>
                <%
                    }
                %>
            </div>            
        </nav>                  
    </div>
</header>