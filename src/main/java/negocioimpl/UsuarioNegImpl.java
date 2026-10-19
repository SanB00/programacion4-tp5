package negocioimpl;

import java.util.ArrayList;
import datosImpl.UsuariosDaoImpl;
import entidad.Usuarios;
import negocio.UsuarioNeg;

public class UsuarioNegImpl implements UsuarioNeg {

    private UsuariosDaoImpl daoUsuario = new UsuariosDaoImpl();

	@Override
	public Usuarios getUsuario(int id) {
		return daoUsuario.getUsuario(id);
	}

	@Override
	public ArrayList<Usuarios> getUsuarios() {
		return daoUsuario.getUsuarios();
	}

	@Override
	public int agregarUsuario(Usuarios user) {
		return daoUsuario.agregarUsuario(user);
	}

	@Override
	public int eliminarUsuario(int id) {
		return daoUsuario.eliminarUsuario(id);
	}

	@Override
	public int modificarUsuario(int id, String usuario, String contrasenia) {
		return daoUsuario.modificarUsuario(id, usuario, contrasenia);
	}

	@Override
	public int validarUsuario(String usuario, String contrasenia) {
		return daoUsuario.validarUsuario(usuario, contrasenia);
	}

}