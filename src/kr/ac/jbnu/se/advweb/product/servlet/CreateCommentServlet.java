package kr.ac.jbnu.se.advweb.product.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.jbnu.se.advweb.product.model.Comment;
import kr.ac.jbnu.se.advweb.product.model.UserAccount;
import kr.ac.jbnu.se.advweb.product.utils.DBUtils;
import kr.ac.jbnu.se.advweb.product.utils.MyUtils;

/**
 * Servlet implementation class CreateCommentServlet
 */
@WebServlet("/create_comment")
public class CreateCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = MyUtils.getStoredConnection(request);
		
		HttpSession session = request.getSession();
		UserAccount loginedUser = MyUtils.getLoginedUser(session);

		String errorString = null;
		
		if(loginedUser == null) {
			errorString = "댓글을 남기려면 로그인하세요.";
			System.out.println(errorString);
			response.setStatus(response.SC_NOT_FOUND);
//			response.sendRedirect(request.getContextPath() + "/user_register");
			return;
		}
		
		String date = request.getParameter("date");
		String contents = request.getParameter("contents");
		String board_id = request.getParameter("board_id");
		String author = loginedUser.getUserName();
		
		Comment comment = new Comment();
		comment.setAuthor(author);
		comment.setDate(date);
		comment.setBoard_id(board_id);
		comment.setContents(contents);
		
		try {
			DBUtils.addComment(conn, comment);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			errorString = "DB에 댓글 정보를 넘기지 못했습니다.";
			e.printStackTrace();
		}
		
//		doGet(request, response);
	}

}
