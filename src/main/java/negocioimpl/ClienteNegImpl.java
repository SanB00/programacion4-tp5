package negocioimpl;

import java.util.ArrayList;
import datosImpl.ClientesDaoImpl;
import entidad.Clientes;
import negocio.ClienteNeg;

public class ClienteNegImpl implements ClienteNeg {

    private ClientesDaoImpl daoCliente = new ClientesDaoImpl();

    @Override
    public ArrayList<Clientes> getClientes() {
        return daoCliente.getClientes();
    }

    @Override
    public Clientes getCliente(int idCliente) {
        return daoCliente.getClientes(idCliente);
    }

    @Override
    public int agregarCliente(Clientes cliente) {
        return daoCliente.agregarCliente(cliente);
    }

    @Override
    public int modificarCliente(String dni, String cuil, String nombre, String apellido, String sexo,
            String fechaNacimiento, String direccion, String nacionalidad, String localidad, String provincia,
            String correo, String telefono, int id) {
        return daoCliente.modificarCliente(dni, cuil, nombre, apellido, sexo, fechaNacimiento, 
                                          direccion, nacionalidad, localidad, provincia, 
                                          correo, telefono, id);
    }

    @Override
    public int eliminarCliente(int id) {
        return daoCliente.eliminarCliente(id);
    }
}