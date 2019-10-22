<jsp:include page="template/header.jsp" />

<div class="wrapper">
	<section style="height: 32px;" class="bannersection">
		<div class="container">
			<div class="col-md-9 col-md-offset-2"></div>
		</div>
	</section>
	<br /> <br /> <br />
	<section class="maincontentsection">
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
		<%
			if (username == null) {
				response.sendRedirect("login.jsp");
			}
		%>

		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="col-md-3">
						<div class="selectCategory">
							<p style="text-align: center; margin-bottom: 40px;">
								<i class="fa fa-comments" aria-hidden="true"></i>
							</p>
							<h3>
								<a style="font-size: 19px;" href="viewMessage.jsp">View
									Message</a>
							</h3>
						</div>
					</div>
					<div class="col-md-3">
						<div class="selectCategory">
							<p style="text-align: center; margin-bottom: 40px;">
								<i class="fa fa-book" aria-hidden="true"></i>
							</p>
							<h3>
								<a style="font-size: 19px;" href="viewbookpostList.jsp">Book</a>
							</h3>
						</div>
					</div>
					<div class="col-md-3">
						<div class="selectCategory">
							<p style="text-align: center; margin-bottom: 40px;">
								<i class="fa fa-pencil" aria-hidden="true"></i>
							</p>
							<h3>
								<a style="font-size: 19px;" href="viewmatrialpostList.jsp">Education
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
								<a style="font-size: 19px;" href="viewmatrialpostList.jsp">Education
									Assaistant</a>
							</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="template/footer.jsp" />