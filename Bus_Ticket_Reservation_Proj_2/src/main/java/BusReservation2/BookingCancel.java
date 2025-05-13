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


@WebServlet("/BookingCancel")
public class BookingCancel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		int bookingid = Integer.parseInt(request.getParameter("bookingid"));
		String fromdest = request.getParameter("fromdest");
		String todest = request.getParameter("todest");
		String phoneno = request.getParameter("phoneno");
	
		
		String date= request.getParameter("date");
		
		Date javadate;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			javadate = sdf.parse(date);
			Booking booking = new Booking();
			boolean delete = booking.deleteBooking(name,bookingid,fromdest,todest,phoneno,javadate);
			if(delete) {
				HttpSession session = request.getSession();
				session.setAttribute("name", name);
				session.setAttribute("bookingid", bookingid);
				session.setAttribute("mobileno", phoneno);
				response.sendRedirect("BookingDeleted.jsp");
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
	}

}
