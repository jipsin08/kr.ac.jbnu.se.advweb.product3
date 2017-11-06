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

import kr.ac.jbnu.se.advweb.product.model.Product;
import kr.ac.jbnu.se.advweb.product.utils.DBUtils;
import kr.ac.jbnu.se.advweb.product.utils.MyUtils;

@WebServlet(urlPatterns = { "/home" })
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HomeServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Connection conn = MyUtils.getStoredConnection(request);
		
		String keyword = null;
		String minprice = null;
		String maxprice = null;
		String brand = null;
		String cpu = null;
		String graphic = null;

		if (request.getParameterMap().containsKey("keyword")) {
            keyword = request.getParameter("keyword");
        }
		if(request.getParameterMap().containsKey("minprice")) {
        	minprice = request.getParameter("minprice");
        }
		if(request.getParameterMap().containsKey("maxprice")) {
        	maxprice = request.getParameter("maxprice");
        }
		if(request.getParameterMap().containsKey("brand")) {
        	brand = request.getParameter("brand");
        }
		if(request.getParameterMap().containsKey("cpu")) {
        	cpu = request.getParameter("cpu");
        }
		if(request.getParameterMap().containsKey("graphic")) {
        	graphic = request.getParameter("graphic");
        }

		String errorString = null;
		List<Product> list = null;
		try {
			if(keyword != null)
				list = DBUtils.querySearchedProduct(conn, keyword);
			else if(minprice != null)
				list = DBUtils.queryPriceSearchedProduct(conn, minprice, maxprice);
			else if(brand != null)
				list = DBUtils.queryBrandSearchedProduct(conn, brand);
			else if(cpu != null)
				list = DBUtils.queryCpuSearchedProduct(conn, cpu);
			else if(graphic != null)
				list = DBUtils.queryGraphicSearchedProduct(conn, graphic);
			else
				list = DBUtils.queryProduct(conn);
		} catch (SQLException e) {
			e.printStackTrace();
			errorString = e.getMessage();
		}
		
		request.setAttribute("errorString", errorString);
		request.setAttribute("productList", list);
		
		// Forward to /WEB-INF/views/homeView.jsp
		// (Users can not access directly into JSP pages placed in WEB-INF)
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/homeView.jsp");
		dispatcher.forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}