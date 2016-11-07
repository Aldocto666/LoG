<%-- 
    Document   : principal
    Created on : 30/10/2016
    Author     : ALDO ERNESTO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*, java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Principal</title>
        <style> 
        body {
            font-family: "HelveticaNeue-Light","Helvetica Neue Light","Helvetica Neue",Helvetica,Arial,"Lucida Grande",sans-serif;
            color:white;
            font-size:12px;
            background:#333 url(/images/classy_fabric.png);
            background-image: url("hue.png");
}
        </style>
    </head>
    <body>
        <%
          HttpSession sesion = request.getSession();
         
                      String usuario = (String)sesion.getAttribute("user");
                            Connection c = null;
                            Statement s = null;
                            ResultSet r = null;
                            try {
                                Class.forName("com.mysql.jdbc.Driver").newInstance();
                                c = DriverManager.getConnection("jdbc:mysql://localhost/base","root","n0m3l0");
                                s = c.createStatement();
                            }
                            catch (SQLException error){
                                out.print(error.toString());
                            }
                            try {
                               r = s.executeQuery("select * from Usuario where NombreUsuario ='"+usuario+"';");
                               if (r.next()){
                                   String nom = r.getString("nombre");
                                   out.println("<h1 style='text-align:center;'>Bienvenido "+nom+" :D </h1>");
                                            out.println("<a href='salir.jsp'>Cerrar sesión</a>"); 
                                      
                               }
                            }
                            catch (SQLException error){
                                out.print(error.toString());
                            } 
                    %>
    </body>
</html>
