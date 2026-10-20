
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Listado de Clientes</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- DataTables -->
    <link href="https://cdn.datatables.net/1.13.8/css/dataTables.bootstrap5.min.css"
          rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #fff;
        }

        .menu-lateral {
            position: fixed;
            top: 0;
            left: 0;
            width: 175px;
            height: 100vh;
            background-color: #3069f5;
            padding: 20px 8px;
        }

        .menu-lateral h5 {
            color: white;
            text-align: center;
            font-size: 15px;
            margin-bottom: 25px;
        }

        .menu-lateral a {
            display: block;
            color: white;
            text-decoration: none;
            padding: 10px 8px;
            margin-bottom: 5px;
            border-radius: 4px;
            font-size: 12px;
        }

        .menu-lateral a:hover,
        .menu-lateral a.activo {
            background-color: #1746a2;
        }

        .contenido {
            margin-left: 195px;
            padding: 25px 20px;
        }

        .contenedor-tabla {
            margin-top: 20px;
            padding: 15px;
            background-color: #f5f5f5;
            border-radius: 4px;
        }

        .tabla-clientes {
            width: 100% !important;
            font-size: 12px;
        }

        .tabla-clientes th {
            white-space: nowrap;
        }

        @media (max-width: 768px) {
            .menu-lateral {
                position: relative;
                width: 100%;
                height: auto;
            }

            .contenido {
                margin-left: 0;
                padding: 15px;
            }

            .contenedor-tabla {
                overflow-x: auto;
            }
        }
    </style>
</head>

<body>

    <!-- Menú lateral -->
    <nav class="menu-lateral">
        <h5>Menú</h5>

        <a href="AltaCliente.jsp">Alta de Cliente</a>

        <a href="${pageContext.request.contextPath}/ServletListado"
           class="activo">Listado de Clientes</a>
    </nav>

    <!-- Contenido principal -->
    <main class="contenido">

        <h2 class="fw-bold">Formulario de Cliente</h2>

        <p class="mt-3">
            <strong>Usuario:</strong>
            <c:out value="${sessionScope.usuario}" />
        </p>

        <div class="contenedor-tabla">

            <h5 class="fw-bold mb-4">
                Listado de Clientes
                (<c:out value="${empty clientes ? 0 : clientes.size()}" />)
            </h5>

            <table id="tablaClientes"
                   class="table table-striped table-hover table-sm tabla-clientes">

                <thead>
                    <tr>
                        <th>DNI</th>
                        <th>CUIL</th>
                        <th>Nombre y Apellido</th>
                        <th>Sexo</th>
                        <th>Fecha de Nacimiento</th>
                        <th>Dirección</th>
                        <th>Nacionalidad</th>
                        <th>Localidad</th>
                        <th>Provincia</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="cliente" items="${clientes}">
                        <tr>
                            <td><c:out value="${cliente.dni}" /></td>
                            <td><c:out value="${cliente.cuil}" /></td>
                            <td>
                                <c:out value="${cliente.nombre}" />
                                <c:out value="${cliente.apellido}" />
                            </td>
                            <td><c:out value="${cliente.sexo}" /></td>
                            <td><c:out value="${cliente.fechaNacimiento}" /></td>
                            <td><c:out value="${cliente.direccion}" /></td>
                            <td><c:out value="${cliente.nacionalidad}" /></td>
                            <td><c:out value="${cliente.localidad}" /></td>
                            <td><c:out value="${cliente.provincia}" /></td>
                        </tr>
                    </c:forEach>
                </tbody>

            </table>
        </div>
    </main>

    <!-- jQuery y DataTables -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <script src="https://cdn.datatables.net/1.13.8/js/jquery.dataTables.min.js"></script>

    <script src="https://cdn.datatables.net/1.13.8/js/dataTables.bootstrap5.min.js"></script>

    <script>
        $(document).ready(function () {
            $('#tablaClientes').DataTable({
                pageLength: 5,
                lengthMenu: [5, 10, 15, 25],
                ordering: true,
                searching: true,
                language: {
                    processing: "Procesando...",
                    search: "Buscar:",
                    lengthMenu: "Mostrar _MENU_ registros",
                    info: "Mostrando _START_ a _END_ de _TOTAL_ registros",
                    infoEmpty: "Mostrando 0 a 0 de 0 registros",
                    infoFiltered: "(filtrado de _MAX_ registros totales)",
                    loadingRecords: "Cargando...",
                    zeroRecords: "No se encontraron clientes",
                    emptyTable: "No hay clientes registrados",
                    paginate: {
                        first: "Primero",
                        previous: "Anterior",
                        next: "Siguiente",
                        last: "Último"
                    }
                }
            });
        });
    </script>

</body>
</html>
