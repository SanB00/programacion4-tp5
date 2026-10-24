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

</head>
<body>
	<!-- botones de navegacion -->
	<div class="mb-3 text-center">
		<a href="AltaCliente.jsp" 
			class="btn btn-outline-primary btn-sm me-2">Alta de Cliente</a>
		
		<a href="${pageContext.request.contextPath}/ServletListado" class="btn btn-outline-secondary btn-sm">Listado de Clientes</a>
	</div>
	
	<c:if test="${not empty errorMessage}">
        <div style="color: red; background-color: #ffe6e6; padding: 10px; border: 1px solid red; margin-bottom: 15px;">
            <strong>¡Atención!</strong> ${errorMessage}
        </div>
    </c:if>
</body>
</html>