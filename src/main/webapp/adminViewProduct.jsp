<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.moumita.service.impl.*,com.moumita.service.*,com.moumita.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<%@page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
<title>View Products</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #E6F9E6;">

	<%
	/* Checking the user credentials */
	String userName = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");
	String userType = (String) session.getAttribute("usertype");

	if (userType == null || !userType.equals("admin")) {

		response.sendRedirect("login.jsp?message=Access Denied, Login as admin!!");

	}

	else if (userName == null || password == null) {

		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");

	}
	ProductServiceImpl prodDao = new ProductServiceImpl();
	List<ProductBean> products = new ArrayList<ProductBean>();

	String search = request.getParameter("search");
	String type = request.getParameter("type");
	String message = "All Products";
	if (search != null) {
		products = prodDao.searchAllProducts(search);
		message = "Showing Results for '" + search + "'";
	} else if (type != null) {
		products = prodDao.getAllProductsByType(type);
		message = "Showing Results for '" + type + "'";
	} else {
		products = prodDao.getAllProducts();
	}
	if (products.isEmpty()) {
		message = "No items found for the search '" + (search != null ? search : type) + "'";
		products = prodDao.getAllProducts();
	}
	%>



	<jsp:include page="header.jsp" />

	<div class="text-center"
		style="color: black; font-size: 14px; font-weight: bold;"><%=message%></div>
	<!-- Start of Product Items List -->
	<div class="container" style="background-color: #E6F9E6;">
		<div class="row text-center">

			<%
			for (ProductBean product : products) {
			%>
			<div class="col-sm-4" style='height: 400px;'>
				<div class="thumbnail" style='height: 98%;'>
					<img src="./ShowImage?pid=<%=product.getProdId()%>" alt="Product"
						style="height: 180px; max-width: 180px;">
					<p class="productname" style="height: 50px; margin-top:2px;"><%=product.getProdName()%>
						(
						<%=product.getProdId()%>
						)
					</p>
					<%
					String description = product.getProdInfo();
					description = description.substring(0, Math.min(description.length(), 100));
					%>
					<p class="productinfo" style="height: 40px"><%=description%>..<!-- %=product.getProdInfo()%--></p>
					<%
						double price = product.getProdPrice();
						DecimalFormat priceFormatter = new DecimalFormat("#0.00");
						priceFormatter.format(price);
    				%>
					<p class="price">
						Rs.
						<%=priceFormatter.format(price)%>
					</p>
					<form method="post">
						<button type="submit"
							formaction="./RemoveProductSrv?prodid=<%=product.getProdId()%>"
							class="btn btn-danger" style="float:left;">Remove</button>
						
						<button type="submit"
							formaction="updateProduct.jsp?prodid=<%=product.getProdId()%>"
							class="btn btn-primary" style="float:right;">Update</button>
					</form>
				</div>
			</div>

			<%
			}
			%>

		</div>
	</div>
	<!-- ENd of Product Items List -->

	<%@ include file="footer.html"%>

</body>
</html>