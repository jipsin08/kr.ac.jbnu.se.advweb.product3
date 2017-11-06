<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="footer" data-animate="fadeInUp">
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-sm-6">
				<h4>페이지</h4>

				<ul>
					<li><a href="${pageContext.request.contextPath}/">홈</a></li>
					<li><a href="${pageContext.request.contextPath}/board">게시판</a></li>
					<li><a href="createProduct">상품등록</a></li>
					<li><a href="${pageContext.request.contextPath}/basket">장바구니</a></li>
				</ul>

				<hr>

				<h4>회원 섹션</h4>

				<ul>
					<li><a href="user_register">로그인 및 회원가입</a></li>
				</ul>

				<hr class="hidden-md hidden-lg hidden-sm">

			</div>
			<!-- /.col-md-3 -->

			<div class="col-md-4 col-sm-6">

				<h4>카테고리별 보기</h4>

				<h5>가격대별</h5>

				<ul>
					<li><a href="${pageContext.request.contextPath}/home?minprice=0&maxprice=200000">20만원 이하</a></li>
					<li><a href="${pageContext.request.contextPath}/home?minprice=200000&maxprice=400000">20만원~40만원</a></li>
					<li><a href="${pageContext.request.contextPath}/home?minprice=400000&maxprice=600000">40만원~60만원</a></li>
					<li><a href="${pageContext.request.contextPath}/home?minprice=600000&maxprice=100000000">60만원 이상</a></li>
				</ul>

				<h5>브랜드별</h5>
				<ul>
					<li><a href="${pageContext.request.contextPath}/home?brand=samsung">삼성</a></li>
					<li><a href="${pageContext.request.contextPath}/home?brand=lg">LG</a></li>
					<li><a href="${pageContext.request.contextPath}/home?brand=asus">ASUS</a></li>
					<li><a href="${pageContext.request.contextPath}/home?brand=dell">DELL</a></li>
					<li><a href="${pageContext.request.contextPath}/home?brand=others">기타</a></li>
				</ul>

				<hr class="hidden-md hidden-lg">

			</div>
			<!-- /.col-md-3 -->

			<div class="col-md-4 col-sm-6">

				<h4>회사 주소</h4>

				<p>
					<strong>(주)쏘공나와</strong> <br>전북 전주시 덕진구 백제대로 567 <br>공과대학 5호관 507호 <br> <br>사업자번호 201-61-033-6 <br> <br>대표번호 010-2734-8901 <br> <br>대표 문봉오
				</p>


				<hr class="hidden-md hidden-lg">

			</div>
			<!-- /.col-md-3 -->



			<!--             <div class="col-md-3 col-sm-6"> -->

			<!--                 <h4>Get the news</h4> -->

			<!--                 <p class="text-muted">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p> -->

			<!--                 <form> -->
			<!--                     <div class="input-group"> -->

			<!--                         <input type="text" class="form-control"> -->

			<!--                         <span class="input-group-btn"> -->

			<!-- 	    <button class="btn btn-default" type="button">Subscribe!</button> -->

			<!-- 	</span> -->

			<!--                     </div> -->
			<!--                     /input-group -->
			<!--                 </form> -->

			<!--                 <hr> -->

			<!--                 <h4>Stay in touch</h4> -->

			<!--                 <p class="social"> -->
			<!--                     <a href="#" class="facebook external" data-animate-hover="shake"><i class="fa fa-facebook"></i></a> -->
			<!--                     <a href="#" class="twitter external" data-animate-hover="shake"><i class="fa fa-twitter"></i></a> -->
			<!--                     <a href="#" class="instagram external" data-animate-hover="shake"><i class="fa fa-instagram"></i></a> -->
			<!--                     <a href="#" class="gplus external" data-animate-hover="shake"><i class="fa fa-google-plus"></i></a> -->
			<!--                     <a href="#" class="email external" data-animate-hover="shake"><i class="fa fa-envelope"></i></a> -->
			<!--                 </p> -->


			<!--             </div> -->
			<!--             /.col-md-3 -->

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->
</div>
<!-- /#footer -->