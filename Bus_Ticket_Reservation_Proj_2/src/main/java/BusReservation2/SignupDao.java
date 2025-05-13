package BusReservation2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class SignupDao {

	public boolean addLoginDetail(String username, String password, String cpassword) throws ClassNotFoundException, SQLException {
		Connection con = JDBConnection.getConnection();
		String query = "insert into signup(username,pwd,cpwd) values(?,?,?)";
		PreparedStatement pst = con.prepareStatement(query);
		pst.setString(1, username);
		pst.setString(2, password);
		pst.setString(3, cpassword);
		int result = pst.executeUpdate();
		if(result == 1) {
			return true;
		}
		return false;
	}

}
