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

    <title>
        	쏘공나와
    </title>

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
                    <div id="main-slider">
                        <div class="item">
                            <img src="resources/img/main-slider1.jpg" alt="" class="img-responsive">
                        </div>
                        <div class="item">
                            <img class="img-responsive" src="resources/img/main-slider2.jpg" alt="">
                        </div>
                        <div class="item">
                            <img class="img-responsive" src="resources/img/main-slider3.jpg" alt="">
                        </div>
                        <div class="item">
                            <img class="img-responsive" src="resources/img/main-slider4.jpg" alt="">
                        </div>
                    </div>
                    <!-- /#main-slider -->
                </div>
            </div>

            <!-- *** ADVANTAGES HOMEPAGE ***
 _________________________________________________________ -->
            <div id="advantages">

                <div class="container">
                    <div class="same-height-row">
                        <div class="col-sm-4">
                            <div class="box same-height clickable">
                                <div class="icon"><i class="fa fa-heart"></i>
                                </div>

                                <h3><a href="#">고객 사랑</a></h3>
                                <p>우리는 고객에게 최고의 서비스를 제공합니다.</p>
                            </div>
                        </div>

                        <div class="col-sm-4">
                            <div class="box same-height clickable">
                                <div class="icon"><i class="fa fa-tags"></i>
                                </div>

                                <h3><a href="#">착한 가격</a></h3>
                                <p>판타스틱한 가격에 여러분들을 모시겠습니다.</p>
                            </div>
                        </div>

                        <div class="col-sm-4">
                            <div class="box same-height clickable">
                                <div class="icon"><i class="fa fa-thumbs-up"></i>
                                </div>

                                <h3><a href="#">100% 만족도</a></h3>
                                <p>모든 제품은 3개월 동안 무료로 환불이 가능합니다.</p>
                            </div>
                        </div>
                    </div>
                    <!-- /.row -->

                </div>
                <!-- /.container -->

            </div>
            <!-- /#advantages -->

            <!-- *** ADVANTAGES END *** -->

            <!-- *** HOT PRODUCT SLIDESHOW ***
 _________________________________________________________ -->
            <div id="hot">

                <div class="box">
                    <div class="container">
                        <div class="col-md-12">
                            <h2>제품들</h2>
                        </div>
                    </div>
                </div>

                <div class="container">
                    <div class="product-slider">
                    	<c:forEach items="${productList}" var="product">
	                    	<div class="item">
	                            <div class="product">
	                                <div class="flip-container">
	                                    <div class="flipper">
	                                        <div class="front">
	                                            <a href="${pageContext.request.contextPath}/detail?product=${product.code}">
	                                                <img src="${product.image}" alt="" class="img-responsive">
	                                            </a>
	                                        </div>
	                                        <div class="back">
	                                            <a href="${pageContext.request.contextPath}/detail?product=${product.code}">
	                                                <img src="${product.image}" alt="" class="img-responsive">
	                                            </a>
	                                        </div>
	                                    </div>
	                                </div>
	                                <a href="${pageContext.request.contextPath}/detail?product=${product.code}" class="invisible">
	                                    <img src="${product.image}" alt="" class="img-responsive">
	                                </a>
	                                <div class="text">
	                                    <h3><a href="${pageContext.request.contextPath}/detail?product=${product.code}">${product.name}</a></h3>
	                                    <p class="price">&#8361; ${product.price}</p>
	                                </div>
	                                <!-- /.text -->
	                            </div>
	                            <!-- /.product -->
	                        </div>
	                    </c:forEach>

                    <!-- /.product-slider -->
                <!-- /.container -->

<!--                         <div class="item"> -->
<!--                             <div class="product"> -->
<!--                                 <div class="flip-container"> -->
<!--                                     <div class="flipper"> -->
<!--                                         <div class="front"> -->
<%--                                             <a href="${pageContext.request.contextPath}/detail"> --%>
<!--                                                 <img src="resources/img/product1.jpg" alt="" class="img-responsive"> -->
<!--                                             </a> -->
<!--                                         </div> -->
<!--                                         <div class="back"> -->
<%--                                             <a href="${pageContext.request.contextPath}/detail"> --%>
<!--                                                 <img src="resources/img/product1_2.jpg" alt="" class="img-responsive"> -->
<!--                                             </a> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<%--                                 <a href="${pageContext.request.contextPath}/detail" class="invisible"> --%>
<!--                                     <img src="resources/img/product1.jpg" alt="" class="img-responsive"> -->
<!--                                 </a> -->
<!--                                 <div class="text"> -->
<%--                                     <h3><a href="${pageContext.request.contextPath}/detail">Fur coat with very but very very long name</a></h3> --%>
<!--                                     <p class="price">$143.00</p> -->
<!--                                 </div> -->
<!--                                 /.text -->
<!--                             </div> -->
<!--                             /.product -->
<!--                         </div> -->

