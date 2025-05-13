package BusReservation2;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/LoginPage")
public class LoginPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		LoginDao logindao = new LoginDao();
		try {
			if(logindao.checkLogin(username, password)) {
				HttpSession session = request.getSession();
				session.setAttribute("username", username);
				session.setAttribute("password", password);
				response.sendRedirect("WelcomePage.jsp");
			}
			else {
				response.getWriter().println("<h2>Your login is failed</h2>");
				response.sendRedirect("LoginPage.html");
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
	}


}
