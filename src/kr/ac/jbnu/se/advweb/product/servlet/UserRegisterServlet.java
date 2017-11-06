package kr.ac.jbnu.se.advweb.product.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.jbnu.se.advweb.product.model.UserAccount;
import kr.ac.jbnu.se.advweb.product.utils.DBUtils;
import kr.ac.jbnu.se.advweb.product.utils.MyUtils;

@WebServlet("/user_register")
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserRegisterServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Forward to /WEB-INF/views/homeView.jsp
		// (Users can not access directly into JSP pages placed in WEB-INF)
		RequestDispatcher dispatcher = this.getServletContext()
				.getRequestDispatcher("/WEB-INF/views/userRegisterView.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection conn = MyUtils.getStoredConnection(request);

		String errorString = null;

		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String major = request.getParameter("major");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		if (id.equals("") || name.equals("") || major.equals("") || email.equals("") || password.equals("")) {
			errorString = "회원 가입 요청 중 누락된 정보가 있습니다.";
		}
		UserAccount user = new UserAccount();
//-----------------------		
		try {
			if(DBUtils.isBlockedUser(conn, email)) {
				errorString = "정지당한 계정입니다.";
				response.setStatus(response.SC_FORBIDDEN);
				return;
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
//		System.out.println(user.getBlocked());
//		if (user.getBlocked() != null) {
//			errorString = "당신의 계정은 정지당했습니다.";
//		}
//--------------------------------		
		user.setId(id);
		user.setUserName(name);
		user.setMajor(major);
		user.setEmail(email);
		user.setPassword(password);

		if (errorString == null) {
			try {
				DBUtils.addUserAccount(conn, user);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

}