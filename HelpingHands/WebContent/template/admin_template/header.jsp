
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
	href="<c:url value="../resources/css/animate.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="../resources/css/owl.transitions.css"/>">
<link rel="stylesheet"
	href="<c:url value="./resources/css/owl.carousel.css"/>">
<link rel="stylesheet"
	href="<c:url value="../resources/css/font-awesome.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="../resources/css/responsive.css"/>">
<link rel="stylesheet"
	href="<c:url value="../resources/css/style.css"/>">
<link rel="stylesheet" href="<c:url value="../resources/css/icon.css"/>">
<link rel="stylesheet"
	href="<c:url value="../resources/css/image.css"/>">
<link rel="stylesheet"
	href="
<c:url value="../resources/css/preloader.css"/>">
<link rel="stylesheet"
	href="<c:url value="../resources/css/bootstrap.min.css"/>">

<link rel="stylesheet" href="<c:url value="../resources/css/new.css"/>">

<link rel="stylesheet"
	href="<c:url value="../resources/css/lightbox.css"/>">
<link rel="stylesheet"
	href="<c:url value="../resources/css/design.css"/>">
</head>
<body id="top">


	<header id="navigation" class="navbar-fixed-top animated-header">
		<%
			String adminusername = null;
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for (Cookie cookie : cookies) {
					if (cookie.getName().equals("adminusername"))
						adminusername = cookie.getValue();
				}
			}
		%>

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
					src="<c:url value="../resources/img/helpinghandlogo.png" />" alt=""></a>
				<!-- /logo -->
			</div>
			<!-- main nav -->
			<nav class="collapse navbar-collapse navbar-right" role="navigation">
				<ul id="nav" class="nav navbar-nav">

					<li>
						<div class="dropdown">
							<%
								if (adminusername != null) {
							%>
							<a style="color: black;" href="#" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"><i
								class="fa fa-user" aria-hidden="true"></i> <%=adminusername%></a>


							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<a style="color: black; margin-left: 10px;"
									class="dropdown-item"
									href="upadateadminprofile.jsp?updatename=<%=adminusername%>"><i
									class="fa fa-user" aria-hidden="true"></i> My profile</a><br />
							</div>
							<%
								}
							%>

							<%
								if (adminusername != null) {
							%>
							<a style="color: black; margin-left: 10px;" class="dropdown-item"
								href="../ManageLogout"><i class="fa fa-sign-in"
								aria-hidden="true"></i> Logout</a>
							<%
								}
							%>

						</div>
					</li>


				</ul>
			</nav>
			<!-- /main nav -->
		</div>
	</header>