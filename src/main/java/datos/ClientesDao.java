package datos;

import java.util.ArrayList;

import entidad.Clientes;

public interface ClientesDao {
	public ArrayList<Clientes> getClientes();

	public Clientes getClientes(int id);

	public int agregarCliente(Clientes cliente) throws Exception;

	public int modificarCliente(String dni, String cuil, String nombre, String apellido, String sexo,
			String fechaNacimiento, String direccion, String nacionalidad, String localidad, String provincia,
			String correo, String telefono, int id);

	public int eliminarCliente(int id);
}
