<%@ page import="entidad.Usuarios"%>
<%@ page import="java.time.LocalDate" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alta de Cliente</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light py-5">

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-7">
                
                <!-- botones de navegacion -->
                <div class="mb-3 text-center">
                    <a href="AltaCliente.jsp" class="btn btn-outline-primary btn-sm me-2">Alta de Cliente</a>
                    <a href="ListadoCliente.jsp" class="btn btn-outline-secondary btn-sm">Listado de Clientes</a>
                </div>

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
            </div>
        </div>
    </div>

</body>
</html>