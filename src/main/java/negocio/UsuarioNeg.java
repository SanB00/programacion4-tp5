package negocio;

import java.util.ArrayList;
import entidad.Usuarios;

public interface UsuarioNeg {
    Usuarios getUsuario(int id);
	ArrayList<Usuarios> getUsuarios();
	int agregarUsuario(Usuarios user);
	int eliminarUsuario(int id);
	int modificarUsuario(int id,String usuario,String contrasenia);
	int validarUsuario(String usuario,String contrasenia);
}