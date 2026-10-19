<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Iniciar sesion</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="d-flex justify-content-center align-items-center vh-100">
	
	<div class="card col-md-5">
		<form action="ServletLogin" method="post" class="text-center">
			<h1>Iniciar sesion</h1><br>
			<input type="text" class="form-control" placeholder="usuario" name="txtUsuario" required>
			<br>
			<input type="password" class="form-control" placeholder="Contraseña"name="txtContra" required>
			<br>
			<input type="submit" class="btn btn-primary" value="Aceptar" name="btnAceptar">
			<br>
			<%if(request.getParameter("error")!=null){
			%>
			<div style="color:red">El usuario y contraseña ingresados son invalidas</div>
			<%
			}
			%>
		</form>
	</div>
</body>
</html>