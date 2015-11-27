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
                <a class="navbar-brand" href="index.jsp">
                    <img src="img/logo.png">
                    <b class="titolo">Storie da Veci</b>
                </a>
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
                    <li><a href="user.jsp" class="logout">Bentornato <%= user.getNome()+" "+user.getCognome()%></a></li>
                    <li><a href="user" class="logout">Esci</a></li>
                </ul>
                <%
                    }
                %>
            </div>            
        </nav>                  
    </div>
</header>