<!--                         <div class="item"> -->
<!--                             <div class="product"> -->
<!--                                 <div class="flip-container"> -->
<!--                                     <div class="flipper"> -->
<!--                                         <div class="front"> -->
<%--                                             <a href="${pageContext.request.contextPath}/detail"> --%>
<!--                                                 <img src="resources/img/product2.jpg" alt="" class="img-responsive"> -->
<!--                                             </a> -->
<!--                                         </div> -->
<!--                                         <div class="back"> -->
<%--                                             <a href="${pageContext.request.contextPath}/detail"> --%>
<!--                                                 <img src="resources/img/product2_2.jpg" alt="" class="img-responsive"> -->
<!--                                             </a> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<%--                                 <a href="${pageContext.request.contextPath}/detail" class="invisible"> --%>
<!--                                     <img src="resources/img/product2.jpg" alt="" class="img-responsive"> -->
<!--                                 </a> -->
<!--                                 <div class="text"> -->
<%--                                     <h3><a href="${pageContext.request.contextPath}/detail">White Blouse Armani</a></h3> --%>
<!--                                     <p class="price"><del>$280</del> $143.00</p> -->
<!--                                 </div> -->
<!--                                 /.text -->

<!--                                 <div class="ribbon sale"> -->
<!--                                     <div class="theribbon">SALE</div> -->
<!--                                     <div class="ribbon-background"></div> -->
<!--                                 </div> -->
<!--                                 /.ribbon -->

<!--                                 <div class="ribbon new"> -->
<!--                                     <div class="theribbon">NEW</div> -->
<!--                                     <div class="ribbon-background"></div> -->
<!--                                 </div> -->
<!--                                 /.ribbon -->

<!--                                 <div class="ribbon gift"> -->
<!--                                     <div class="theribbon">GIFT</div> -->
<!--                                     <div class="ribbon-background"></div> -->
<!--                                 </div> -->
<!--                                 /.ribbon -->
<!--                             </div> -->
<!--                             /.product -->
<!--                         </div> -->

<!--                         <div class="item"> -->
<!--                             <div class="product"> -->
<!--                                 <div class="flip-container"> -->
<!--                                     <div class="flipper"> -->
<!--                                         <div class="front"> -->
<%--                                             <a href="${pageContext.request.contextPath}/detail"> --%>
<!--                                                 <img src="resources/img/product3.jpg" alt="" class="img-responsive"> -->
<!--                                             </a> -->
<!--                                         </div> -->
<!--                                         <div class="back"> -->
<%--                                             <a href="${pageContext.request.contextPath}/detail"> --%>
<!--                                                 <img src="resources/img/product3_2.jpg" alt="" class="img-responsive"> -->
<!--                                             </a> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<%--                                 <a href="${pageContext.request.contextPath}/detail" class="invisible"> --%>
<!--                                     <img src="resources/img/product3.jpg" alt="" class="img-responsive"> -->
<!--                                 </a> -->
<!--                                 <div class="text"> -->
<%--                                     <h3><a href="${pageContext.request.contextPath}/detail">Black Blouse Versace</a></h3> --%>
<!--                                     <p class="price">$143.00</p> -->
<!--                                 </div> -->
<!--                                 /.text -->
<!--                             </div> -->
<!--                             /.product -->
<!--                         </div> -->

