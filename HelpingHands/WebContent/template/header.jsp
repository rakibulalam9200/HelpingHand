
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>HelpingHand</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- google fonts -->

<!-- Css link -->

<link rel="stylesheet"
	href="<c:url value="/resources/css/animate.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/owl.transitions.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/owl.carousel.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/font-awesome.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/responsive.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/icon.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/image.css"/>">
<link rel="stylesheet"
	href="
<c:url value="/resources/css/preloader.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/lightbox.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/design.css"/>">
</head>
<body id="top">

	<%
		String username = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("username"))
					username = cookie.getValue();
			}
		}
	%>

	<header id="navigation" class="navbar-fixed-top animated-header">
		<div class="container">
			<div class="navbar-header">
				<!-- responsive nav button -->
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!-- /responsive nav button -->

				<!-- logo -->


				<a href="#body"><img
					src="<c:url value="/resources/img/helpinghandlogo.png" />" alt=""></a>



				<!-- /logo -->
			</div>
			<nav class="collapse navbar-collapse navbar-right" role="navigation">
				<ul id="nav" class="nav navbar-nav menu">


					<li><a href="<c:out value="index.jsp" />">Home</a></li>

					<%
						if (username != null) {
					%>
					<li><a
						style="padding: 10px; background: orange; color: #FFFFFF; margin-right: 20px; margin-top: 6px; border-radius: 3px; font-weight: bold; margin-left: 20px;"
						href="<c:out value="userdashboard.jsp" />">Add Post</a></li>
						
					<%
						}
					%>
					<li><a href="<c:out value="viewpost.jsp" />">View Post</a></li>
					<li><a href="<c:out value="contact.jsp" />">Contact</a></li>
					<%
						if (username == null) {
					%>
					<li><a
						style="padding: 10px; background: #80D6A3; color: #FFFFFF; margin-top: 6px; border-radius: 3px; font-weight: bold; margin-left: 20px;"
						href="login.jsp">logIn</a></li>
					<%
						} else {
					%>
					<li><a href="<c:out value="updateprofile.jsp" />"><%=username%></a></li>
					<li><a
						style="padding: 10px; background: #80D6A3; color: #FFFFFF; margin-top: 6px; border-radius: 3px; font-weight: bold; margin-left: 20px; margin-right: 20px;"
						href="<c:url value="/ManageLogout" />">Logout</a></li>
					<%
						}
					%>
				</ul>
			</nav>
		</div>
	</header>