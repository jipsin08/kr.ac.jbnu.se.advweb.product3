package kr.ac.jbnu.se.advweb.product.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.jbnu.se.advweb.product.model.Board;
import kr.ac.jbnu.se.advweb.product.model.Product;
import kr.ac.jbnu.se.advweb.product.utils.DBUtils;
import kr.ac.jbnu.se.advweb.product.utils.MyUtils;

/**
 * Servlet implementation class BoardServlet
 */
@WebServlet("/board")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection conn = MyUtils.getStoredConnection(request);

		String errorString = null;
		List<Board> list = null;
		
		try {
			list = DBUtils.queryBoard(conn);
		} catch (SQLException e) {
			e.printStackTrace();
			errorString = e.getMessage();
		}
		// Store info in request attribute, before forward to views
		request.setAttribute("errorString", errorString);
		request.setAttribute("boardList", list);

		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/boardView.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
