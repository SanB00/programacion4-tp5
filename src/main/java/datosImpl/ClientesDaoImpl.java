package datosImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import datos.ClientesDao;
import entidad.Clientes;

public class ClientesDaoImpl implements ClientesDao{
	private conexion cn;
	@Override
	public ArrayList<Clientes> getClientes(){
		cn= new conexion();
		cn.open();
		ArrayList<Clientes>lc= new ArrayList<Clientes>();
		try {
			ResultSet rs= cn.query("Select * from clientes");
			while(rs.next()) {
				Clientes cl=new Clientes();
				cl.setId(rs.getInt("id_cliente"));
				cl.setDni(rs.getString("dni"));
				cl.setCuil(rs.getString("cuil"));
				cl.setNombre(rs.getString("nombre"));
				cl.setApellido(rs.getString("apellido"));
				cl.setSexo(rs.getString("sexo"));
				cl.setFechaNacimiento(rs.getString("fecha_nacimiento"));
				cl.setDireccion(rs.getString("direccion"));
				cl.setNacionalidad(rs.getString("nacionalidad"));
				cl.setLocalidad(rs.getString("localidad"));
				cl.setProvincia(rs.getString("provincia"));
				cl.setCorreo(rs.getString("correo_electronico"));
				cl.setTelefono(rs.getString("telefono"));
				lc.add(cl);
						
			}
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			cn.close();
		}
		return lc;
	}
	@Override
	public Clientes getClientes(int id){
		cn=new conexion();
		cn.open();
		Clientes cl= new Clientes();
		PreparedStatement ps=cn.queryp("Select * from clientes where id_cliente=?");
		try {
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				cl.setId(rs.getInt("id_cliente"));
				cl.setDni(rs.getString("dni"));
				cl.setCuil(rs.getString("cuil"));
				cl.setNombre(rs.getString("nombre"));
				cl.setApellido(rs.getString("apellido"));
				cl.setSexo(rs.getString("sexo"));
				cl.setFechaNacimiento(rs.getString("fecha_nacimiento"));
				cl.setDireccion(rs.getString("direccion"));
				cl.setNacionalidad(rs.getString("nacionalidad"));
				cl.setLocalidad(rs.getString("localidad"));
				cl.setProvincia(rs.getString("provincia"));
				cl.setCorreo(rs.getString("correo_electronico"));
				cl.setTelefono(rs.getString("telefono"));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			cn.close();
		}
		return cl;
	}
	@Override
	public int agregarCliente(Clientes cliente) throws Exception {
		cn=new conexion();
		cn.open();
		String sql = "insert into clientes(dni,cuil,nombre,apellido,sexo,fecha_nacimiento,direccion,nacionalidad,localidad,provincia,correo_electronico,telefono) values (?,?,?,?,?,?,?,?,?,?,?,?)";
	    
	    // 2. Crear el PreparedStatement indicando explícitamente el retorno de keys
	    PreparedStatement ps = cn.getConnection().prepareStatement(sql, java.sql.Statement.RETURN_GENERATED_KEYS);
		
		int filas=0;
			System.out.println("mostrando desde el dao ");
			ps.setString(1, cliente.getDni());
			System.out.println(cliente.getDni());
			ps.setString(2, cliente.getCuil());
			System.out.println(cliente.getCuil());
			ps.setString(3, cliente.getNombre());
			System.out.println(cliente.getNombre());
			ps.setString(4, cliente.getApellido());
			System.out.println(cliente.getApellido());
			ps.setString(5, cliente.getSexo());
			System.out.println(cliente.getSexo());
			ps.setString(6, cliente.getFechaNacimiento());
			System.out.println(cliente.getFechaNacimiento());
			ps.setString(7, cliente.getDireccion());
			System.out.println(cliente.getDireccion());
			ps.setString(8, cliente.getNacionalidad());
			System.out.println(cliente.getNacionalidad());
			ps.setString(9, cliente.getLocalidad());
			System.out.println(cliente.getLocalidad());
			ps.setString(10, cliente.getProvincia());
			System.out.println(cliente.getProvincia());
			ps.setString(11, cliente.getCorreo());
			System.out.println(cliente.getCorreo());
			ps.setString(12, cliente.getTelefono());
			System.out.println(cliente.getTelefono());
			filas=ps.executeUpdate();
			
			int idGenerado = -1;
			// 2. Si se insertó correctamente, obtenemos el ID
		    if (filas > 0) {
		        try (ResultSet rs = ps.getGeneratedKeys()) {
		            if (rs.next()) {
		                idGenerado = rs.getInt(1); // Este es el ID autogenerado de la fila
		                cliente.setId(idGenerado); // Si tu objeto cliente tiene un método setId
		                
		            }
		        }
		    }
		    
		    return idGenerado;
		}
	
	@Override
	public int modificarCliente(String dni, String cuil, String nombre, String apellido, String sexo,
			String fechaNacimiento, String direccion, String nacionalidad, String localidad, String provincia,
			String correo, String telefono,int id) {
		cn=new conexion();
		cn.open();
		PreparedStatement ps=cn.queryp("update clientes set dni=?,cuil=?,nombre=?,apellido=?,sexo=?,fecha_nacimiento=?,direccion=?,nacionalidad=?,localidad=?,provincia=?,correo_electronico=?,telefono=? where id_cliente=?");
		int filas=0;
		try {
			ps.setString(1, dni);
			ps.setString(2,cuil);
			ps.setString(3,nombre);
			ps.setString(4, apellido);
			ps.setString(5, sexo);
			ps.setString(6, fechaNacimiento);
			ps.setString(7,direccion);
			ps.setString(8, nacionalidad);
			ps.setString(9, localidad);
			ps.setString(10, provincia);
			ps.setString(11, correo);
			ps.setString(12, telefono);
			ps.setInt(13, id);
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
	public int eliminarCliente(int id) {
		cn=new conexion();
		cn.open();
		PreparedStatement ps=cn.queryp("delete from clientes where id_cliente=?");
		int filas=0;
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
	}
	