<!--                         <div class="item"> -->
<!--                             <div class="product"> -->
<!--                                 <div class="flip-container"> -->
<!--                                     <div class="flipper"> -->
<!--                                         <div class="front"> -->
<%--                                             <a href="${pageContext.request.contextPath}/detail"> --%>
<!--                                                 <img src="resources/img/product3.jpg" alt="" class="img-responsive"> -->
<!--                                             </a> -->
<!--                                         </div> -->
<!--                                         <div class="back"> -->
<%--                                             <a href="${pageContext.request.contextPath}/detail"> --%>
<!--                                                 <img src="resources/img/product3_2.jpg" alt="" class="img-responsive"> -->
<!--                                             </a> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<%--                                 <a href="${pageContext.request.contextPath}/detail" class="invisible"> --%>
<!--                                     <img src="resources/img/product3.jpg" alt="" class="img-responsive"> -->
<!--                                 </a> -->
<!--                                 <div class="text"> -->
<%--                                     <h3><a href="${pageContext.request.contextPath}/detail">Black Blouse Versace</a></h3> --%>
<!--                                     <p class="price">$143.00</p> -->
<!--                                 </div> -->
<!--                                 /.text -->
<!--                             </div> -->
<!--                             /.product -->
<!--                         </div> -->

<!--                         <div class="item"> -->
<!--                             <div class="product"> -->
<!--                                 <div class="flip-container"> -->
<!--                                     <div class="flipper"> -->
<!--                                         <div class="front"> -->
<%--                                             <a href="${pageContext.request.contextPath}/detail"> --%>
<!--                                                 <img src="resources/img/product2.jpg" alt="" class="img-responsive"> -->
<!--                                             </a> -->
<!--                                         </div> -->
<!--                                         <div class="back"> -->
<%--                                             <a href="${pageContext.request.contextPath}/detail"> --%>
<!--                                                 <img src="resources/img/product2_2.jpg" alt="" class="img-responsive"> -->
<!--                                             </a> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<%--                                 <a href="${pageContext.request.contextPath}/detail" class="invisible"> --%>
<!--                                     <img src="resources/img/product2.jpg" alt="" class="img-responsive"> -->
<!--                                 </a> -->
<!--                                 <div class="text"> -->
<%--                                     <h3><a href="${pageContext.request.contextPath}/detail">White Blouse Versace</a></h3> --%>
<!--                                     <p class="price">$143.00</p> -->
<!--                                 </div> -->
<!--                                 /.text -->

<!--                                 <div class="ribbon new"> -->
<!--                                     <div class="theribbon">NEW</div> -->
<!--                                     <div class="ribbon-background"></div> -->
<!--                                 </div> -->
<!--                                 /.ribbon -->
<!--                             </div> -->
<!--                             /.product -->
<!--                         </div> -->

<!--                         <div class="item"> -->
<!--                             <div class="product"> -->
<!--                                 <div class="flip-container"> -->
<!--                                     <div class="flipper"> -->
<!--                                         <div class="front"> -->
<%--                                             <a href="${pageContext.request.contextPath}/detail"> --%>
<!--                                                 <img src="resources/img/product1.jpg" alt="" class="img-responsive"> -->
<!--                                             </a> -->
<!--                                         </div> -->
<!--                                         <div class="back"> -->
<%--                                             <a href="${pageContext.request.contextPath}/detail"> --%>
<!--                                                 <img src="resources/img/product1_2.jpg" alt="" class="img-responsive"> -->
<!--                                             </a> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<%--                                 <a href="${pageContext.request.contextPath}/detail" class="invisible"> --%>
<!--                                     <img src="resources/img/product1.jpg" alt="" class="img-responsive"> -->
<!--                                 </a> -->
<!--                                 <div class="text"> -->
<%--                                     <h3><a href="${pageContext.request.contextPath}/detail">Fur coat</a></h3> --%>
<!--                                     <p class="price">$143.00</p> -->
<!--                                 </div> -->
<!--                                 /.text -->

<!--                                 <div class="ribbon gift"> -->
<!--                                     <div class="theribbon">GIFT</div> -->
<!--                                     <div class="ribbon-background"></div> -->
<!--                                 </div> -->
<!--                                 /.ribbon -->

<!--                             </div> -->
<!--                             /.product -->
<!--                         </div> -->
<!--                         /.col-md-4 -->

