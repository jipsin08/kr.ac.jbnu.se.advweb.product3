package kr.ac.jbnu.se.advweb.product.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
			
			UserAccount user = new UserAccount();
			user.setId(id);
			user.setMajor(major);
			user.setUserName(name);
			user.setEmail(userEmail);
			user.setPassword(password);
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
		String sql = "Select a.Code, a.Name, a.Price, a.Brand, a.CPU, a.GraphicCard, a.Description from Product a where a.Code=?";

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
			Product product = new Product(code, name, price, brand, cpu, graphicCard, description);
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
}