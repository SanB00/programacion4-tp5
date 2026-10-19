package datosImpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class conexion {
	private String host = "jdbc:mysql://localhost:3306/";
	private String user = "root";
	private String pass = "root";
	private String dbname = "sistema_clientes";

	protected Connection cn;

	public Connection open() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			this.cn = DriverManager.getConnection(host + dbname, user, pass);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return this.cn;
	}

	public ResultSet query(String query) {
		Statement st;
		ResultSet rs = null;
		try {
			st = (Statement) cn.createStatement();
			rs = ((java.sql.Statement) st).executeQuery(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;

	}

	public PreparedStatement queryp(String query) {
		PreparedStatement ps;
		ps = null;
		try {
			ps = cn.prepareStatement(query);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ps;
	}

	public boolean execute(String query) {
		Statement st;
		boolean save = true;
		try {
			st = (Statement) cn.createStatement();
			((java.sql.Statement) st).executeUpdate(query);

		} catch (SQLException e) {
			save = false;
			e.printStackTrace();
		}
		return save;
	}

	public boolean close() {
		boolean ok = true;
		try {
			cn.close();
		} catch (Exception e) {
			e.printStackTrace();
			ok = false;
		}
		return ok;
	}

	public Connection getConnection() {
		return this.cn;
	}
}
