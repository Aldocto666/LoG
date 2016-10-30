<%-- 
    Document   : index
    Created on : 30/10/2016
    Author     : ALDO ERNESTO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            * { box-sizing: border-box; padding:0; margin: 0; }

body {
	font-family: "HelveticaNeue-Light","Helvetica Neue Light","Helvetica Neue",Helvetica,Arial,"Lucida Grande",sans-serif;
  color:white;
  font-size:12px;
  background:#333 url(/images/classy_fabric.png);
  background-image: url("hue.png");
}

form {
 	background:#111; 
  width:300px;
  margin:30px auto;
  border-radius:0.4em;
  border:1px solid #191919;
  overflow:hidden;
  position:relative;
  box-shadow: 0 5px 10px 5px rgba(0,0,0,0.2);
}

form:after {
  content:"";
  display:block;
  position:absolute;
  height:1px;
  width:100px;
  left:20%;
  background:linear-gradient(left, #111, #444, #b6b6b8, #444, #111);
  top:0;
}

form:before {
 	content:"";
  display:block;
  position:absolute;
  width:8px;
  height:5px;
  border-radius:50%;
  left:34%;
  top:-7px;
  box-shadow: 0 0 6px 4px #fff;
}

.inset {
 	padding:20px; 
  border-top:1px solid #19191a;
}

form h1 {
  font-size:18px;
  text-shadow:0 1px 0 black;
  text-align:center;
  padding:15px 0;
  border-bottom:1px solid rgba(0,0,0,1);
  position:relative;
}

form h1:after {
 	content:"";
  display:block;
  width:250px;
  height:100px;
  position:absolute;
  top:0;
  left:50px;
  pointer-events:none;
  transform:rotate(70deg);
  background:linear-gradient(50deg, rgba(255,255,255,0.15), rgba(0,0,0,0));
  
}

label {
 	color:#666;
  display:block;
  padding-bottom:9px;
}

input[type=text],
input[type=password] {
 	width:100%;
  padding:8px 5px;
  background:linear-gradient(#1f2124, #27292c);
  border:1px solid #222;
  box-shadow:
    0 1px 0 rgba(255,255,255,0.1);
  border-radius:0.3em;
  margin-bottom:20px;
}

.p-container {
 	padding:0 20px 20px 20px; 
}

.p-container:after {
 	clear:both;
  display:table;
  content:"";
}

.p-container span {
  display:block;
  float:left;
  color:#0d93ff;
  padding-top:8px;
}

input[type=submit] {
 	padding:5px 20px;
  border:1px solid rgba(0,0,0,0.4);
  text-shadow:0 -1px 0 rgba(0,0,0,0.4);
  box-shadow:
    inset 0 1px 0 rgba(255,255,255,0.3),
    inset 0 10px 10px rgba(255,255,255,0.1);
  border-radius:0.3em;
  background:#0184ff;
  color:white;
  float:right;
  font-weight:bold;
  cursor:pointer;
  font-size:13px;
}

input[type=submit]:hover {
  box-shadow:
    inset 0 1px 0 rgba(255,255,255,0.3),
    inset 0 -10px 10px rgba(255,255,255,0.1);
}



.superior{
    font-size:20px;
    background-color: #0184ff;
    
    	padding:5px 20px;
  border:1px solid rgba(0,0,0,0.4);
  text-shadow:0 -1px 0 rgba(0,0,0,0.4);
  box-shadow:
    inset 0 1px 0 rgba(255,255,255,0.3),
    inset 0 10px 10px rgba(255,255,255,0.1);
  background:#0184ff;
  color:white;
  height: 70px;
  margin-bottom: 130px;
}

        </style>
    </head>
    <body>
    <div class="superior">
         
        <h1 style=" text-align: center; margin-top: 5px; "> DOGS & CO</h1>
    </div>
      <form id='formulario' name='formulario' action='index.jsp' method='post'>
  <h1>Iniciar Sesión</h1>
  <div class="inset">
  <p>
    <label for="email">Usuario</label>
    <input type="text" name='usuario' id='usuario'>
  </p>
  <p>
    <label for="password">Contraseña</label>
    <input type="password" name='contra' id='contra'>
  </p>
  
  </div>
  <p class="p-container">
      <a href="registro.jsp"><span>Regístrate</span></a>
    <input type="submit" name="go" id="go" value="Inicar Sesión">
  </p>
</form>
        <%
            if (request.getParameter("go") != null ){
                String user;
                String conE;
                
                Connection c = null;
                Statement s = null;
                ResultSet r = null;
                PreparedStatement ps = null;
                try {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    c = DriverManager.getConnection("jdbc:mysql://localhost/base","root","n0m3l0");
                    s = c.createStatement();
                }
                catch (SQLException error){
                    out.print(error.toString());
                }
                try {
                   user = request.getParameter("usuario");
                   conE = request.getParameter("contra");
                   r = s.executeQuery("select * from Usuario where NombreUsuario ='"+user+"';");
                   if (r.next()){
                       String con = r.getString("contrasenia");
                       if(conE.equals(con)){
                            HttpSession sesion = request.getSession();
                            sesion.setAttribute("user", request.getParameter("usuario")); 
                              s = c.createStatement();
                        String queryString="update Usuario set Sesion='"+1+"' where NombreUsuario ='"+user+"';";
                         ps=c.prepareStatement(queryString);
                         ps.executeUpdate();
                            out.println("<meta http-equiv='refresh' content='.0000001;URL=http://localhost:8080/LoG/principal.jsp'/>");
                       }
                       else {
                           out.println("<script> alert('Contraseña incorrecta');</script>");
                       }
                   }
                   else {
                       out.println("<script> alert('Usuario no registrado');;</script>");
                   }
                }
                catch (SQLException error){
                    out.print(error.toString());
                }
            }
        %> 
        
    </body>
</html>
