
<jsp:include page="../template/admin_template/header.jsp" />

<div class="wrapper">

	<jsp:include page="../template/admin_template/banner.jsp" />

	<section class="maincontentsection">
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
		<%
			if (adminusername == null) {
				response.sendRedirect("../index.jsp");
			}
		%>
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-offset-3">
					<div class="col-md-3">
						<div class="adminGenerateReport">
							<a href="GenerateReports.jsp">
								<p>
									<i class="fa fa-pie-chart" aria-hidden="true"></i>
								</p>
							</a>
						</div>
					</div>

					<form action="../ManageAdmin" method="POST">
					<input type="hidden" name="action" value="GENERAGEPDF">
						<div class="col-md-3">
							<div class="adminGenerateReport">
								<button style="width:200px;height:115px;background:#FFFFFF;border:2px solid #FFFFFF;">
									<p>
										<i class="fa fa-file-pdf-o" aria-hidden="true"></i>
									</p>
								</button>
							</div>
						</div>
					</form>

					<div class="col-md-3">
						<div class="adminGenerateReport">
							<a href="generatebarChart.jsp">
								<p>
									<i class="fa fa-bar-chart" aria-hidden="true"></i>
								</p>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<br /> <br /> <br />
	<jsp:include page="../template/admin_template/footer.jsp" />