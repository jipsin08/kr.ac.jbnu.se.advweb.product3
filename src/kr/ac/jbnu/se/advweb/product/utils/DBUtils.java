package kr.ac.jbnu.se.advweb.product.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.ac.jbnu.se.advweb.product.model.Board;
import kr.ac.jbnu.se.advweb.product.model.Product;
import kr.ac.jbnu.se.advweb.product.model.UserAccount;

public class DBUtils {

	// Difference Between executeQuery() Vs executeUpdate() Vs execute() In JDBC
	// http://javaconceptoftheday.com/difference-between-executequery-executeupdate-execute-in-jdbc/

	public static UserAccount findUser(Connection conn, //
			String userEmail, String password) throws SQLException {

		String sql = "Select * from user_account a where a.user_email = ? and a.user_password = ?";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, userEmail);
		pstm.setString(2, password);
		ResultSet rs = pstm.executeQuery();

		if (rs.next()) {
			// String gender = rs.getString("Gender");
			String id = rs.getString("user_id");
			String major = rs.getString("user_major");
			String name = rs.getString("user_name");

			boolean isAdmin;
			if(rs.getString("IS_Admin") == null) {
				isAdmin = false;
			} else {
				isAdmin = true;
			}
			
			UserAccount user = new UserAccount();
			user.setId(id);
			user.setMajor(major);
			user.setUserName(name);
			user.setEmail(userEmail);
			user.setPassword(password);
			user.setAdmin(isAdmin);
			// user.setGender(gender);
			return user;
		}
		return null;
	}

	public static UserAccount findUser(Connection conn, String userName) throws SQLException {

		String sql = "Select * from user_account a where a.user_name = ? ";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, userName);

		ResultSet rs = pstm.executeQuery();

		if (rs.next()) {
			String id = rs.getString("user_id");
			String major = rs.getString("user_major");
			String name = rs.getString("user_name");
			String password = rs.getString("user_password");
			String email = rs.getString("user_email");
//			String gender = rs.getString("Gender");
			
			UserAccount user = new UserAccount();
			user.setId(id);
			user.setMajor(major);
			user.setUserName(userName);
			user.setPassword(password);
			user.setEmail(email);
//			user.setGender(gender);
			return user;
		}
		return null;
	}
	
	public static List<Board> queryBoard(Connection conn) throws SQLException {
		String sql = "Select * from board";

		PreparedStatement pstm = conn.prepareStatement(sql);

		ResultSet rs = pstm.executeQuery();
		List<Board> list = new ArrayList<Board>();
		
		while (rs.next()) {
			String id = rs.getString("board_id"); 
			String title = rs.getString("board_title");
			String author = rs.getString("board_author");
			String date = rs.getString("board_date");
			String hits = rs.getString("board_hits");
			String contents = rs.getString("board_contents");
			
			Board board = new Board();
			board.setId(id);
			board.setTitle(title);
			board.setAuthor(author);
			board.setDate(date);
			board.setHits(hits);
			board.setContents(contents);
			
			list.add(board);
		}
		return list;
	}
	
	public static Board findBoardById(Connection conn, String board_id) throws SQLException {
		String sql = "Select * from board where board_id=?";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, board_id);

		ResultSet rs = pstm.executeQuery();
		Board board = new Board();
		
		while (rs.next()) {
			String id = rs.getString("board_id"); 
			String title = rs.getString("board_title");
			String author = rs.getString("board_author");
			String date = rs.getString("board_date");
			String hits = rs.getString("board_hits");
			String contents = rs.getString("board_contents");
			
			board.setId(id);
			board.setTitle(title);
			board.setAuthor(author);
			board.setDate(date);
			board.setHits(hits);
			board.setContents(contents);
			
			//1개만..
			break;
		}
		return board;
	}
	
	public static void updateBoardHits(Connection conn, Board board) throws SQLException {
		String sql = "Update board set board_hits=? where board_id=? ";

		PreparedStatement pstm = conn.prepareStatement(sql);
		int hit = Integer.parseInt(board.getHits()) + 1;
		
		pstm.setString(1, String.valueOf(hit));
		pstm.setString(2, board.getId());
		pstm.executeUpdate();
	}


	public static List<Product> queryProduct(Connection conn) throws SQLException {
		String sql = "Select a.Code, a.Name, a.Price from Product a ";

		PreparedStatement pstm = conn.prepareStatement(sql);

		ResultSet rs = pstm.executeQuery();
		List<Product> list = new ArrayList<Product>();
		while (rs.next()) {
			String code = rs.getString("Code");
			String name = rs.getString("Name");
			float price = rs.getFloat("Price");
			Product product = new Product();
			product.setCode(code);
			product.setName(name);
			product.setPrice(price);
			list.add(product);
		}
		return list;
	}

	public static List<Product> queryCart(Connection conn, String userid) throws SQLException {
		String sql = "Select cart_item from cart where cart_user='" + userid + "'";

		PreparedStatement pstm = conn.prepareStatement(sql);

		ResultSet rs = pstm.executeQuery();
		List<Product> list = new ArrayList<Product>();
		while (rs.next()) {
			Product product;
			product = findProduct(conn, rs.getString("cart_item"));
			list.add(product);
		}

		return list;
	}

	public static void insertCart(Connection conn, String userid, String code) throws SQLException {
		String sql = "select * from cart where cart_user=? and cart_item=?";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, userid);
		pstm.setString(2, code);

		ResultSet rs = pstm.executeQuery();

		if (!rs.next()) {
			sql = "Insert into cart(cart_user, cart_item) values (?,?)";

			pstm = conn.prepareStatement(sql);

			pstm.setString(1, userid);
			pstm.setString(2, code);

			pstm.executeUpdate();
		}
	}

	public static void deleteCart(Connection conn, String userName, String code) throws SQLException {
		String sql = "Delete From cart where cart_user= ? and cart_item= ?";

		PreparedStatement pstm = conn.prepareStatement(sql);

		pstm.setString(1, userName);
		pstm.setString(2, code);

		pstm.executeUpdate();
	}

	public static Product findProduct(Connection conn, String code) throws SQLException {
		String sql = "Select a.Code, a.Name, a.Price from Product a where a.Code=?";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, code);

		ResultSet rs = pstm.executeQuery();

		while (rs.next()) {
			String name = rs.getString("Name");
			float price = rs.getFloat("Price");
			Product product = new Product(code, name, price);
			return product;
		}
		return null;
	}

	public static void updateProduct(Connection conn, Product product) throws SQLException {
		String sql = "Update Product set Name =?, Price=? where Code=? ";

		PreparedStatement pstm = conn.prepareStatement(sql);

		pstm.setString(1, product.getName());
		pstm.setFloat(2, product.getPrice());
		pstm.setString(3, product.getCode());
		pstm.executeUpdate();
	}

	public static void insertProduct(Connection conn, Product product) throws SQLException {
		String sql = "Insert into Product(Code, Name,Price) values (?,?,?)";

		PreparedStatement pstm = conn.prepareStatement(sql);

		pstm.setString(1, product.getCode());
		pstm.setString(2, product.getName());
		pstm.setFloat(3, product.getPrice());

		pstm.executeUpdate();
	}

	public static void deleteProduct(Connection conn, String code) throws SQLException {
		String sql = "Delete From Product where Code= ?";

		PreparedStatement pstm = conn.prepareStatement(sql);

		pstm.setString(1, code);

		pstm.executeUpdate();
	}

	public static void addUserAccount(Connection conn, UserAccount user) throws SQLException {
		String sql = "INSERT INTO user_account(user_id, user_major, user_name, user_email, user_password) VALUES(?,?,?,?,?)";

		PreparedStatement pstm = conn.prepareStatement(sql);

		pstm.setString(1, user.getId());
		pstm.setString(2, user.getMajor());
		pstm.setString(3, user.getUserName());
		pstm.setString(4, user.getEmail());
		pstm.setString(5, user.getPassword());

		pstm.executeUpdate();
	}
	
	public static void addBoard(Connection conn, Board board) throws SQLException {
		String sql = "INSERT INTO board (board_title, board_author, board_date, board_contents)" +
				"VALUES (?,?,?,?)";
		
		PreparedStatement pstm = conn.prepareStatement(sql);

		pstm.setString(1, board.getTitle());
		pstm.setString(2, board.getAuthor());
		pstm.setString(3, board.getDate());
		pstm.setString(4, board.getContents());

		pstm.executeUpdate();
}
	public static List<UserAccount> queryUserAccount(Connection conn) throws SQLException {
		String sql = "Select * from user_account";

		PreparedStatement pstm = conn.prepareStatement(sql);

		ResultSet rs = pstm.executeQuery();
		List<UserAccount> list = new ArrayList<UserAccount>();
		while (rs.next()) {
			String id = rs.getString("user_id");
			String major = rs.getString("user_major");
			String name = rs.getString("user_name");
			String email= rs.getString("user_email");
			UserAccount user = new UserAccount();
			user.setId(id);
			user.setMajor(major);
			user.setUserName(name);
			user.setEmail(email);
			list.add(user);
		}
		return list;
	}

	public static boolean checkUserAccount(Connection conn, String userid) throws SQLException {
		String sql = "Select * from user_account where user_id=?";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, userid);

		ResultSet rs = pstm.executeQuery();

		if(rs.next())
			return true;
		else
			return false;
	}
	
	public static void updateUserAccount(Connection conn, UserAccount userAccount) throws SQLException {
		String sql = "Update user_account set user_major=?, user_name=?, user_password=? where user_id=? ";

		PreparedStatement pstm = conn.prepareStatement(sql);

		pstm.setString(1, userAccount.getMajor());
		pstm.setString(2, userAccount.getUserName());
		pstm.setString(3, userAccount.getPassword());
		pstm.setString(4, userAccount.getId());
		pstm.executeUpdate();
	}
}