<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>

<meta charset="utf-8">
<meta name="robots" content="all,follow">
<meta name="googlebot" content="index,follow,snippet,archive">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Obaju e-commerce template">
<meta name="author" content="Ondrej Svestka | ondrejsvestka.cz">
<meta name="keywords" content="">

<title>쏘공나와</title>

<meta name="keywords" content="">

<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100'
	rel='stylesheet' type='text/css'>

<!-- styles -->
<link href="resources/css/font-awesome.css" rel="stylesheet">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/animate.min.css" rel="stylesheet">
<link href="resources/css/owl.carousel.css" rel="stylesheet">
<link href="resources/css/owl.theme.css" rel="stylesheet">

<!-- theme stylesheet -->
<link href="resources/css/style.blue.css" rel="stylesheet"
	id="theme-stylesheet">

<!-- your stylesheet with modifications -->
<link href="resources/css/custom.css" rel="stylesheet">

<script src="resources/js/respond.min.js"></script>

<link rel="shortcut icon" href="favicon.png">



</head>

<body>
	<jsp:include page="_top.jsp"></jsp:include>
	<jsp:include page="_navbar.jsp"></jsp:include>
	<jsp:include page="recentProduct.jsp"></jsp:include>


	<div id="all">

		<div id="content">
			<div class="container">

				<div class="col-md-12">
					<ul class="breadcrumb">
						<li><a href="#">홈</a></li>
						<li><a href="#">제품</a></li>
						<li>${product.name}</li>
					</ul>

				</div>

				<div class="col-md-3">
					<!-- *** MENUS AND FILTERS ***
 _________________________________________________________ -->
					<div class="panel panel-default sidebar-menu">

						<div class="panel-heading">
							<h3 class="panel-title">카테고리</h3>
						</div>

						<div class="panel-body">
							<ul class="nav nav-pills nav-stacked category-menu">
								<li><a href="">가격대별</a>
									<ul>
										<li><a
											href="${pageContext.request.contextPath}/home?minprice=0&maxprice=200000">20만원
												이하</a></li>
										<li><a
											href="${pageContext.request.contextPath}/home?minprice=200000&maxprice=400000">20만원~40만원</a></li>
										<li><a
											href="${pageContext.request.contextPath}/home?minprice=400000&maxprice=600000">40만원~60만원</a></li>
										<li><a
											href="${pageContext.request.contextPath}/home?minprice=600000&maxprice=100000000">60만원
												이상</a></li>
									</ul></li>
								<li><a href="">브랜드별</a>
									<ul>
										<li><a
											href="${pageContext.request.contextPath}/home?brand=samsung">삼성</a></li>
										<li><a
											href="${pageContext.request.contextPath}/home?brand=lg">LG</a></li>
										<li><a
											href="${pageContext.request.contextPath}/home?brand=asus">ASUS</a></li>
										<li><a
											href="${pageContext.request.contextPath}/home?brand=dell">DELL</a></li>
										<li><a
											href="${pageContext.request.contextPath}/home?brand=others">기타</a></li>
									</ul></li>
								<li><a href="">CPU</a>
									<ul>
										<li><a
											href="${pageContext.request.contextPath}/home?cpu=i3">i3</a></li>
										<li><a
											href="${pageContext.request.contextPath}/home?cpu=i5">i5</a></li>
										<li><a
											href="${pageContext.request.contextPath}/home?cpu=i7">i7</a></li>
										<li><a
											href="${pageContext.request.contextPath}/home?cpu=others">기타</a></li>
									</ul></li>
										<li><a href="">그래픽카드</a>
									<ul>
										<li><a href="${pageContext.request.contextPath}/home?graphic=amd">AMD</a></li>
										<li><a href="${pageContext.request.contextPath}/home?graphic=엔비디아">엔비디아</a></li>
										<li><a href="${pageContext.request.contextPath}/home?graphic=인텔">인텔</a></li>

							</ul>

						</div>
					</div>

					
					<!-- *** MENUS AND FILTERS END *** -->

					
				</div>

				<div class="col-md-9">

					<div class="row" id="productMain">
						<div class="col-sm-6">
							<div id="mainImage">
								<img src="${product.image}" alt="" class="img-responsive">
							</div>

							<div class="ribbon sale">
								<div class="theribbon">SALE</div>
								<div class="ribbon-background"></div>
							</div>
							<!-- /.ribbon -->

							<div class="ribbon new">
								<div class="theribbon">NEW</div>
								<div class="ribbon-background"></div>
							</div>
							<!-- /.ribbon -->

						</div>
						<div class="col-sm-6">
							<div class="box">
								<h1 class="text-center">${product.name}</h1>
								<p class="goToDescription">
									<a href="#details" class="scroll-to">상세정보로 스크롤 이동</a>
								</p>
								<p class="price">&#8361; ${product.price}</p>

								<p class="text-center buttons">
									<button id="cart_btn_id" data-toggle="modal"
										data-target="#cart-modal" class="btn btn-primary">
										<i class="fa fa-shopping-cart"></i>장바구니에 담기
									</button>
								</p>


							</div>

							<!--                             <div class="row" id="thumbs"> -->
							<!--                                 <div class="col-xs-4"> -->
							<!--                                     <a href="resources/img/detailbig1.jpg" class="thumb"> -->
							<!--                                         <img src="resources/img/detailsquare.jpg" alt="" class="img-responsive"> -->
							<!--                                     </a> -->
							<!--                                 </div> -->
							<!--                                 <div class="col-xs-4"> -->
							<!--                                     <a href="resources/img/detailbig2.jpg" class="thumb"> -->
							<!--                                         <img src="resources/img/detailsquare2.jpg" alt="" class="img-responsive"> -->
							<!--                                     </a> -->
							<!--                                 </div> -->
							<!--                                 <div class="col-xs-4"> -->
							<!--                                     <a href="resources/img/detailbig3.jpg" class="thumb"> -->
							<!--                                         <img src="resources/img/detailsquare3.jpg" alt="" class="img-responsive"> -->
							<!--                                     </a> -->
							<!--                                 </div> -->
							<!--                             </div> -->
						</div>

					</div>

					<div class="modal fade" id="cart-modal" tabindex="-1" role="dialog"
						aria-labelledby="Login" aria-hidden="true">
						<div class="modal-dialog modal-sm">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title">Add To Cart</h4>
								</div>
								<div class="modal-body">
									<p class="text-center text-muted">상품이 장바구니에 담겼습니다.</p>
									<p class="text-center text-muted">바로 확인 하시겠습니까?</p>
									<p class="text-center">
										<button
											onclick="location.href='${pageContext.request.contextPath}/basket'"
											class="btn btn-primary">예</button>
										<button data-dismiss="modal" aria-hidden="true"
											class="btn btn-primary">아니요</button>
									</p>

								</div>
							</div>
						</div>
					</div>


					<div class="box" id="details">
						<p>
						<h4>브랜드</h4>
						<p>${product.brand}</p>
						<h4>CPU</h4>
						<p>${product.cpu}</p>
						<h4>그래픽 카드</h4>
						<p>${product.graphicCard}</p>
						<h4>제품 설명</h4>
						<p>${product.description}</p>
						<!--                             <h4>Material & care</h4> -->
						<!--                             <ul> -->
						<!--                                 <li>Polyester</li> -->
						<!--                                 <li>Machine wash</li> -->
						<!--                             </ul> -->
						<!--                             <h4>Size & Fit</h4> -->
						<!--                             <ul> -->
						<!--                                 <li>Regular fit</li> -->
						<!--                                 <li>The model (height 5'8" and chest 33") is wearing a size S</li> -->
						<!--                             </ul> -->

						<!--                             <blockquote> -->
						<!--                                 <p><em>Define style this season with Armani's new range of trendy tops, crafted with intricate details. Create a chic statement look by teaming this lace number with skinny jeans and pumps.</em> -->
						<!--                                 </p> -->
						<!--                             </blockquote> -->

						<hr>
					</div>

					
					
					</div>

				</div>
				<!-- /.col-md-9 -->
			</div>
			<!-- /.container -->
		</div>
		<!-- /#content -->

		<jsp:include page="_footer.jsp"></jsp:include>
		<jsp:include page="_copyright.jsp"></jsp:include>

	</div>
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
	<script src="resources/js/jquery.session.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							var sessionflag = "${sessionflag}";
							if (sessionflag == "true") {
								$("#cart_btn_id")
										.click(
												function() {
													$
															.ajax({
																url : "${pageContext.request.contextPath}/detail",
																type : "post",
																data : {
																	product : "${product.code}"
																}
															});
												});
							} else {
								$("#cart_btn_id").removeAttr("data-toggle");
								$("#cart_btn_id").removeAttr("data-target");
								$("#cart_btn_id")
										.attr("onclick",
												"location.href='${pageContext.request.contextPath}/user_register'");
							}
						});
	</script>
	<script>
		$(document).ready(function() {
			if (!!$.cookie("recentProduct")) {
				var products = $.parseJSON($.cookie("recentProduct"));
				if (products.length >= 3) {
					products.sort().reverse();
					products.pop();
					products.sort().reverse();
				}
				products.push({
					"name" : "${product.name}",
					"image" : "${product.image}",
					"code" : "${product.code}"
				});
				$.cookie("recentProduct", JSON.stringify(products));
			} else {
				var products = [ {
					"name" : "${product.name}",
					"image" : "${product.image}",
					"code" : "${product.code}"
				} ];
				$.cookie("recentProduct", JSON.stringify(products));
			}
		});
	</script>

</body>

</html>