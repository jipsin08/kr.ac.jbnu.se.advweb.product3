package kr.ac.jbnu.se.advweb.product.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.ac.jbnu.se.advweb.product.model.Board;
import kr.ac.jbnu.se.advweb.product.model.Comment;
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
			if (rs.getString("IS_Admin") == null || rs.getString("IS_Admin").isEmpty()) {
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
			// String gender = rs.getString("Gender");

			UserAccount user = new UserAccount();
			user.setId(id);
			user.setMajor(major);
			user.setUserName(userName);
			user.setPassword(password);
			user.setEmail(email);
			// user.setGender(gender);
			return user;
		}
		return null;
	}

	public static boolean isBlockedUser(Connection conn, String userEmail) throws SQLException {

		String sql = "Select * from user_account where user_email = ?";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, userEmail);
		ResultSet rs = pstm.executeQuery();

		if (rs.next()) {
			if (rs.getString("Is_Blocked") == null || rs.getString("Is_Blocked").isEmpty()) {
				return false;
			} else {
				return true;
			}
		}
		
		return false;
	}

	public static void blockUserAccount(Connection conn, String userId) throws SQLException {
		String sql = "Update user_account set Is_Blocked=? where user_id=? ";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, "Y");
		pstm.setString(2, userId);
		pstm.executeUpdate();
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

			// 1개만..
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

	public static List<Comment> findCommentById(Connection conn, String board_id) throws SQLException {
		String sql = "Select * from comment where board_id=?";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, board_id);

		ResultSet rs = pstm.executeQuery();
		List<Comment> list = new ArrayList<>();

		while (rs.next()) {
			String id = rs.getString("comment_id");
			String author = rs.getString("comment_author");
			String date = rs.getString("comment_date");
			String contents = rs.getString("comment_contents");
			String boardId = rs.getString("board_id");

			Comment comment = new Comment();
			comment.setId(id);
			comment.setAuthor(author);
			comment.setDate(date);
			comment.setContents(contents);
			comment.setBoard_id(boardId);

			list.add(comment);
		}

		return list;
	}

	public static void addComment(Connection conn, Comment comment) throws SQLException {
		String sql = "INSERT INTO comment(comment_author, comment_date, comment_contents, board_id)"
				+ "VALUES (?,?,?,?)";

		PreparedStatement pstm = conn.prepareStatement(sql);

		pstm.setString(1, comment.getAuthor());
		pstm.setString(2, comment.getDate());
		pstm.setString(3, comment.getContents());
		pstm.setString(4, comment.getBoard_id());

		pstm.executeUpdate();
	}

	public static List<Product> queryProduct(Connection conn) throws SQLException {
		String sql = "Select * from Product";

		PreparedStatement pstm = conn.prepareStatement(sql);

		ResultSet rs = pstm.executeQuery();
		List<Product> list = new ArrayList<Product>();
		while (rs.next()) {
			String code = rs.getString("Code");
			String name = rs.getString("Name");
			String price = rs.getString("Price");
			String brand = rs.getString("Brand");
			String cpu = rs.getString("Cpu");
			String graphicCard = rs.getString("GraphicCard");
			String description = rs.getString("Description");
			String image = rs.getString("image");

			Product product = new Product();
			product.setCode(code);
			product.setName(name);
			product.setPrice(price);
			product.setBrand(brand);
			product.setCpu(cpu);
			product.setGraphicCard(graphicCard);
			product.setDescription(description);
			product.setImage(image);

			list.add(product);
		}
		return list;
	}
	
	public static List<Product> querySearchedProduct(Connection conn, String keyword) throws SQLException {
		String sql = "Select * from Product a where a.Name like '%" + keyword + "%'";

		PreparedStatement pstm = conn.prepareStatement(sql);
//		pstm.setString(1, keyword);

		ResultSet rs = pstm.executeQuery();

		List<Product> list = new ArrayList<Product>();
		while (rs.next()) {
			String code = rs.getString("Code");
			String name = rs.getString("Name");
			String price = rs.getString("Price");
			String brand = rs.getString("Brand");
			String cpu = rs.getString("Cpu");
			String graphicCard = rs.getString("GraphicCard");
			String description = rs.getString("Description");
			String image = rs.getString("image");
			
			Product product = new Product();
			product.setCode(code);
			product.setName(name);
			product.setPrice(price);
			product.setBrand(brand);
			product.setCpu(cpu);
			product.setGraphicCard(graphicCard);
			product.setDescription(description);
			product.setImage(image);
			
			list.add(product);
		}
		return list;
	}
	
	public static List<Product> queryPriceSearchedProduct(Connection conn, String minprice, String maxprice) throws SQLException {
		String sql = "Select * from Product a where a.Price >= " + minprice + " and a.Price <=" + maxprice;

		PreparedStatement pstm = conn.prepareStatement(sql);

		ResultSet rs = pstm.executeQuery();

		List<Product> list = new ArrayList<Product>();
		while (rs.next()) {
			String code = rs.getString("Code");
			String name = rs.getString("Name");
			String price = rs.getString("Price");
			String brand = rs.getString("Brand");
			String cpu = rs.getString("Cpu");
			String graphicCard = rs.getString("GraphicCard");
			String description = rs.getString("Description");
			String image = rs.getString("image");
			
			Product product = new Product();
			product.setCode(code);
			product.setName(name);
			product.setPrice(price);
			product.setBrand(brand);
			product.setCpu(cpu);
			product.setGraphicCard(graphicCard);
			product.setDescription(description);
			product.setImage(image);
			
			list.add(product);
		}
		return list;
	}
	
	public static List<Product> queryBrandSearchedProduct(Connection conn, String _brand) throws SQLException {
		String sql = null;
		if(_brand.equals("others")) {
			sql = "Select * from Product a where a.Brand<>'samsung' and a.Brand<>'dell' and a.Brand<>'lg' and a.Brand<>'asus'";
		} else {
			sql = "Select * from Product a where a.Brand='" + _brand + "'";
		}
		PreparedStatement pstm = conn.prepareStatement(sql);

		ResultSet rs = pstm.executeQuery();

		List<Product> list = new ArrayList<Product>();
		while (rs.next()) {
			String code = rs.getString("Code");
			String name = rs.getString("Name");
			String price = rs.getString("Price");
			String brand = rs.getString("Brand");
			String cpu = rs.getString("Cpu");
			String graphicCard = rs.getString("GraphicCard");
			String description = rs.getString("Description");
			String image = rs.getString("image");
			
			Product product = new Product();
			product.setCode(code);
			product.setName(name);
			product.setPrice(price);
			product.setBrand(brand);
			product.setCpu(cpu);
			product.setGraphicCard(graphicCard);
			product.setDescription(description);
			product.setImage(image);
			
			list.add(product);
		}
		return list;
	}
	
	public static List<Product> queryCpuSearchedProduct(Connection conn, String _cpu) throws SQLException {
		String sql = null;
		if(_cpu.equals("others")) {
			sql = "Select * from Product a where a.Cpu not like '%i3%' and a.Cpu not like '%i5%' and a.Cpu not like '%i7%'";
		} else {
			sql = "Select * from Product a where a.Cpu like '%" + _cpu + "%'";
		}
		PreparedStatement pstm = conn.prepareStatement(sql);

		ResultSet rs = pstm.executeQuery();

		List<Product> list = new ArrayList<Product>();
		while (rs.next()) {
			String code = rs.getString("Code");
			String name = rs.getString("Name");
			String price = rs.getString("Price");
			String brand = rs.getString("Brand");
			String cpu = rs.getString("Cpu");
			String graphicCard = rs.getString("GraphicCard");
			String description = rs.getString("Description");
			String image = rs.getString("image");
			
			Product product = new Product();
			product.setCode(code);
			product.setName(name);
			product.setPrice(price);
			product.setBrand(brand);
			product.setCpu(cpu);
			product.setGraphicCard(graphicCard);
			product.setDescription(description);
			product.setImage(image);
			
			list.add(product);
		}
		return list;
	}
	
	public static List<Product> queryGraphicSearchedProduct(Connection conn, String graphic) throws SQLException {
		String sql = null;
		
		if(graphic.equals("amd")) {
			sql = "Select * from Product a where a.GraphicCard like '%라데온%'";
		}
		if(graphic.equals("엔비디아")) {
			sql = "Select * from Product a where a.GraphicCard like '%지포스%'";
		}
		if(graphic.equals("인텔")) {
			sql = "Select * from Product a where a.GraphicCard like '%HD%'";
		}
		
		PreparedStatement pstm = conn.prepareStatement(sql);
		ResultSet rs = pstm.executeQuery();
		List<Product> list = new ArrayList<Product>();
		while (rs.next()) {
			String code = rs.getString("Code");
			String name = rs.getString("Name");
			String price = rs.getString("Price");
			String brand = rs.getString("Brand");
			String cpu = rs.getString("Cpu");
			String graphicCard = rs.getString("GraphicCard");
			String description = rs.getString("Description");
			String image = rs.getString("image");
			
			Product product = new Product();
			product.setCode(code);
			product.setName(name);
			product.setPrice(price);
			product.setBrand(brand);
			product.setCpu(cpu);
			product.setGraphicCard(graphicCard);
			product.setDescription(description);
			product.setImage(image);
			
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

		System.out.println(code);
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
		String sql = "Select a.Code, a.Name, a.Price, a.Brand, a.CPU, a.GraphicCard, a.Description, a.Image from Product a where a.Code=?";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, code);

		ResultSet rs = pstm.executeQuery();

		while (rs.next()) {
			String name = rs.getString("Name");
			String price = rs.getString("Price");
			String brand = rs.getString("Brand");
			String cpu = rs.getString("CPU");
			String graphicCard = rs.getString("GraphicCard");
			String description = rs.getString("Description");
			String image = rs.getString("Image");
			Product product = new Product(code, name, price, brand, cpu, graphicCard, description, image);
			return product;
		}
		return null;
	}

	public static void updateProduct(Connection conn, Product product) throws SQLException {
		String sql = "Update Product set Name =?, Price=?, Brand=?, CPU=?, GraphicCard=?, Description=? where Code=? ";

		PreparedStatement pstm = conn.prepareStatement(sql);

		pstm.setString(1, product.getName());
		pstm.setString(2, product.getPrice());
		pstm.setString(3, product.getBrand());
		pstm.setString(4, product.getCpu());
		pstm.setString(5, product.getGraphicCard());
		pstm.setString(6, product.getDescription());
		pstm.executeUpdate();
	}

	public static void insertProduct(Connection conn, Product product) throws SQLException {
		String sql = "Insert into Product(Name, Price, Brand, Cpu, GraphicCard, Description, Image) values (?,?,?,?,?,?,?)";

		PreparedStatement pstm = conn.prepareStatement(sql);

		pstm.setString(1, product.getName());
		pstm.setString(2, product.getPrice());
		pstm.setString(3, product.getBrand());
		pstm.setString(4, product.getCpu());
		pstm.setString(5, product.getGraphicCard());
		pstm.setString(6, product.getDescription());
		pstm.setString(7, product.getImage());

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
		String sql = "INSERT INTO board (board_title, board_author, board_date, board_contents)" + "VALUES (?,?,?,?)";

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
			String email = rs.getString("user_email");

			boolean isAdmin;

			if (rs.getString("Is_Admin") == null || rs.getString("Is_Admin").isEmpty()) {
				isAdmin = false;
			} else {
				isAdmin = true;
			}

			String isBlocked;

			if (rs.getString("Is_Blocked") == null || rs.getString("Is_Blocked").isEmpty()) {
				isBlocked = "";
			} else {
				isBlocked = "Y";
			}

			UserAccount user = new UserAccount();
			user.setId(id);
			user.setMajor(major);
			user.setUserName(name);
			user.setEmail(email);
			user.setBlocked(isBlocked);
			user.setAdmin(isAdmin);

			if (user.isAdmin()) {
				continue;
			}

			list.add(user);
		}
		return list;
	}

	public static boolean checkUserAccount(Connection conn, String userid) throws SQLException {
		String sql = "Select * from user_account where user_id=?";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, userid);

		ResultSet rs = pstm.executeQuery();

		if (rs.next())
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