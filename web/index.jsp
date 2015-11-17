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
        <%! private DBManager manager; %>
        <%! 
            public void init() throws ServletException {
                // inizializza il DBManager dagli attributi di Application
                this.manager = (DBManager)super.getServletContext().getAttribute("dbmanager");
                //System.out.println("DBManager attivato\n");
            } 
        %>
        <div class="container-fluid">
            <div class="row">
                
                <%
                    int num = (int) request.getAttribute("num");
                    for (int i = 0; i < num; i++) {
                            String cat = (String) request.getAttribute(Integer.toString(i));
                %>
                <span><!-- color="
                <%
                           // out.print(cat);
                %>
                ">-->
                <%
                            out.print(cat);
                %>
                </span><br>
                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>