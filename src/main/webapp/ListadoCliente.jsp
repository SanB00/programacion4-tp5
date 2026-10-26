
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

    <!-- DataTables para Bootstrap 5 -->
    <link href="https://cdn.datatables.net/1.13.8/css/dataTables.bootstrap5.min.css"
          rel="stylesheet">

    <style>
        body {
            margin: 0;
            background-color: #f8f9fa;
        }

        /* Menú lateral */
        .sidebar {
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 100;
        }

        .bg-custom-blue {
            background-color: #1746a2 !important;
        }

        /* Contenido principal: deja espacio para el menú */
        .content-offset {
            margin-left: 16.666667%;
            width: 83.333333%;
            padding: 20px;
            box-sizing: border-box;
        }

        /* Contenedor de la tabla */
        .contenedor-tabla {
            margin-top: 20px;
            padding: 10px;
            background-color: #f5f5f5;
            border-radius: 4px;
            width: 100%;
            box-sizing: border-box;
        }

        /* Tabla ajustada al ancho disponible */
        .tabla-clientes {
            width: 100% !important;
            table-layout: fixed;
            font-size: 11px;
        }

        .tabla-clientes th,
        .tabla-clientes td {
            padding: 6px 4px !important;
            overflow-wrap: anywhere;
            vertical-align: middle;
        }

        .tabla-clientes th {
            white-space: normal;
        }

        /* Evita que los controles de DataTables desborden */
        .dataTables_wrapper {
            width: 100%;
            font-size: 12px;
        }

        /* Adaptación a pantallas pequeñas */
        @media (max-width: 767.98px) {
            .sidebar {
                position: relative;
                width: 100%;
                height: auto;
            }

            .content-offset {
                margin-left: 0;
                width: 100%;
                padding: 15px;
            }

            .tabla-clientes {
                font-size: 10px;
            }

            .tabla-clientes th,
            .tabla-clientes td {
                padding: 4px 2px !important;
            }
        }
    </style>
</head>

<body>

    <!-- Menú lateral -->
    <nav class="col-auto col-md-3 col-xl-2 sidebar bg-primary text-white p-3">
        <br>

        <h5 class="text-center fw-bold">Menú</h5>

        <br>

        <ul class="nav nav-pills flex-column mb-auto">
            <li class="nav-item">
                <a href="AltaCliente.jsp"
                   class="nav-link text-white">
                    Alta de Cliente
                </a>
            </li>

            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/ServletListado"
                   class="nav-link text-white active bg-custom-blue"
                   aria-current="page">
                    Listado de Clientes
                </a>
            </li>
        </ul>
    </nav>

    <!-- Contenido principal -->
    <main class="content-offset">

        <h2 class="fw-bold">Formulario de Cliente</h2>

        <!-- Usuario que inició sesión -->
        <p class="mt-3">
            <strong>Usuario:</strong>
            <c:out value="${sessionScope.usuario}" />
        </p>

        <!-- Listado de clientes -->
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

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <!-- DataTables -->
    <script src="https://cdn.datatables.net/1.13.8/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.8/js/dataTables.bootstrap5.min.js"></script>

    <!-- Configuración de DataTables -->
    <script>
        $(document).ready(function () {
            $('#tablaClientes').DataTable({
                autoWidth: false,
                scrollX: false,
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

