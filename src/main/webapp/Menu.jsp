<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/css/estilos.css"    />
</head>
<body>
	<!-- botones de navegacion
	<div class="mb-3 text-center">
		<a href="AltaCliente.jsp" 
			class="btn btn-outline-primary btn-sm me-2">Alta de Cliente</a>
		
		<a href="${pageContext.request.contextPath}/ServletListado" class="btn btn-outline-secondary btn-sm">Listado de Clientes</a>
	</div>
	 -->
<!-- Menú Lateral -->
	<nav
		class="col-auto col-md-3 col-xl-2 sidebar bg-primary text-white p-3">
		<br>
		<h5 class="text-center fw-bold">Menú</h5>
		<br>

		<ul class="nav nav-pills flex-column mb-auto">
			<li class="nav-item">
				<a href="AltaCliente.jsp" class="nav-link text-white active bg-custom-blue" aria-current="page">Alta de Cliente</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath}/ServletListado" class="nav-link text-white">Listado de Clientes</a>
			</li>
		</ul>
	</nav>

<div class="content-offset">
	
	<c:if test="${not empty errorMensaje}">
        <div style="color: red; background-color: #ffe6e6; padding: 10px; border: 1px solid red; margin-bottom: 15px;">
            <strong>¡Atención!</strong> ${errorMensaje}
        </div>
    </c:if>
</div>
</body>
</html>