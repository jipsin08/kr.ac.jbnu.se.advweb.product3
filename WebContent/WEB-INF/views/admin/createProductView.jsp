<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
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
					<li>상품 등록</li>
				</ul>
			</div>
			<div class="col-md-6">
				<div class="box">
					<h1>상품 등록</h1>
					<p class="lead">
						팔고 싶은 노트북을 등록해보세요!
					</p>
					<p>
						With registration with us new world of fashion, fantastic discounts and much more opens to you! The whole process will not take you more than a minute!
					</p>
					<p class="text-muted">
						 If you have any questions, please feel free to <a href="contact.html">contact us</a>, our customer service center is working for you 24/7.
					</p>
					<hr>
					
					<form action="createProduct" enctype="multipart/form-data" method="post" accept-charset="UTF-8">
						<div class="form-group">
							<label for="name">이름</label>
							<input type="text" name="name" class="form-control" id="name">
						</div>
						<div class="form-group">
							<label for="price">가격</label>
							<input type="text" name="price" class="form-control" id="price">
						</div>
						<div class="form-group">
							<label for="brand">브랜드</label>
							<input type="text" name="brand" class="form-control" id="brand">
						</div>
						<div class="form-group">
							<label for="cpu">CPU</label>
							<input type="text" name="cpu" class="form-control" id="cpu">
						</div>
						<div class="form-group">
							<label for="graphiccard">그래픽카드</label>
							<input type="text" name="graphiccard" class="form-control" id="graphiccard">
						</div>
						<div class="form-group">
							<label for="image">이미지</label>
							<input type="file" name="file" id="imgInp">
  							<img id="blah" src="#" alt="미리보기" style="width:500px;height:300px"/>
						</div>
						
						<div class="form-group">
							<label for="description">상세 설명</label>
							<input type="text" name="description" class="form-control" id="description">
						</div>
						<div class="text-center">
							<input type="submit" class="btn btn-primary" value="상품등록">
						</div>
					</form>
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
<script src="resources/js/respond.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
$(document)
.ready(
    function() {
//         $("#form_createProduct").on('submit', function(e) {
//             $.post('${pageContext.request.contextPath}/createProduct', {
//                     name: $("#name").val(),
//                     price: $("#price").val(),
//                     brand: $("#brand").val(),
//                     cpu: $("#cpu").val(),
//                     graphicCard: $("#graphic-card").val(),
//                     description: $("#description").val(),
//                     image: $("#image").val()
//                 }, function(data) {
//                     // move another page
//                     var win = window.open();
//                     win.document.write(data);
// 						alert(data);
//                 })
//                     .done(
//                                                         function() {
//                                                             alert("성공!");
//                                                             window.location
//                                                                 .replace("${pageContext.request.contextPath}/home");
//                                                         })
//                                                     .fail(
//                                                         function(jqXHR) {
//                                                             alert("실패!");
//                                                             alert("에러메시지" +
//                                                                 jqXHR.responseText);
//                                                         }).always(
//                                                         function() {
//                                                             // 					alert("항상!");
//                                                         });
//         });
        function readURL(input) {
        	  if (input.files && input.files[0]) {
        	    var reader = new FileReader();
        	    reader.onload = function(e) {
        	      $('#blah').attr('src', e.target.result);
        	    }
        	    reader.readAsDataURL(input.files[0]);
        	  }
        }
        	$("#imgInp").change(function() {
        	readURL(this);
        	});
    }); 
</script>
</body>
</html>