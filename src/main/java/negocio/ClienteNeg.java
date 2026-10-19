package negocio;

import java.util.ArrayList;
import entidad.Clientes;

public interface ClienteNeg {    
    ArrayList<Clientes> getClientes();
    Clientes getCliente(int idCliente);
    int agregarCliente(Clientes cliente) throws Exception;
    int modificarCliente(String dni,String cuil,String nombre,
	String apellido,String sexo,String fechaNacimiento,String direccion,
	String nacionalidad,String localidad,String provincia,String correo,
	String telefono,int id);
    int eliminarCliente(int id);
}
