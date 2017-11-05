<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="robots" content="all,follow">
<meta name="googlebot" content="index,follow,snippet,archive">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Obaju e-commerce template">
<meta name="author" content="Ondrej Svestka | ondrejsvestka.cz">
<meta name="keywords" content="">

<title>쏘공나와</title>

<meta name="keywords" content="">

<link href='http://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100' rel='stylesheet' type='text/css'>

<!-- styles -->
<link href="resources/css/font-awesome.css" rel="stylesheet">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/animate.min.css" rel="stylesheet">
<link href="resources/css/owl.carousel.css" rel="stylesheet">
<link href="resources/css/owl.theme.css" rel="stylesheet">

<!-- theme stylesheet -->
<link href="resources/css/style.blue.css" rel="stylesheet" id="theme-stylesheet">

<!-- your stylesheet with modifications -->
<link href="resources/css/custom.css" rel="stylesheet">

<script src="resources/js/respond.min.js"></script>

<link rel="shortcut icon" href="favicon.png">
</head>
<body>
	<jsp:include page="_top.jsp"></jsp:include>
	<jsp:include page="_navbar.jsp"></jsp:include>


	<div id="all">

		<div id="content">
			<div class="container">

				<div class="col-md-12">

					<ul class="breadcrumb">
						<li><a href="#">게시판</a></li>
					</ul>

					<div class="row" id="error-page">
						<div class="col-md-12">
							<div class="box">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>번호</th>
											<th>제목</th>
											<th>작성자</th>
											<th>날짜</th>
											<th>조회수</th>
										</tr>
									</thead>
									<tbody class="text-left">
										<c:forEach items="${boardList}" var="board">
											<tr onClick="location.href='board_detail?board_id=${board.id}'">
												<td>${board.id}</td>
												<td>${board.title}</td>
												<td>${board.author}</td>
												<td>${board.date}</td>
												<td>${board.hits}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>

								<hr />
								<a href="board_edit" class="btn btn-default pull-right">글쓰기</a>


								<div class="text-center">
									<ul class="pagination">
										<li><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
									</ul>

								</div>

							</div>
						</div>
					</div>


				</div>
				<!-- /.col-md-9 -->
			</div>
			<!-- /.container -->
		</div>
		<!-- /#content -->
	</div>

	<!-- *** FOOTER ***
 _________________________________________________________ -->
	<div id="footer" data-animate="fadeInUp">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<h4>Pages</h4>

					<ul>
						<li><a href="text.html">About us</a>
						<li><a href="text.html">Terms and conditions</a></li>
						<li><a href="faq.html">FAQ</a></li>
						<li><a href="contact.html">Contact us</a></li>
					</ul>

					<hr>

					<h4>User section</h4>

					<ul>
						<li><a href="#" data-toggle="modal" data-target="#login-modal">Login</a></li>
						<li><a href="register.html">Regiter</a></li>
					</ul>

					<hr class="hidden-md hidden-lg hidden-sm">

				</div>
				<!-- /.col-md-3 -->

				<div class="col-md-3 col-sm-6">

					<h4>Top categories</h4>

					<h5>Men</h5>

					<ul>
						<li><a href="category.html">T-shirts</a></li>
						<li><a href="category.html">Shirts</a></li>
						<li><a href="category.html">Accessories</a></li>
					</ul>

					<h5>Ladies</h5>
					<ul>
						<li><a href="category.html">T-shirts</a></li>
						<li><a href="category.html">Skirts</a></li>
						<li><a href="category.html">Pants</a></li>
						<li><a href="category.html">Accessories</a></li>
					</ul>

					<hr class="hidden-md hidden-lg">

				</div>
				<!-- /.col-md-3 -->

				<div class="col-md-3 col-sm-6">

					<h4>Where to find us</h4>

					<p>
						<strong>Obaju Ltd.</strong> <br>13/25 New Avenue <br>New Heaven <br>45Y 73J <br>England <br> <strong>Great Britain</strong>
					</p>

					<a href="contact.html">Go to contact page</a>

					<hr class="hidden-md hidden-lg">

				</div>
				<!-- /.col-md-3 -->



				<div class="col-md-3 col-sm-6">

					<h4>Get the news</h4>

					<p class="text-muted">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>

					<form>
						<div class="input-group">

							<input type="text" class="form-control"> <span class="input-group-btn">

								<button class="btn btn-default" type="button">Subscribe!</button>

							</span>

						</div>
						<!-- /input-group -->
					</form>

					<hr>

					<h4>Stay in touch</h4>

					<p class="social">
						<a href="#" class="facebook external" data-animate-hover="shake"><i class="fa fa-facebook"></i></a> <a href="#" class="twitter external" data-animate-hover="shake"><i class="fa fa-twitter"></i></a> <a href="#" class="instagram external" data-animate-hover="shake"><i class="fa fa-instagram"></i></a> <a href="#" class="gplus external" data-animate-hover="shake"><i class="fa fa-google-plus"></i></a> <a href="#" class="email external" data-animate-hover="shake"><i class="fa fa-envelope"></i></a>
					</p>


				</div>
				<!-- /.col-md-3 -->

			</div>
			<!-- /.row -->

		</div>
		<!-- /.container -->
	</div>
	<!-- /#footer -->

	<!-- *** FOOTER END *** -->




	<!-- *** COPYRIGHT ***
 _________________________________________________________ -->
	<div id="copyright">
		<div class="container">
			<div class="col-md-6">
				<p class="pull-left">© 2015 Your name goes here.</p>

			</div>
			<div class="col-md-6">
				<p class="pull-right">
					Template by <a href="https://bootstrapious.com/e-commerce-templates">Bootstrapious</a> & <a href="https://fity.cz">Fity</a>
					<!-- Not removing these links is part of the license conditions of the template. Thanks for understanding :) If you want to use the template without the attribution links, you can do so after supporting further themes development at https://bootstrapious.com/donate  -->
				</p>
			</div>
		</div>
	</div>
	<!-- *** COPYRIGHT END *** -->

	<!-- /#all -->


	<!-- *** SCRIPTS TO INCLUDE ***
 _________________________________________________________ -->
	<script src="resources/js/jquery-1.11.0.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.cookie.js"></script>
	<script src="resources/js/waypoints.min.js"></script>
	<script src="resources/js/modernizr.js"></script>
	<script src="resources/js/bootstrap-hover-dropdown.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="resources/js/front.js"></script>

</body>
</html>