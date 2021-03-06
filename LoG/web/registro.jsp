<%-- 
    Document   : registro
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
  margin-bottom: 50px;
}

        </style>
        <script type="text/javascript">
            function campos(nombre,usuario,contrasenia,repetirC){
                var nom,us,cont,cont2;
                nom=nombre.value;
                us=usuario.value;
                cont=contrasenia.value;
                cont2=repetirC.value;
                if(nom.length==0){
                    alert("Llena el campo nombre");
                    nombre.focus();
                    return false;
                }
                else if(us.lenght==0){
                    alert("Llena el campo usuario");
                    usuario.focus();
                    return false;
                }
                else if(cont.lenght==0){
                    alert("Llena el campo Contraseña");
                    contrasenia.focus();
                    return false;
                }
                else if(cont2.lenght==0){
                    alert("Llena el campo Repetir Contraseña");
                    repetirC.focus();
                    return false;
                }
                    
            }
            function contra(e){
            var x = e.which || e.keyCode;
            if((x>=97 && x<=122) || (x>=65 && x<=90) || (x===8|| x ===224 || x ===232|| x===236|| x===242||x===249||x===241) || (x>=48&&x<=57)||(x===8))
                return true;
            else
                return false;
        }
            function validar(contrasenia, repetirC){
                var contraa = contrasenia.value;
                var repetirr = repetirC.value;
                    if(contraa!==repetirr){
                        alert("Las contraseñas no son iguales");
                        contrasenia.focus();
                        return false;
                }
               
            }
        </script>
    </head>
    <body>
    <div class="superior">
         
        <h1 style=" text-align: center; margin-top: 5px; "> DOGS & CO</h1>
    </div>
      <form id='formulario' name='formulario' action='registro.jsp' method='post'>
  <h1>Registrate</h1>
  <div class="inset">
  <p>
    <label for="email">Nombre</label>
    <input type="text" name='nombre' id='nombre'>
  </p>
  <p>
    <label for="password">Usuario</label>
    <input type="text" name='usuario' id='usuario'>
  </p>
  <p>
    <label for="password">Contraseña</label>
    <input type="password" name='contrasenia' id='contrasenia' onkeypress='return contra(event)'>
  </p>
  <p>
    <label for="password">Repetir Contraseña</label>
    <input type="password" name='repetirC' id='repetirC' onkeypress='return contra(event)'>
  </p>
  
  </div>
  <p class="p-container">
      
    <input type="submit" name="go" id="go" value="Registrarse" onClick='return validar(contrasenia, repetirC), campos(nombre,usuario,contrasenia,repetirC);'>
  </p>
</form>
        <%
            if(request.getParameter("go") != null)
            {
                String nome=request.getParameter("nombre");
                String user=request.getParameter("usuario");
                String contra=request.getParameter("contrasenia");
                Connection con=null;
                Statement s = null;
                PreparedStatement pstatement=null;
                ResultSet r = null;
                 try
                {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/base","root","n0m3l0");
                    s = con.createStatement();
                    r = s.executeQuery("select * from Usuario where NombreUsuario ='"+user+"';");
                    if (!r.next()){
                        String queryString="call addAlumno('"+0+"','"+user+"','"+contra+"','"+nome+"', '"+0+"');";
                         pstatement=con.prepareStatement(queryString);
                         pstatement.executeUpdate();
                             out.println("<script>alert('Registro exitoso')</script>");
                             out.println("<meta http-equiv='refresh' content='.0000001;URL=http://localhost:8080/LoG/index.jsp/index.jsp'/>");
                       
                    }
                    else {
                        out.println("<script>alert('Nombre de usuario ya registrado :(');</script>");
                    }
                }
                 catch(SQLException error)
                {
                    out.println(error.toString());  
                }
                catch(Exception e)
                        {
                            out.println(e.getLocalizedMessage());
                            e.printStackTrace();
                        }
            }
        
        %>
        
    </body>
</html>
