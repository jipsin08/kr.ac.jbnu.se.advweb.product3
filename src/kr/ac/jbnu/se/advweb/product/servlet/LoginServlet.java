package kr.ac.jbnu.se.advweb.product.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.jbnu.se.advweb.product.model.UserAccount;
import kr.ac.jbnu.se.advweb.product.utils.DBUtils;
import kr.ac.jbnu.se.advweb.product.utils.MyUtils;

@WebServlet(urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	// Show Login page.
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		UserAccount loginedUser = MyUtils.getLoginedUser(session);
		
		response.setContentType("text/plain");
		
		// Not logged in
		if (loginedUser == null) {
//			System.out.println("세션없지롱");
			// Redirect to login page.
//			response.sendRedirect(request.getContextPath() + "/user_register");
//			response.sendRedirect("http://www.naver.com");
			response.getWriter().write("not logged in");
			return;
		}
		
//		System.out.println("세션있지롱");
		response.getWriter().write("logged in");
		
		return;
		// Forward to /WEB-INF/views/loginView.jsp
		// (Users can not access directly into JSP pages placed in WEB-INF)
//		RequestDispatcher dispatcher //
//				= this.getServletContext().getRequestDispatcher("/WEB-INF/views/loginView.jsp");
//
//		dispatcher.forward(request, response);

	}

	// When the user enters userName & password, and click Submit.
	// This method will be executed.
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
//		notFoundHandler(response);
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String rememberMeStr = request.getParameter("rememberMe");
		boolean remember = "Y".equals(rememberMeStr);
		
		UserAccount user = null;
		boolean hasError = false;
		String errorString = null;

		if (email == null || password == null || email.length() == 0 || password.length() == 0) {
			hasError = true;
			errorString = "Required username and password!";
		} else {
			Connection conn = MyUtils.getStoredConnection(request);
			
			try {
				//블락당한 계정인지 확인
				if(DBUtils.isBlockedUser(conn, email)) {
					errorString = "정지당한 계정입니다.";
					response.setContentType("text/plain");
					response.getWriter().write("isBlocked");
					System.out.println("??");
//					response.sendRedirect(request.getContextPath() + "/home");
					return;
				}
				
				// Find the user in the DB.
				user = DBUtils.findUser(conn, email, password);

				if (user == null) {
					hasError = true;
					errorString = "User Name or password invalid";
				}
			} catch (SQLException e) {
				e.printStackTrace();
				hasError = true;
				errorString = e.getMessage();
			}
		}
		// If error, forward to /WEB-INF/views/login.jsp
		if (hasError) {
			System.out.println("??????");
			System.out.println(errorString);
			//
//			user = new UserAccount();
//			user.setUserName(email);
//			user.setPassword(password);
//
//			// Store information in request attribute, before forward.
//			request.setAttribute("errorString", errorString);
//			request.setAttribute("user", user);
//
			// Forward to /WEB-INF/views/login.jsp
//			RequestDispatcher dispatcher //
//					= this.getServletContext().getRequestDispatcher("/WEB-INF/views/loginView.jsp");
//
//			dispatcher.forward(request, response);
			notFoundHandler(response);
		}
		// If no error
		// Store user information in Session
		// And redirect to userInfo page.
		else {
			System.out.println("로그인 성공");
			HttpSession session = request.getSession();
			MyUtils.storeLoginedUser(session, user);
			
			// If user checked "Remember me".
			if (remember) {
				MyUtils.storeUserCookie(response, user);
			}
			// Else delete cookie.
			else {
				MyUtils.deleteUserCookie(response);
			}
			
			response.setContentType("text/plain");

			if(user.isAdmin()) {
				response.getWriter().write("isAdmin");
//				response.sendRedirect(request.getContextPath() + "/admin_home");
				//가고싶은 페이지로 Redirect 하면 됨
				return;
			} else {
//				response.sendRedirect(request.getContextPath() + "/home");
				response.getWriter().write("isNotAdmin");
				return;
			}

			// Redirect to userInfo page.
//			RequestDispatcher dispatcher 
//			= this.getServletContext().getRequestDispatcher("/WEB-INF/views/loginView.jsp");
////
		}
	}

	private void notFoundHandler(HttpServletResponse response) throws IOException {
		response.setStatus(response.SC_NOT_FOUND);
		response.setContentType("text/plain;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("못찾겠당");
	}

}