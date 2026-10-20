<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="entidad.Clientes"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Cliente ingresado con exito!</title>
</head>
<body>

	<jsp:include page="Menu.jsp"></jsp:include>
	</hr>

	<div class="container" style="color: green;">
		<%
		Clientes objCliente = null;
		if (session.getAttribute("objCliente") != null) {
			objCliente = (Clientes) session.getAttribute("objCliente");
		}
		%>

		<c:if test="${not empty objCliente}">
			<h1>Cliente ingresado con exito!</h1>
			<p>
			<h3>
				<!-- El ID es el <strong>"${objCliente.getId()}"</strong> -->
				El ID es el <strong>"${idCliente}"</strong>
				El ID es el <strong>"${objCliente.getId()}"</strong>
				Nombre: <b>"${objCliente.getNombre()}"</b>
				Apellido: <b>"${objCliente.getApellido()}"</b>
				DNI: <b>"${objCliente.getDni()}"</b>
			</h3>
			</p>
		</c:if>
	</div>
</body>
</html>
