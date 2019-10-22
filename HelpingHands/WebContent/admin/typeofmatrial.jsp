<jsp:include page="../template/admin_template/header.jsp" />

<div class="wrapper">

	<jsp:include page="../template/admin_template/banner.jsp" />
	
	<br /> <br /> <br />
	<section class="maincontentsection">
		<%
			String username = null;
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for (Cookie cookie : cookies) {
					if (cookie.getName().equals("adminusername"))
						username = cookie.getValue();
				}
			}
		%>
		<%
			if (username == null) {
				response.sendRedirect("login.jsp");
			}
		%>

		<div class="container">
			<div class="row">
				<div class="col-md-12 col-md-offset-2">
					
					<div class="col-md-3">
						<div class="selectCategory">
							<p style="text-align: center; margin-bottom: 40px;">
								<i class="fa fa-book" aria-hidden="true"></i>
							</p>
							<h3>
								<a style="font-size: 19px;" href="adminViewbooklist.jsp">Book</a>
							</h3>
						</div>
					</div>
					<div class="col-md-3">
						<div class="selectCategory">
							<p style="text-align: center; margin-bottom: 40px;">
								<i class="fa fa-pencil" aria-hidden="true"></i>
							</p>
							<h3>
								<a style="font-size: 19px;" href="adminviewmatrialpostList.jsp">Education
									Material</a>
							</h3>
						</div>
					</div>
					<div class="col-md-3">
						<div class="selectCategory">
							<p style="text-align: center; margin-bottom: 40px;">
								<i class="fa fa-home" aria-hidden="true"></i>
							</p>
							<h3>
								<a style="font-size: 19px;" href="adminviewmatrialpostList.jsp">Education
									Assaistant</a>
							</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="../template/admin_template/footer.jsp" />