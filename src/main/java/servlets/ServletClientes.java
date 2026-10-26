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
		// para que las tildes y la ñ lleguen bien
		request.setCharacterEncoding("UTF-8");

		// 0) detectar btnGuardarCliente
		if (request.getParameter("btnGuardarCliente") != null) {
			// 1) obtener datos del form
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
			boolean losDatosSonValidos = dni != null && dni.matches("\\d{6,8}") && cuil != null
					&& cuil.matches("\\d{11}") && validarTexto(nombre) && validarTexto(apellido) && sexo != null
					&& !sexo.isBlank() && fechaNacimiento != null && !fechaNacimiento.isBlank() && direccion != null
					&& !direccion.isBlank() && validarTexto(nacionalidad) && validarTexto(localidad)
					&& validarTexto(provincia) && correo != null
					&& correo.matches("^[\\w.%+-]+@[\\w.-]+\\.[A-Za-z]{2,6}$") && telefono != null
					&& telefono.matches("\\d{10}");

			if (!losDatosSonValidos) {
				request.setAttribute("errorMensaje", "error al guardar, verifique los campos.");
				request.getRequestDispatcher("AltaCliente.jsp").forward(request, response);
				return;
			}
			Clientes objCliente = new Clientes();
			objCliente.setDni(dni);
			objCliente.setCuil(cuil);
			objCliente.setNombre(nombre);
			objCliente.setApellido(apellido);
			objCliente.setSexo(sexo);
			objCliente.setFechaNacimiento(fechaNacimiento);
			objCliente.setDireccion(direccion);
			objCliente.setNacionalidad(nacionalidad);
			objCliente.setLocalidad(localidad);
			objCliente.setProvincia(provincia);
			objCliente.setCorreo(correo);
			objCliente.setTelefono(telefono);

			// 3) guardar con dao
			int idGenerado = -1;
			try {
				idGenerado = new ClienteNegImpl().agregarCliente(objCliente);
			} catch (Exception e) {
				request.setAttribute("errorMensaje", "Error: " + e);
			}

			if (idGenerado <= 0) {
				// request.setAttribute("errorMensaje", "error al guardar, verifique los
				// campos.");
				request.getRequestDispatcher("AltaCliente.jsp").forward(request, response);
				return;
			}
			// 4) indicar resultado al usuario
			objCliente.setId(idGenerado);
			request.setAttribute("idCliente", idGenerado);
			request.setAttribute("objCliente", objCliente);
			request.getRequestDispatcher("ConfirmacionAltaCliente.jsp").forward(request, response);
		}
	}

	private boolean validarTexto(String texto) {
		return texto != null && texto.matches("[a-zA-ZáéíóúÁÉÍÓÚñÑ ]+");
	}

}