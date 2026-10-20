
package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidad.Clientes;
import negocioimpl.ClienteNegImpl;

@WebServlet("/ServletListado")
public class ServletListado extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        // Verificar que exista una sesión iniciada
        HttpSession sesion = request.getSession(false);

        if (sesion == null || sesion.getAttribute("usuario") == null) {
            response.sendRedirect(
                request.getContextPath() + "/Login.jsp"
            );
            return;
        }

        try {
            // Obtener los clientes desde la capa de negocio
            ClienteNegImpl negocio = new ClienteNegImpl();
            ArrayList<Clientes> listaClientes = negocio.getClientes();
            

            // Enviar los clientes al JSP
            request.setAttribute("clientes", listaClientes);

            // Mostrar el listado
            request.getRequestDispatcher("/ListadoCliente.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            throw new ServletException(
                "Error al obtener el listado de clientes", e
            );
        }
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}
