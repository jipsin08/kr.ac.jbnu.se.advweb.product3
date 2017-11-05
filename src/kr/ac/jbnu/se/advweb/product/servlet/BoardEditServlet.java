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
import javax.servlet.http.HttpSession;

import kr.ac.jbnu.se.advweb.product.model.Board;
import kr.ac.jbnu.se.advweb.product.model.UserAccount;
import kr.ac.jbnu.se.advweb.product.utils.DBUtils;
import kr.ac.jbnu.se.advweb.product.utils.MyUtils;

/**
 * Servlet implementation class BoardEditServlet
 */
@WebServlet("/board_edit")
public class BoardEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardEditServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		UserAccount loginedUser = MyUtils.getLoginedUser(session);
		
		if(loginedUser == null) {
			response.sendRedirect(request.getContextPath() + "/user_register");
			return;
		}
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/boardEditView.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection conn = MyUtils.getStoredConnection(request);
		
		String errorString = null;

		//세션에서 내 이름을 가져와 글쓴이로 활용.
		HttpSession session = request.getSession();
		UserAccount myInfo = MyUtils.getLoginedUser(session);
		
		if(myInfo == null) {
			errorString = "세션에서 사용자 정보를 불러오지 못했습니다.";
			response.setStatus(response.SC_NOT_FOUND);
			System.out.println(errorString);
			return;
		}
		
		String title = request.getParameter("title");
		String date = request.getParameter("date");
		String contents = request.getParameter("contents");
		String author = myInfo.getUserName();
		
		if(title == null || date == null || contents == null || author == null) {
			errorString = "null인 정보가 있습니다.";
			response.setStatus(response.SC_BAD_REQUEST);
			System.out.println(errorString);
			return;
		}
		
		Board board = new Board();
		board.setTitle(title);
		board.setDate(date);
		board.setContents(contents);
		board.setAuthor(author);
		
		try {
			DBUtils.addBoard(conn, board);
		} catch (SQLException e) {
			e.printStackTrace();
			errorString = "DB 저장 실패!!";
			response.setStatus(response.SC_NOT_FOUND);
			System.out.println(errorString);
			return;
		}
		
	}

}