<!--                         <div class="item"> -->
<!--                             <div class="product"> -->
<!--                                 <div class="flip-container"> -->
<!--                                     <div class="flipper"> -->
<!--                                         <div class="front"> -->
<%--                                             <a href="${pageContext.request.contextPath}/detail"> --%>
<!--                                                 <img src="resources/img/product2.jpg" alt="" class="img-responsive"> -->
<!--                                             </a> -->
<!--                                         </div> -->
<!--                                         <div class="back"> -->
<%--                                             <a href="${pageContext.request.contextPath}/detail"> --%>
<!--                                                 <img src="resources/img/product2_2.jpg" alt="" class="img-responsive"> -->
<!--                                             </a> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<%--                                 <a href="${pageContext.request.contextPath}/detail" class="invisible"> --%>
<!--                                     <img src="resources/img/product2.jpg" alt="" class="img-responsive"> -->
<!--                                 </a> -->
<!--                                 <div class="text"> -->
<%--                                     <h3><a href="${pageContext.request.contextPath}/detail">White Blouse Armani</a></h3> --%>
<!--                                     <p class="price"><del>$280</del> $143.00</p> -->
<!--                                 </div> -->
<!--                                 /.text -->

<!--                                 <div class="ribbon sale"> -->
<!--                                     <div class="theribbon">SALE</div> -->
<!--                                     <div class="ribbon-background"></div> -->
<!--                                 </div> -->
<!--                                 /.ribbon -->

<!--                                 <div class="ribbon new"> -->
<!--                                     <div class="theribbon">NEW</div> -->
<!--                                     <div class="ribbon-background"></div> -->
<!--                                 </div> -->
<!--                                 /.ribbon -->

<!--                                 <div class="ribbon gift"> -->
<!--                                     <div class="theribbon">GIFT</div> -->
<!--                                     <div class="ribbon-background"></div> -->
<!--                                 </div> -->
<!--                                 /.ribbon -->
<!--                             </div> -->
<!--                             /.product -->
<!--                         </div> -->

<!--                         <div class="item"> -->
<!--                             <div class="product"> -->
<!--                                 <div class="flip-container"> -->
<!--                                     <div class="flipper"> -->
<!--                                         <div class="front"> -->
<%--                                             <a href="${pageContext.request.contextPath}/detail"> --%>
<!--                                                 <img src="resources/img/product3.jpg" alt="" class="img-responsive"> -->
<!--                                             </a> -->
<!--                                         </div> -->
<!--                                         <div class="back"> -->
<%--                                             <a href="${pageContext.request.contextPath}/detail"> --%>
<!--                                                 <img src="resources/img/product3_2.jpg" alt="" class="img-responsive"> -->
<!--                                             </a> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<%--                                 <a href="${pageContext.request.contextPath}/detail" class="invisible"> --%>
<!--                                     <img src="resources/img/product3.jpg" alt="" class="img-responsive"> -->
<!--                                 </a> -->
<!--                                 <div class="text"> -->
<%--                                     <h3><a href="${pageContext.request.contextPath}/detail">Black Blouse Versace</a></h3> --%>
<!--                                     <p class="price">$143.00</p> -->
<!--                                 </div> -->
<!--                                 /.text -->
<!--                             </div> -->
<!--                             /.product -->
<!--                         </div> -->

                    </div>
                    <!-- /.product-slider -->
                </div>
                <!-- /.container -->

            </div>
            <!-- /#hot -->

            <!-- *** HOT END *** -->

            <!-- *** GET INSPIRED ***
 _________________________________________________________ -->
<!--             <div class="container" data-animate="fadeInUpBig"> -->
<!--                 <div class="col-md-12"> -->
<!--                     <div class="box slideshow"> -->
<!--                         <h3>Get Inspired</h3> -->
<!--                         <p class="lead">Get the inspiration from our world class designers</p> -->
<!--                         <div id="get-inspired" class="owl-carousel owl-theme"> -->
<!--                             <div class="item"> -->
<!--                                 <a href="#"> -->
<!--                                     <img src="resources/img/getinspired1.jpg" alt="Get inspired" class="img-responsive"> -->
<!--                                 </a> -->
<!--                             </div> -->
<!--                             <div class="item"> -->
<!--                                 <a href="#"> -->
<!--                                     <img src="resources/img/getinspired2.jpg" alt="Get inspired" class="img-responsive"> -->
<!--                                 </a> -->
<!--                             </div> -->
<!--                             <div class="item"> -->
<!--                                 <a href="#"> -->
<!--                                     <img src="resources/img/getinspired3.jpg" alt="Get inspired" class="img-responsive"> -->
<!--                                 </a> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
            <!-- *** GET INSPIRED END *** -->

            <!-- *** BLOG HOMEPAGE ***
 _________________________________________________________ -->


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


</body>

</html>