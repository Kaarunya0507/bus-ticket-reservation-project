package BusReservation2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDao {

	public boolean checkLogin(String username, String password) throws ClassNotFoundException, SQLException {
		Connection con = JDBConnection.getConnection();
		String query = "select * from signup where username=? and pwd = ?";
		PreparedStatement pst = con.prepareStatement(query);
		pst.setString(1, username);
		pst.setString(2, password);
		ResultSet rs =  pst.executeQuery();
		return (rs.next());			
	}
	
}
