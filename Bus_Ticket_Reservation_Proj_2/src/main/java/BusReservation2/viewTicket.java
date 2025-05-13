package BusReservation2;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/viewTicket")
public class viewTicket extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String phoneno = request.getParameter("phoneno");
		int bookingid = Integer.parseInt(request.getParameter("bookingid"));
		String fromdest = request.getParameter("fromdest");
		String todest = request.getParameter("todest");
		String date = request.getParameter("date");
		Date javadate = null ;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			javadate = sdf.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
			
		Booking booking = new Booking();
		String[] details = booking.getBookedDetail2(name,phoneno,bookingid,fromdest, todest, javadate);
		
		String passname = details[0];
		String busid1 = details[1];
		String bookingid1 = details[2];
		String busno1 = details[3];
		String fromdest1 = details[4];
		String todest1 = details[5];
		String busdate = details[6];
		String phoneno1 = details[7];
		String amountpay = details[8];
		String upino1 = details[9];
		String seatbooked = details[10];
		String drivername1 = details[11];
		String datetime = details[12];
		
		HttpSession session = request.getSession();
		session.setAttribute("passname", passname);
		session.setAttribute("busid1", busid1);
		session.setAttribute("bookingid", bookingid1);
		session.setAttribute("busno1", busno1);
		session.setAttribute("fromdest1", fromdest1);
		session.setAttribute("todest1", todest1);
		session.setAttribute("busdate", busdate);
		session.setAttribute("phoneno", phoneno1);
		session.setAttribute("amountpay", amountpay);
		session.setAttribute("upino1", upino1);
		session.setAttribute("seatbooked", seatbooked);
		session.setAttribute("drivername1", drivername1);
		session.setAttribute("datetime", datetime);
		response.sendRedirect("BookingConfirmedpage.jsp");
		
	}

}
