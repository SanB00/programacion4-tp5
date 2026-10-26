<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

<title>Login</title>
</head>

<body>

<div class="container d-flex justify-content-center align-items-center min-vh-100">
<div class="card shadow p-4" style="width: 100%; max-width: 400px;">
<div class="card-body">

<h3 class="card-title">Iniciar sesión</h3>

<form action="ServletLogin" method="post">

<label class="form-label">Usuario</label><br>
<input type="text" class="form-control" placeholder="usuario" name="txtUsuario" required><br>

<label class="form-label">Contraseña</label><br>
<input type="password" class="form-control" placeholder="Contraseña"name="txtContra" required><br>

<%
if(request.getParameter("error")!=null){
%>
<div class="alert alert-danger">
  <p>El usuario y contraseña ingresados no son válidos.</p>
</div>

<% 
session.removeAttribute("estadoUsuario");
} 
%>

<input type="submit" class="btn btn-primary w-100" name="btnAceptar" value="Aceptar">
</form>

</div>
</div>
</div>
	
<!-- Bootstrap JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"> </script>
</body>
</html>