<%@ page import="entidad.Usuarios"%>
<%@ page import="entidad.Clientes" %>
<%@ page import="java.time.LocalDate" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Alta de Cliente</title>

<!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/estilos.css">

</head>
<body class="bg-light py-5">

    <!-- Menú Lateral -->
	<nav
		class="col-auto col-md-3 col-xl-2 sidebar bg-primary text-white p-3">
		<br>
		<h5 class="text-center fw-bold">Menú</h5>
		<br>

		<ul class="nav nav-pills flex-column mb-auto">
			<li class="nav-item"><a href="AltaCliente.jsp"
				class="nav-link text-white active bg-custom-blue"
				aria-current="page">Alta de Cliente</a></li>
			<li><a href="${pageContext.request.contextPath}/ServletListado" class="nav-link text-white">Listado
					de Clientes</a></li>
		</ul>
	</nav>



    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-7">
                

                <!-- cuadro para cargar los datos del cliente -->
                <div class="card shadow p-4">
                    
                    <!-- mostar nombre de usuario que inicio sesion -->
                    <%
                    String usuario = null;
                    if(session.getAttribute("usuario")!= null){
                        usuario = (String)session.getAttribute("usuario");
                    }
                    if(usuario != null){
                    %>
                        <div class="text-end text-muted small mb-2"><b>Usuario: <%= usuario %></b></div>
                    <% } %>

                    <h2 class="text-center mb-4">Formulario de Cliente</h2>
                    
                    <form action="ServletClientes" method="post" class="row g-3">
                        
                        <div class="col-md-6">
                            <label class="form-label">DNI</label>
                            <input type="text" class="form-control" required name="txtDni" pattern="[0-9]{6,8}" title="Ingrese entre 6 y 8 números">
                        </div>
                        
                        <div class="col-md-6">
                            <label class="form-label">CUIL</label>
                            <input type="text" class="form-control" required name="txtCuil" pattern="[0-9]{11}" title="Ingrese exactamente 11 números">
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Nombre</label>
                            <input type="text" class="form-control" required name="txtNombre" pattern="[A-Za-zÁ-Úá-úñÑ\s]+" title="Solo se permiten letras">
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Apellido</label>
                            <input type="text" class="form-control" required name="txtApellido" pattern="[A-Za-zÁ-Úá-úñÑ\s]+" title="Solo se permiten letras">
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Sexo</label>
                            <select class="form-select" name="txtSexo" required>
                                <option value="">--Seleccione--</option>
                                <option value="M">Masculino</option>
                                <option value="F">Femenino</option>
                                <option value="Otro">Otro</option>
                            </select>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Nacionalidad</label>
                            <input type="text" class="form-control" required name="txtNacionalidad" pattern="[A-Za-zÁ-Úá-úñÑ\s]+" title="Solo se permiten letras">
                        </div>
						<!-- Carga la fecha actual para establecerla como maximo  -->
                        <% 
                        String fechaActual = LocalDate.now().toString();
                        %>
                        <div class="col-md-6">
                            <label class="form-label">Fecha de nacimiento</label>
                            <input type="date" class="form-control" required name="txtFechaNacimiento" max="<%= fechaActual %>">
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Dirección</label>
                            <input type="text" class="form-control" required name="txtDireccion">
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Localidad</label>
                            <input type="text" class="form-control" required name="txtLocalidad" pattern="[A-Za-zÁ-Úá-úñÑ\s]+" title="Solo se permiten letras">
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Provincia</label>
                            <input type="text" class="form-control" required name="txtProvincia" pattern="[A-Za-zÁ-Úá-úñÑ\s]+" title="Solo se permiten letras">
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Correo electronico</label>
                            <input type="email" class="form-control" required name="txtEmail">
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Teléfono</label>
                            <input type="text" class="form-control" required name="txtTelefono" pattern="[0-9]{10}" title="Ingrese un teléfono válido de 10 dígitos">
                        </div>

                        <div class="col-12 text-center mt-4">
                            <input type="submit" class="btn btn-primary px-4" value="Guardar Cliente" name="btnGuardarCliente">
                        </div>
                    </form>
                     

                </div>
                
                <%
		Clientes objCliente = null;
		if (session.getAttribute("objCliente") != null) {
			objCliente = (Clientes) session.getAttribute("objCliente");
		
		%>
		<h1>Cliente ingresado con exito!</h1>
		<h3>El Id es: </h3><%=objCliente.getId() %>
		<%
		}
		%>
		
            </div>
        </div>
    </div>

</body>
</html>