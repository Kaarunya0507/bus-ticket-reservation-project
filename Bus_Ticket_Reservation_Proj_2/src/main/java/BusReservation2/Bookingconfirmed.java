package BusReservation2;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Bookingconfirmed")
public class Bookingconfirmed extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int busid = Integer.parseInt(request.getParameter("busid")) ;
		String busno = request.getParameter("busno");
		String fromdest = request.getParameter("fromdest");
		String todest = request.getParameter("todest");
		String date = request.getParameter("date");
		String drivername = request.getParameter("drivername");
		String passangername = request.getParameter("passangername");
		String passangernumber = request.getParameter("passangernumber");
		int seats = Integer.parseInt(request.getParameter("seats"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		String upino = request.getParameter("upino");
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date javaDate = null;
		try {
			javaDate = dateFormat.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		Booking booking = new Booking();
		try {
			boolean confirm = booking.addBooking(busid,busno,fromdest,todest,javaDate,drivername,passangername,passangernumber,seats,amount,upino);
			if(confirm) {
				String[] booked_details = booking.getBookedDetail(passangername,passangernumber,fromdest,todest,busid,javaDate,upino);
				
				String passname = booked_details[0];
				String busid1 = booked_details[1];
				String bookingid = booked_details[2];
				String busno1 = booked_details[3];
				String fromdest1 = booked_details[4];
				String todest1 = booked_details[5];
				String busdate = booked_details[6];
				String phoneno = booked_details[7];
				String amountpay = booked_details[8];
				String upino1 = booked_details[9];
				String seatbooked = booked_details[10];
				String drivername1 = booked_details[11];
				String datetime = booked_details[12];
				
				HttpSession session = request.getSession();
				session.setAttribute("passname", passname);
				session.setAttribute("busid1", busid1);
				session.setAttribute("bookingid", bookingid);
				session.setAttribute("busno1", busno1);
				session.setAttribute("fromdest1", fromdest1);
				session.setAttribute("todest1", todest1);
				session.setAttribute("busdate", busdate);
				session.setAttribute("phoneno", phoneno);
				session.setAttribute("amountpay", amountpay);
				session.setAttribute("upino1", upino1);
				session.setAttribute("seatbooked", seatbooked);
				session.setAttribute("drivername1", drivername1);
				session.setAttribute("datetime", datetime);
				response.sendRedirect("BookingConfirmedpage.jsp");
				
			}
		} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();
		}
		
	}

}
