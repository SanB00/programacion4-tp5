package entidad;

public class Usuarios {
	private int id;
	private String usuario;
	private String contrasenia;
	
	public Usuarios() {}
	public Usuarios(int id,String usuario, String contrasenia) {
		this.id=id;
		this.usuario=usuario;
		this.contrasenia=contrasenia;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public String getContrasenia() {
		return contrasenia;
	}
	public void setContrasenia(String contrasenia) {
		this.contrasenia = contrasenia;
	}
	@Override
	public String toString() {
		return "Usuarios [id=" + id + ", usuario=" + usuario + ", contrasenia=" + contrasenia + "]";
	}
	
}