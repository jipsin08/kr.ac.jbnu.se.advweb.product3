package kr.ac.jbnu.se.advweb.product.servlet;

import java.io.File;
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

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import kr.ac.jbnu.se.advweb.product.model.Product;
import kr.ac.jbnu.se.advweb.product.utils.DBUtils;
import kr.ac.jbnu.se.advweb.product.utils.MyUtils;

@WebServlet(urlPatterns = { "/createProduct" })

public class CreateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String UPLOAD_DIRECTORY = "C:\\Users\\user\\workspace\\kr.ac.jbnu.se.advweb.product3\\WebContent\\resources\\img";

	public CreateProductServlet() {
		super();
	}

	// Show product creation page.
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher = request.getServletContext()
				.getRequestDispatcher("/WEB-INF/views/createProductView.jsp");
		dispatcher.forward(request, response);
	}

	// When the user enters the product information, and click Submit.
	// This method will be called.
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection conn = MyUtils.getStoredConnection(request);
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);

		String p_name = null;
		String price = null;
		String brand = null;
		String cpu = null;
		String graphicCard = null;
		String description = null;
		String image = null;

		// process only if its multipart content
		if (isMultipart) {
			// Create a factory for disk-based file items
			FileItemFactory factory = new DiskFileItemFactory();
			// Create a new file upload handler
			ServletFileUpload upload = new ServletFileUpload(factory);
			try {
				// Parse the request
				List<FileItem> multiparts = upload.parseRequest(request);
				for (FileItem item : multiparts) {
					if (!item.isFormField()) {
						String name = new File(item.getName()).getName();
						item.write(new File(UPLOAD_DIRECTORY + File.separator + name));
						image = UPLOAD_DIRECTORY + File.separator + name;
					} else {
						String fieldName = item.getFieldName();
						String fieldValue = item.getString();

						if (fieldName.equals("name")) {
							p_name = fieldValue;
						}
						else if (fieldName.equals("price")) {
							price = fieldValue;
						}
						else if (fieldName.equals("brand")) {	
							brand = fieldValue;
						}
						else if (fieldName.equals("cpu")) {
							cpu = fieldValue;
						}
						else if (fieldName.equals("graphiccard")) {
							graphicCard = fieldValue;
						}
						else if (fieldName.equals("description")) {
							description = fieldValue;
						}
					}
				}
				// File uploaded successfully
				request.setAttribute("message", "Your file has been uploaded!");
			} catch (Exception e) {
				request.setAttribute("message", "File Upload Failed due to " + e);
			}
		} else {
			request.setAttribute("message", "This Servlet only handles file upload request");
		}

		Product product = new Product(p_name, price, brand, cpu, graphicCard, description, image);

		String errorString = null;

		// Product ID is the string literal [a-zA-Z_0-9]
		// with at least 1 character
		String regex = "\\w+";
		//
		// if (code == null || !code.matches(regex)) {
		// System.out.println("!!");
		// errorString = "Product Code invalid!";
		// }

		if (errorString == null) {
			try {
				DBUtils.insertProduct(conn, product);
			} catch (SQLException e) {
				e.printStackTrace();
				errorString = e.getMessage();
			}
		}
		
		RequestDispatcher dispatcher //
			= this.getServletContext().getRequestDispatcher("/WEB-INF/views/createProductView.jsp");

		dispatcher.forward(request, response);

		// Store infomation to request attribute, before forward to views.
//		request.setAttribute("errorString", errorString);
//		request.setAttribute("product", product);

		// If error, forward to Edit page.
//		if (errorString != null) {
//			RequestDispatcher dispatcher = request.getServletContext()
//					.getRequestDispatcher("/WEB-INF/views/createProductView.jsp");
//			dispatcher.forward(request, response);
//		}
//		// If everything nice.
//		// Redirect to the product listing page.
//		else {
//			response.sendRedirect(request.getContextPath() + "/productList");
//		}
	}

}
