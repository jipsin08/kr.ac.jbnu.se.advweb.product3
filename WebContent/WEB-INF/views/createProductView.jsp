<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Product</title>
</head>
<body>

	<jsp:include page="_header.jsp"></jsp:include>
	<jsp:include page="_menu.jsp"></jsp:include>

	<h3>Create Product</h3>
	<p style="color: red;">${errorString}</p>
	<form method="POST"
		action="${pageContext.request.contextPath}/createProduct">
		<table border="0">
			<tr>
				<td>Code</td>
				<td><input type="text" name="code" value="${product.code}" /></td>
			</tr>
			<tr>
				<td>Name</td>
				<td><input type="text" name="name" value="${product.name}" /></td>
			</tr>
			<tr>
				<td>Price</td>
				<td><input type="text" name="price" value="${product.price}" /></td>
			</tr>
			
			<tr>
				<td>Brand</td>
				<td><input type="text" name="brand" value="${product.brand}" /></td>
			</tr>
			
			<tr>
				<td>CPU</td>
				<td><input type="text" name="cpu" value="${product.cpu}" /></td>
			</tr>
		
			<tr>
				<td>GraphicCard</td>
				<td><input type="text" name="graphicCard" value="${product.graphicCard}" /></td>
			</tr>
			
<!-- <tr>
				<td>Image</td>
				<td><img name="preview" src="../images/product/noimage.jpg" style="width:100%"><br/>
					<input type="file" name="image" size="30" onchange="filePreview()"></td>
			</tr> -->
			
			<tr>
				<td colspan="2"><input type="submit" value="Submit" /> <a
					href="productList">Cancel</a></td>
			</tr>
		</table>
	</form>

	<jsp:include page="_footer.jsp"></jsp:include>

</body>
</html>