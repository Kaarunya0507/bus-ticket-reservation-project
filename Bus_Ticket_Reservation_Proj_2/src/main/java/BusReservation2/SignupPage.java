package BusReservation2;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/SignupPage")
public class SignupPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String cpassword = request.getParameter("cpassword");
		SignupDao signupdao = new SignupDao();
		try {
			if(signupdao.addLoginDetail(username,password,cpassword)) {
				HttpSession session = request.getSession();
				session.setAttribute("username", username);
				session.setAttribute("password", password);
				response.sendRedirect("WelcomePage.jsp");
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

}
