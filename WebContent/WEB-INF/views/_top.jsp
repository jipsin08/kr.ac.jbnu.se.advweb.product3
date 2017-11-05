<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		//로그인 여부에 따라서 보이는 메뉴 다르게 표시
		$.get('${pageContext.request.contextPath}/login', function(data) {
			if(data == "not logged in") {
				$("#li-login").removeClass('hidden');
				$("#li-register").removeClass('hidden');
			} else if(data == "logged in") {
				$("#li-logout").removeClass('hidden');
				$("#li-edit").removeClass('hidden');
			}
		});
		
		//로그인 모달창에서 로그인 버튼 눌러서 로그인 요청
		$("#btn-login").on('click', function() {
	    		$.post('${pageContext.request.contextPath}/login', {
					email : $("#email-modal").val(),
					password : $("#password-modal").val(),
					rememberMe : $("#rememberMe-id").is(":checked"),
				}, function(data, status, jqXHR){
// 			        alert( "\nStatus: " + status);
// 			        alert( "\nStatus: " + jqXHR.status);
			    })
			    .done(function(data, status, jqXHR) {
					window.location.replace("${pageContext.request.contextPath}/home");
				})
				.fail(function(jqXHR) {
					alert("실패!");
					alert("에러메시지" + jqXHR.responseText);
				})
				.always(function() {
// 					alert("항상!");
				});
			});

		//로그아웃
		$('ul.menu li').click(function(e) {
			if ($(this).text() == 'Logout') {
				$.get('${pageContext.request.contextPath}/logout', function() {
					alert('로그아웃 되었습니다.');
					window.location.replace("${pageContext.request.contextPath}/home");
				});
			}
		});
	})
</script>

<div id="top">
	<div class="container">
		<div class="col-md-6 offer" data-animate="fadeInDown">
			<a href="#" class="btn btn-success btn-sm" data-animate-hover="shake">Offer
				of the day</a> <a href="#">Get flat 35% off on orders over $50!</a>
		</div>
		<div class="col-md-6" data-animate="fadeInDown">
			<ul class="menu">
				<li class="hidden" id="li-login"><a href="#" data-toggle="modal" data-target="#login-modal">Login</a></li>
				<li class="hidden" id="li-register"><a href="user_register">Register</a></li>
				<li class="hidden" id="li-edit"><a href="user_edit">회원정보수정</a>
				<li class="hidden" id="li-logout"><a href="#">Logout</a></li>
				<li><a href="contact.html">Contact</a></li>
				<li><a href="#">Recently viewed</a></li>
			</ul>
		</div>
	</div>

	<div class="modal fade" id="login-modal" tabindex="-1" role="dialog"
		aria-labelledby="Login" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="Login">Customer login</h4>
				</div>
				<div class="modal-body">
<!-- 					<form id="login_form_id" action="home" method="POST"> -->
						<div class="form-group">
							<input type="text" class="form-control" id="email-modal"
								name="email" placeholder="email" value="" />
						</div>
						<div class="form-group">
							<input type="password" class="form-control" id="password-modal"
								name="password" placeholder="password" value="" />
						</div>

						<p class="text-left">
							<input type="checkbox" id="rememberMe-id" name="rememberMe"
								value="Y" /> Remember me?
						</p>
						<p class="text-center">
							<button id="btn-login" class="btn btn-primary">
								<i class="fa fa-sign-in"></i> Log in
							</button>
						</p>
<!-- 					</form> -->

					<p class="text-center text-muted">Not registered yet?</p>
					<p class="text-center text-muted">
						<a href="user_register"><strong>Register now</strong></a>! It is
						easy and done in 1&nbsp;minute and gives you access to special
						discounts and much more!
					</p>

				</div>
			</div>
		</div>
	</div>

</div>