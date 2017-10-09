<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Info</title>


<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<script>
	$(document).ready(function() {
	});
	
	function showUserInfo()
	{
		$.get("${pageContext.request.contextPath}/userInfo", 
			{
				more : "Yes"
			}, function(data) {
			$('#additioalUserInfo').html(data);
		});
	}
</script>


</head>
<body>

	<jsp:include page="_header.jsp"></jsp:include>
	<jsp:include page="_menu.jsp"></jsp:include>

	<h3>Hello: ${user.userName}</h3>

	User Name:
	<b>${user.userName}</b>
	<br /> Gender: ${user.gender }
	<br />

	<a href="javascript:void(0);" onclick="javascript:showUserInfo();">Show More</a>
	<div id="additioalUserInfo"></div>
	
	<jsp:include page="_footer.jsp"></jsp:include>

</body>
</html>