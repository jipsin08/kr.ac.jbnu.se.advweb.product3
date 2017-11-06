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
						<p>어서 가입해서 중고 노트북의 새로운 세계와 판타스틱한 할인 등
							모든 것들을 누려보세요.</p>

						<hr>

						<form id="form_user_register" action="">
							<div class="form-group">
								<label for="name">이름</label> <input type="text"
									class="form-control" id="name" name="name">
							</div>
							<div class="form-group">
								<label for="student_number">학번</label> <input type="text"
									class="form-control" id="student_number" name="student_number">
							</div>
							<div class="form-group">
								<label for="student_number">전공</label> <input type="text"
									class="form-control" id="major" name="major">
							</div>
							<div class="form-group">
								<label for="email">이메일</label> <input type="text"
									class="form-control" id="email" name="email">
							</div>
							<div class="form-group">
								<label for="password">비밀번호</label> <input type="password"
									class="form-control" id="password" name="password">
							</div>
							<div class="text-center">
								<button id="register-button" class="btn btn-primary">
									<i class="fa fa-user-md"></i> 가입
								</button>
							</div>
						</form>
					</div>
				</div>

				<div class="col-md-6">
					<div class="box">
						<h1>로그인</h1>

						<p class="lead">계정이 있으신가요?</p>

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
							로그인 상태 유지
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
	<script src="resources/js/jquery.validate.min.js"></script>
	<script src="resources/js/additional-methods.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.cookie.js"></script>
	<script src="resources/js/waypoints.min.js"></script>
	<script src="resources/js/modernizr.js"></script>
	<script src="resources/js/bootstrap-hover-dropdown.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="resources/js/front.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function() {
		
		$.validator.addMethod("kor",  function( value, element ) {
			return this.optional(element) ||  /^[가-힣]+$/.test(value);
		}); 
		
		$.validator.addMethod("password",  function( value, element ) {
			return this.optional(element) ||  /^.*(?=^.{6,15}$)(?=.*\d)(?=.*[a-zA-Z]).*$/.test(value);
		}); 
		
		$("#form_user_register").validate({
			debug: true,
			errorClass: "error",
			highlight: function(element, errorClass) {
		        $(element).fadeOut(function() {
		            $(element).fadeIn();
		        });
		    },
			rules: { 
				name: { 
					required: true,
					maxlength: 4,
					kor: true
				},
				student_number: {
					required: true,
					number: true,
					rangelength: [9, 9],
					remote: {
						url: "${pageContext.request.contextPath}/CheckId",
						type: "post"
					}
				},
				major: {
					required: true
				},
				email: {
					required: true,
					email: true
				},
				password: {
					required: true,
					password: true
				}
			},
			messages: { 
				name: {	
					required: "필수 입력사항입니다.",
					maxlength: "최대 {0}글자이하여야 합니다.",
					kor: "자/모음만 있거나 영어가 있으면 안댐"
				},
				student_number: {
					required: "필수 입력사항입니다.",
					number: "숫자만 가능함",
					rangelength: "학번은 9자여야 함",
					remote: "이미 존재하는 학번임"
				},
				major: {
					required: "필수 입력사항입니다."
				},
				email: {
					required: "필수 입력사항입니다.",
					email: "올바른 형식이 아닙니다."
				},
				password: {
					required: "필수 입력사항입니다.",
					password: "영/숫자 포함 6자 이상이어야 함"
				}
			},
			errorClass: "validation-error"
		});
		
		//회원등록
		$("#register-button").on('click', function() {
			if($("#form_user_register").valid()) {
				$.post('${pageContext.request.contextPath}/user_register', {
					name : $("#name").val(),
					id : $("#student_number").val(),
					major : $("#major").val(),
					email : $("#email").val(),
					password : $("#password").val(),
				}, function(data, status, jqXHR) {
// 							        alert( "\nStatus: " + status);
// 							        alert( "\nStatus: " + jqXHR.status);
				}).done(function() {
					alert("성공!");
					window.location.replace("${pageContext.request.contextPath}/home");
				}).fail(function(jqXHR) {
					if(jqXHR.status == "403") {
						alert("본 이메일은 정지된 이메일입니다. 다른 이메일로 가입해주세요.")
					}
				}).always(function() {
				// 					alert("항상!");
				});
			} else {
			}
		});

		
		//회원가입 옆에 있는 로그인 화면
		$("#login-button").on('click', function() {
			$.post('${pageContext.request.contextPath}/login', {
				email : $("#login-email").val(),
				password : $("#login-password").val(),
				rememberMe : $("#rememberMe-id").is(":checked"),
			}, function(data, status, jqXHR) {
				if(data == "isBlocked") {
					alert("본 계정은 정지되었습니다. 관리자에게 문의해주세요.")
					return;
				}
				
				if(data == "isAdmin") {
	 				window.location.replace("${pageContext.request.contextPath}/admin_home");
				} else {
	 				window.location.replace("${pageContext.request.contextPath}/home");
				}
			}).done(function() {
// 				alert("성공!");
// 				window.location.replace("${pageContext.request.contextPath}/home");
			}).fail(function(jqXHR) {
				alert("실패");
			}).always(function() {
			// 					alert("항상!");
			});
		});
	});
</script>


</body>

</html>
