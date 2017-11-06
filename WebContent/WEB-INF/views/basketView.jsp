<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <jsp:include page="recentProduct.jsp"></jsp:include>
    

    <div id="all">

        <div id="content">
            <div class="container">

                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="home">홈</a>
                        </li>
                        <li>장바구니</li>
                    </ul>
                </div>

                <div class="col-md-12" id="basket">

                    <div class="box">

                        <form method="post" action="checkout1.html">

                            <h1>장바구니</h1>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                        	<th colspan="3"></th>
                                            <th colspan="2">상품</th>
<!--                                             <th>Quantity</th> -->
<!--                                             <th>Unit price</th> -->
<!--                                             <th>Discount</th> -->
                                            <th colspan="2">가격</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:set var="total" value="0"/>
                                    	<c:forEach items="${cartList}" var="product">
                                    		<tr>
                                    			<td/><td/><td/>
                                    			<td>
                                    				<a href="detail?product=${product.code}">
                                                    	<img src="${product.image}" alt="White Blouse Armani">
                                               		</a>
                                               	</td>
                                               	<td><a href="detail?product=${product.code}">${product.name}</a>
                                               	</td>
                                               	<td>${product.price}</td>
<!--                                                	<td>$0.00</td> -->
<%--                                                	<td><c:out value="${product.price * 2}"></c:out></td> --%>
                                               	<td><a href="deleteCartProduct?product=${product.code}"><i class="fa fa-trash-o"></i></a>
                                            	</td>
                                            </tr>
                                            <c:set var="total" value="${total+product.price}"/>
										</c:forEach>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                        	<th colspan="3"></th>
                                            <th colspan="2">합계</th>
                                            <th colspan="2">${total}</th>
                                        </tr>
                                    </tfoot>
                                </table>

                            </div>
                            <!-- /.table-responsive -->

                            <div class="box-footer">
                                <div class="pull-left">
                                    <a href="home" class="btn btn-default"><i class="fa fa-chevron-left"></i> 쇼핑 계속하기</a>
                                </div>
                            </div>

                        </form>

                    </div>
                    <!-- /.box -->


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