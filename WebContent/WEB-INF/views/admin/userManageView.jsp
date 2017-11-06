<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="robots" content="all,follow">
    <meta name="googlebot" content="index,follow,snippet,archive">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Obaju e-commerce template">
    <meta name="author" content="Ondrej Svestka | ondrejsvestka.cz">
    <meta name="keywords" content="">

    <title>
        ssogongnawa-admin_userlist
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
                    <ul class="breadcrumb">
                        <li><a href="#">홈</a>
                        </li>
                        <li>관리자 페이지</li>
                    </ul>
                </div>

                <div class="col-md-3">
                    <!-- *** PAGES MENU ***
 _________________________________________________________ -->
                    <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">관리자 페이지</h3>
                        </div>

                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked">
                                <li>
                                    <a href="user_manage">회원 관리</a>
                                </li>
<!--                                 <li> -->
<!--                                     <a href="contact.html">Contact page</a> -->
<!--                                 </li> -->
<!--                                 <li> -->
<!--                                     <a href="faq.html">FAQ</a> -->
<!--                                 </li> -->

                            </ul>

                        </div>
                    </div>

                    <!-- *** PAGES MENU END *** -->


          
                </div>

				<div class="col-md-9">

					<div class="box" id="text-page">
						<p style="color: red;">${errorString}</p>

						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>학번</th>
										<th>전공</th>
										<th>이름</th>
										<th>이메일</th>
										<th>차단</th>
										<th>차단여부</th>
									</tr>
								</thead>
									<c:forEach items="${userlist}" var="user">
										<tr>
											<td>${user.id}</td>
											<td>${user.major}</td>
											<td>${user.userName}</td>
											<td>${user.email}</td>
<%-- 											<td><a href="editUserAccount?id=${user.id}">Edit</a></td> --%>
											<td><a href="blockUserAccount?id=${user.id}"><i class="fa fa-trash-o"></i></a></td>
											<td>${user.blocked}</td>
										</tr>
									</c:forEach>
							</table>
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