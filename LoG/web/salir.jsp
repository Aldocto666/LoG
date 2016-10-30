<%@page import="java.sql.*, java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if(request.getParameter("fieldS") == null) {
            Connection c = null;
            Statement s = null;
            ResultSet R = null;
            PreparedStatement ps = null;
            
            try{
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                c= DriverManager.getConnection("jdbc:mysql://localhost/base","root","n0m3l0");
                s = c.createStatement();
            }
            catch(SQLException error) {
                out.print(error.toString());
            }
        try{
                    HttpSession sesion = request.getSession();
        String usuario = (String)sesion.getAttribute("user");
                        String queryString="update Usuario set Sesion='"+0+"' where NombreUsuario ='"+usuario+"';";
                         ps=c.prepareStatement(queryString);
                         ps.executeUpdate();
                         sesion.invalidate();
                         
        response.sendRedirect("index.jsp");
        }
        catch(Exception e)
                        {
                            out.println(e.getLocalizedMessage());
                            e.printStackTrace();
                            out.print("Bye ;)");
                        }    
            }    
        %>
    </body>
</html>
