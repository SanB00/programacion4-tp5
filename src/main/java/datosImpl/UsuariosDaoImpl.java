package datosImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import datos.UsuariosDao;
import entidad.Usuarios;

public class UsuariosDaoImpl implements UsuariosDao{
	private conexion cn;
	

	@Override
	public Usuarios getUsuario(int id) {
		cn = new conexion();
		cn.open();
		Usuarios us= new Usuarios();
		PreparedStatement ps=cn.queryp("Select * from usuarios where id_usuario=?");
		try {
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				us.setId(rs.getInt("id_usuario"));
				us.setUsuario(rs.getString("usuario"));
				us.setContrasenia(rs.getString("contrasena"));		
			
			}		
		}
		catch(Exception e) {	
			e.printStackTrace();
		}
		finally {
			cn.close();
		}
		return us;
	}

	@Override
	public ArrayList<Usuarios> getUsuarios() {
		cn=new conexion();
		cn.open();
		ResultSet rs= cn.query("Select * from usuarios");
		ArrayList<Usuarios> lu=new ArrayList<Usuarios>();
		try {
			while(rs.next()) {
				Usuarios U=new Usuarios();
				U.setId(rs.getInt("id_usuario"));
				U.setUsuario(rs.getString("usuario"));
				U.setContrasenia(rs.getString("contrasena"));
				lu.add(U);
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			cn.close();
		}
		return lu;
	}

	@Override
	public int agregarUsuario(Usuarios user) {
		cn=new conexion();
		cn.open();
		int filas=0;
		PreparedStatement ps=cn.queryp("insert into usuarios(usuario,contrasena) values (?,?)");
		try {
			ps.setString(1,user.getUsuario());
			ps.setString(2,user.getContrasenia());
			filas=ps.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			cn.close();
		}
		return filas;
	}

	@Override
	public int eliminarUsuario(int id) {
		cn=new conexion();
		cn.open();
		int filas=0;
		PreparedStatement ps=cn.queryp("delete from usuarios where id_usuario=?");
		try {
			ps.setInt(1, id);
			filas=ps.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			cn.close();
		}
		
		return filas;
		
	}

	@Override
	public int modificarUsuario(int id,String usuario, String contrasenia) {
		cn=new conexion();
		cn.open();
		int filas=0;
		PreparedStatement ps=cn.queryp("update usuarios set usuario=?,contrasena=? where id_usuario=?");
		try {
			ps.setString(1, usuario);
			ps.setString(2,contrasenia);
			ps.setInt(3, id);
			filas=ps.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			cn.close();
		}
		return filas;
	}

	@Override
	public int validarUsuario(String usuario, String contrasenia) {
		int filas=0;
		cn=new conexion();
		cn.open();
		PreparedStatement ps=cn.queryp("Select * from usuarios where usuario=? and Contrasena=?");
		try {
			ps.setString(1, usuario);
			ps.setString(2, contrasenia);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				filas=1;
			}
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			cn.close();
		}
		return filas;
	}

}

