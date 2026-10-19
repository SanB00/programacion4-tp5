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

	<%
	Clientes objCliente = null;
	if (session.getAttribute("objCliente") != null) {
		objCliente = (Clientes) session.getAttribute("objCliente");
	}
	%>

	<c:if test="${not empty objCliente}">
		<h1>Cliente ingresado con exito!</h1>
		<div style="color: green;">
			<h3>
				El ID es el <strong>"${objCliente.getId()}"</strong>
			</h3>
		</div>
	</c:if>
</body>
</html>
