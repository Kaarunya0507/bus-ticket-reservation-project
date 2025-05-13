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


@WebServlet("/CheckBus")
public class CheckBus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String Fromdest = request.getParameter("from_dest");
		String Todest = request.getParameter("to_dest");
		String date = request.getParameter("date");
		Date javaDate = null;
		
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			javaDate = dateFormat.parse(date);			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		     
		try {
			
			Booking booking = new Booking();
			String[] details = booking.getBookingDetail(Fromdest,Todest,javaDate);
			String busid = details[0];
			String busno = details[1];
			String fromdest = details[2];
			String todest = details[3];
			String travelingdate = details[4];
			String capacity = details[5];
			String price = details[6];
			String drivername = details[7];
			
			
			
	        HttpSession session = request.getSession();
	        session.setAttribute("busid", busid);
	        session.setAttribute("busno", busno);
	        session.setAttribute("fromdest", fromdest);
	        session.setAttribute("todest", todest);
	        session.setAttribute("travelingdate", travelingdate);
	        session.setAttribute("capacity", capacity);
	        session.setAttribute("price", price);
	        session.setAttribute("drivername", drivername);
	        response.sendRedirect("BookingConfirmation.jsp");        
	        
	        
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			response.getWriter().println("Bus is not found");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
