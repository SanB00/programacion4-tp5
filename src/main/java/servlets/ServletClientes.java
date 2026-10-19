package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidad.Clientes;
import negocioimpl.ClienteNegImpl;

/**
 * Servlet implementation class ServletClientes
 */
@WebServlet("/ServletClientes")
public class ServletClientes extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletClientes() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 0) detectar btnGuardarCliente
		if (request.getParameter("btnGuardarCliente") != null) {
			// paso 1, obtener datos del form
			String dni = request.getParameter("txtDni");
			String cuil = request.getParameter("txtCuil");
			String nombre = request.getParameter("txtNombre");
			String apellido = request.getParameter("txtApellido");
			String sexo = request.getParameter("txtSexo");
			String fechaNacimiento = request.getParameter("txtFechaNacimiento");
			String direccion = request.getParameter("txtDireccion");
			String nacionalidad = request.getParameter("txtNacionalidad");
			String localidad = request.getParameter("txtLocalidad");
			String provincia = request.getParameter("txtProvincia");
			String correo = request.getParameter("txtEmail");
			String telefono = request.getParameter("txtTelefono");

			// 2) validar tipo de dato
			boolean datosValidos = dni != null && dni.matches("[0-9]{6,8}")
					&& cuil != null && cuil.matches("[0-9]{11}")
					&& nombre != null && nombre.matches("[A-Za-zÁ-Úá-úñÑ\\s]+")
					&& apellido != null && apellido.matches("[A-Za-zÁ-Úá-úñÑ\\s]+")
					&& sexo != null && !sexo.trim().isEmpty()
					&& fechaNacimiento != null && !fechaNacimiento.trim().isEmpty()
					&& direccion != null && !direccion.trim().isEmpty()
					&& nacionalidad != null && nacionalidad.matches("[A-Za-zÁ-Úá-úñÑ\\s]+")
					&& localidad != null && localidad.matches("[A-Za-zÁ-Úá-úñÑ\\s]+")
					&& provincia != null && provincia.matches("[A-Za-zÁ-Úá-úñÑ\\s]+")
					&& correo != null && correo.matches("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$")
					&& telefono != null && telefono.matches("[0-9]{10}");

			if (datosValidos) {
				Clientes cliente = new Clientes();
				cliente.setDni(dni);
				cliente.setCuil(cuil);
				cliente.setNombre(nombre);
				cliente.setApellido(apellido);
				cliente.setSexo(sexo);
				cliente.setFechaNacimiento(fechaNacimiento);
				cliente.setDireccion(direccion);
				cliente.setNacionalidad(nacionalidad);
				cliente.setLocalidad(localidad);
				cliente.setProvincia(provincia);
				cliente.setCorreo(correo);
				cliente.setTelefono(telefono);

				// 3) guardar con dao
				ClienteNegImpl clienteNeg = new ClienteNegImpl();
				int filas = clienteNeg.agregarCliente(cliente);

				if (filas > 0) {
					response.sendRedirect("ListadoCliente.jsp");
				} else {
					response.sendRedirect("AltaCliente.jsp?error=1");
				}
			} else {
				response.sendRedirect("AltaCliente.jsp?error=1");
			}
			//4) indicar resultado al usuario
			request.setAttribute("mensaje", "Cliente agregado correctamente");
		request.getRequestDispatcher("ListadoCliente.jsp").forward(request, response);
		
		}
	}

}
