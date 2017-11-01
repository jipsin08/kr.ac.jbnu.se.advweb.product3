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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

		$("#register-button").on('click', function() {
			$.post('${pageContext.request.contextPath}/user_register', {
				name : $("#name").val(),
				id : $("#student_number").val(),
				major : $("#major").val(),
				email : $("#email").val(),
				password : $("#password").val(),
			}, function(data, status, jqXHR) {
			// 			        alert( "\nStatus: " + status);
			// 			        alert( "\nStatus: " + jqXHR.status);
			}).done(function() {
				alert("성공!");
				window.location.replace("${pageContext.request.contextPath}/home");
			}).fail(function(jqXHR) {
				alert("실패!");
				alert("에러메시지" + jqXHR.responseText);
			}).always(function() {
			// 					alert("항상!");
			});
		});

		//회원가입 옆에 있는 로그인 화면
		$("#login-button").on('click', function() {
			$.post('${pageContext.request.contextPath}/login', {
				email : $("#login-email").val(),
				password : $("#login-password").val(),
				rememberMe : $("#rememberMe-id").is(":checked"),
			}, function(data, status, jqXHR) {
			// 			        alert( "\nStatus: " + status);
			// 			        alert( "\nStatus: " + jqXHR.status);
			}).done(function() {
				alert("성공!");
				window.location.replace("${pageContext.request.contextPath}/home");
			}).fail(function(jqXHR) {
				alert("실패!");
				alert("에러메시지" + jqXHR.responseText);
			}).always(function() {
			// 					alert("항상!");
			});
		});
	});
</script>


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
						<li><a href="home">홈</a></li>
						<li>회원가입 / 로그인</li>
					</ul>

				</div>

				<div class="col-md-6">
					<div class="box">
						<h1>회원가입</h1>

						<p class="lead">아직 SsoGongnawa의 회원이 아니세요?</p>
						<p>With registration with us new world of fashion, fantastic
							discounts and much more opens to you! The whole process will not
							take you more than a minute!</p>
						<p class="text-muted">
							If you have any questions, please feel free to <a
								href="contact.html">contact us</a>, our customer service center
							is working for you 24/7.
						</p>

						<hr>

						<!--                         <form action="finished_register" id="form_user_register"> -->
						<div class="form-group">
							<label for="name">이름</label> <input type="text"
								class="form-control" id="name">
						</div>
						<div class="form-group">
							<label for="student_number">학번</label> <input type="text"
								class="form-control" id="student_number">
						</div>
						<div class="form-group">
							<label for="student_number">전공</label> <input type="text"
								class="form-control" id="major">
						</div>
						<div class="form-group">
							<label for="email">이메일</label> <input type="text"
								class="form-control" id="email">
						</div>
						<div class="form-group">
							<label for="password">비밀번호</label> <input type="password"
								class="form-control" id="password">
						</div>
						<div class="text-center">
							<button id="register-button" class="btn btn-primary">
								<i class="fa fa-user-md"></i> Register
							</button>
						</div>
						<!--                         </form> -->
					</div>
				</div>

				<div class="col-md-6">
					<div class="box">
						<h1>로그인</h1>

						<p class="lead">계정이 있으신가요?</p>
						<!--                         <p class="text-muted">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies -->
						<!--                             mi vitae est. Mauris placerat eleifend leo.</p> -->

						<hr>

						<!--                         <form action="home"> -->
						<div class="form-group">
							<label for="email">이메일</label> <input type="text"
								class="form-control" id="login-email">
						</div>
						<div class="form-group">
							<label for="password">비밀번호</label> <input type="password"
								class="form-control" id="login-password">
						</div>
						<p class="text-left">
							<input type="checkbox" id="rememberMe-id" name="rememberMe" />
							자동로그인
						</p>
						<div class="text-center">
							<button id="login-button" class="btn btn-primary">
								<i class="fa fa-sign-in"></i> 로그인
							</button>
						</div>

						<!--                         </form> -->
					</div>
				</div>


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

</body>

</html>
