<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		//로그인 여부에 따라서 보이는 메뉴 다르게 표시
		$.get('${pageContext.request.contextPath}/login', function(data) {
			if (data == "not logged in") {
				$("#li-login").removeClass('hidden');
				$("#li-register").removeClass('hidden');
			} else if (data == "logged in") {
				$("#li-logout").removeClass('hidden');
				$("#li-MyPage").removeClass('hidden');
				$("#li-edit").removeClass('hidden');
			}
		});
		
		//로그인 요청
		$("#btn-login").on('click', function(e) {
			$.post('${pageContext.request.contextPath}/login', {
				email : $("#email-modal").val(),
				password : $("#password-modal").val(),
				rememberMe : $("#rememberMe").val()
			}, function(data) {
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
		
		//로그아웃
		$('ul.menu li').click(function(e) {
			if ($(this).text() == '로그아웃') {
				$.get('${pageContext.request.contextPath}/logout', function() {
					alert('로그아웃 되었습니다.');
					window.location.replace("${pageContext.request.contextPath}/home");
				});
			}
		});
	});
</script>

<div id="top">
	<div class="container">
		<div class="col-md-6 offer" data-animate="fadeInDown"></div>
		<div class="col-md-6" data-animate="fadeInDown">
			<ul class="menu">
				<li class="hidden" id="li-login"><a href="#" data-toggle="modal" data-target="#login-modal">로그인</a></li>
				<li class="hidden" id="li-register"><a href="user_register">회원가입</a></li>
				<li><a href="createProduct">상품등록</a></li>
				<li class="hidden" id="li-edit"><a href="user_edit">회원정보수정</a>
				<li class="hidden" id="li-logout"><a href="#">로그아웃</a></li>
			</ul>
		</div>
	</div>

	<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="Login">로그인</h4>
				</div>
				<div class="modal-body">
<!-- 					<form id="login_form_id" action="login" method="POST"> -->
						<div class="form-group">
							<input type="text" class="form-control" id="email-modal" name="email" placeholder="email" value="" />
						</div>
						<div class="form-group">
							<input type="password" class="form-control" id="password-modal" name="password" placeholder="password" value="" />
						</div>

						<p class="text-left">
							<input type="checkbox" id="rememberMe-id" name="rememberMe" value="Y" /> 로그인 상태 유지
						</p>
						<p class="text-center">
							<button id="btn-login" class="btn btn-primary">
								<i class="fa fa-sign-in"></i> 로그인
							</button>
						</p>
<!-- 					</form> -->

					<p class="text-center text-muted">아직 가입을 안하셨다구요?</p>
					<p class="text-center text-muted">
						<a href="user_register"><strong>바로 가입하세요</strong></a>! 가입하는데 아주 간단해 &nbsp;1분밖에 걸리지 않는다구요! 어서 가입해서 특별 할인을 받으세요!
					</p>

				</div>
			</div>
		</div>
	</div>
</div>
<!-- <div id="top"> -->
<!--     <div class="container"> -->
<!--         <div class="col-md-6 offer" data-animate="fadeInDown"> -->
<!--             <a href="#" class="btn btn-success btn-sm" data-animate-hover="shake">Offer of the day</a>  <a href="#">Get flat 35% off on orders over $50!</a> -->
<!--         </div> -->
<!--         <div class="col-md-6" data-animate="fadeInDown"> -->
<!--             <ul class="menu"> -->
<!--                 <li><a href="#" data-toggle="modal" data-target="#login-modal">Login</a> -->
<!--                 </li> -->
<!--                 <li><a href="user_register">Register</a> -->
<!--                 </li> -->
<!--                 </li> -->

<!--                 <li><a href="contact.html">Contact</a> -->
<!--                 </li> -->
<!--                 <li><a href="#">Recently viewed</a> -->
<!--                 </li> -->
<!--             </ul> -->
<!--         </div> -->
<!--     </div> -->

<!-- 	<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true"> -->
<!-- 	<div class="modal-dialog modal-sm"> -->
<!-- 		<div class="modal-content"> -->
<!-- 			<div class="modal-header"> -->
<!-- 				<button type="button" class="close" data-dismiss="modal" -->
<!-- 					aria-hidden="true">&times;</button> -->
<!-- 				<h4 class="modal-title" id="Login">Customer login</h4> -->
<!-- 			</div> -->
<!-- 			<div class="modal-body"> -->
<!-- 				<form id="login_form_id" action="home" method="POST"> -->
<!-- 					<div class="form-group"> -->
<!-- 						<input type="text" class="form-control" id="email-modal" -->
<!-- 							name="email" placeholder="email" value="" /> -->
<!-- 					</div> -->
<!-- 					<div class="form-group"> -->
<!-- 						<input type="password" class="form-control" id="password-modal" -->
<!-- 							name="password" placeholder="password" value="" /> -->
<!-- 					</div> -->

<!-- 					<p class="text-left"> -->
<!-- 						<input type="checkbox" id="rememberMe_id" name="rememberMe" -->
<!-- 							value="Y" /> Remember me? -->
<!-- 					</p> -->
<!-- 					<p class="text-center"> -->
<!-- 						<button class="btn btn-primary"> -->
<!-- 							<i class="fa fa-sign-in"></i> Log in -->
<!-- 						</button> -->
<!-- 					</p> -->
<!-- 				</form> -->

<!-- 				<p class="text-center text-muted">Not registered yet?</p> -->
<!-- 				<p class="text-center text-muted"> -->
<!-- 					<a href="user_register"><strong>Register now</strong></a>! It is -->
<!-- 					easy and done in 1&nbsp;minute and gives you access to special -->
<!-- 					discounts and much more! -->
<!-- 				</p> -->

<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->

<!-- </div> -->