package datos;

import java.util.ArrayList;

import entidad.Usuarios;

public interface UsuariosDao {
	public Usuarios getUsuario(int id);
	public ArrayList<Usuarios> getUsuarios();
	public int agregarUsuario(Usuarios user);
	public int eliminarUsuario(int id);
	public int modificarUsuario(int id,String usuario,String contrasenia);
	public int validarUsuario(String usuario,String contrasenia);
	

}
