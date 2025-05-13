package BusReservation2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Booking {

	public String[] getBookingDetail(String from_dest, String to_dest, Date javaDate)throws ClassNotFoundException, SQLException {

		java.sql.Date sqldate = new java.sql.Date(javaDate.getTime());

		Connection con = JDBConnection.getConnection();
		String query = "select * from bus where fromdest =? and todest =? and busdate=?";
		PreparedStatement pst = con.prepareStatement(query);
		pst.setString(1, from_dest);
		pst.setString(2, to_dest);
		pst.setDate(3, sqldate);
		ResultSet rs = pst.executeQuery();

		rs.next();
		int busid = rs.getInt(1);
		String busno = rs.getString(2);
		String fromdest = rs.getString(3);
		String todest = rs.getString(4);
		java.sql.Date sqlDate = rs.getDate(5);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String travelingdate = sdf.format(sqlDate);
		int capacity = rs.getInt(6);
		int price = rs.getInt(7);
		String drivername = rs.getString(8);
		
		

		String query1 = " select sum(seatbooked) booked from booking where busid=?";
		PreparedStatement pst1 = con.prepareStatement(query1);
		pst1.setInt(1, busid);
		ResultSet rs1 = pst1.executeQuery();
		
		rs1.next();
		int booked = rs1.getInt(1);
		int availablecapacity = checkAvailableCapacity(capacity,booked);
		
		
		
		String busid1 = String.valueOf(busid);
		String availablecapacity1 = String.valueOf(availablecapacity);
		String price1 = String.valueOf(price);
		
		
		return new String[] { busid1, busno, fromdest, todest, travelingdate, availablecapacity1, price1, drivername };

	}

	
	private int checkAvailableCapacity(int capacity, int booked) {
		int availablecap =  capacity - booked ;
		return availablecap;
	}

	
	public boolean addBooking(int busid, String busno, String fromdest, String todest, Date javaDate, String drivername,
			String passangername, String passangernumber, int seats, int amount, String upino) throws ClassNotFoundException, SQLException {
		
		java.sql.Date sqldate = new java.sql.Date(javaDate.getTime());
	
		Connection con = JDBConnection.getConnection();
		String query = "Insert into booking(passangername,busid,busno,fromdest,todest,busdate,phoneno,amountpay,acountno,seatbooked,drivername) values(?,?,?,?,?,?,?,?,?,?,?) ";
		PreparedStatement pst = con.prepareStatement(query);
		pst.setString(1, passangername);
		pst.setInt(2, busid);
		pst.setString(3, busno);
		pst.setString(4, fromdest);
		pst.setString(5, todest);
		pst.setDate(6, sqldate);
		pst.setString(7, passangernumber);
		pst.setInt(8, amount);
		pst.setString(9, upino);
		pst.setInt(10, seats);
		pst.setString(11, drivername);
		int result = pst.executeUpdate();
		if(result==1) {
			return true;
		}
		return false;
	}

	public String[] getBookedDetail(String passangername, String passangernumber, String fromdest, String todest, int busid,
			Date javaDate, String upino) {
		
		java.sql.Date sqldate = new java.sql.Date(javaDate.getTime());
		
		try {
			Connection con = JDBConnection.getConnection();
			String query = "Select * from booking Where passangername=? and phoneno=? and fromdest=? and todest=? and busid=? and busdate=? and acountno=?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, passangername);
			pst.setString(2, passangernumber);
			pst.setString(3, fromdest);
			pst.setString(4, todest);
			pst.setInt(5, busid);
			pst.setDate(6, sqldate);
			pst.setString(7, upino);
			ResultSet rs = pst.executeQuery();
			rs.next();

			
			String passname = rs.getString(1);
			String busid1 = String.valueOf(rs.getInt(2));
			String bookingid = String.valueOf(rs.getInt(3));
			String busno1 = rs.getString(4);
			String fromdest1 = rs.getString(5);
			String todest1 = rs.getString(6);
			java.sql.Date sqlDate = rs.getDate(7);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String travelingdate = sdf.format(sqlDate);
			String phoneno = rs.getString(8);
			String amount = String.valueOf(rs.getInt(9));
			String accountno = rs.getString(10);
			String seatbook = String.valueOf(rs.getInt(11));
			String drivername = rs.getString(12);
			java.sql.Timestamp timestamp = rs.getTimestamp(13);
			String bookedtime = timestamp.toString();
		
		
			return new String[] {passname,busid1,bookingid,busno1,fromdest1,todest1,travelingdate,phoneno,amount,accountno,seatbook,drivername,bookedtime};
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return null;
		
	}

	public String[] getBookedDetail2(String name, String phoneno, int bookingid, String fromdest, String todest,Date javadate) {
		
		
		java.sql.Date sqldate = new java.sql.Date(javadate.getTime());
		
		try {
			Connection con = JDBConnection.getConnection();
			String query = "Select * from booking Where passangername=? and phoneno=? and fromdest=? and todest=? and busdate=? and bookingid=?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, name);
			pst.setString(2, phoneno);
			pst.setString(3, fromdest);
			pst.setString(4, todest);
			pst.setDate(5, sqldate);
			pst.setInt(6, bookingid);
			ResultSet rs = pst.executeQuery();
			rs.next();
			
			String passname = rs.getString(1);
			String busid1 = String.valueOf(rs.getInt(2));
			String bookingid1 = String.valueOf(rs.getInt(3));
			String busno1 = rs.getString(4);
			String fromdest1 = rs.getString(5);
			String todest1 = rs.getString(6);
			java.sql.Date sqlDate = rs.getDate(7);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String travelingdate = sdf.format(sqlDate);
			String phoneno1 = rs.getString(8);
			String amount = String.valueOf(rs.getInt(9));
			String accountno = rs.getString(10);
			String seatbook = String.valueOf(rs.getInt(11));
			String drivername = rs.getString(12);
			java.sql.Timestamp timestamp = rs.getTimestamp(13);
			String bookedtime = timestamp.toString();
			
			
			return new String[] {passname,busid1,bookingid1,busno1,fromdest1,todest1,travelingdate,phoneno1,amount,accountno,seatbook,drivername,bookedtime};
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public boolean deleteBooking(String name, int bookingid, String fromdest, String todest, String phoneno,
			Date javadate) {
		
		java.sql.Date sqldate = new java.sql.Date(javadate.getTime());
		
		try {
			Connection con = JDBConnection.getConnection();
			String query = "Delete from booking where passangername=? and bookingid=? and fromdest=? and todest=? and phoneno=? and busdate=? ";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, name);
			pst.setInt(2, bookingid);
			pst.setString(3, fromdest);
			pst.setString(4, todest);
			pst.setString(5, phoneno);
			pst.setDate(6, sqldate);
			int result = pst.executeUpdate();
			
			if(result==1) {
				return true;
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		
		return false;
	}


}
