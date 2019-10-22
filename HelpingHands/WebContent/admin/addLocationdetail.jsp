<jsp:include page="../template/admin_template/header.jsp" />
<div class="wrapper">
	<jsp:include page="../template/admin_template/banner.jsp" />
	<section class="maincontentsection">
		<div class="container">
			<div class="row">
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

				<div class="col-md-10 col-md-offset-2">
					<%
						String error = "";
						if (request.getAttribute("error") != null) {
							error = (String) request.getAttribute("error");
					%>
					<div class="alert alert-danger alert-dismissible fade in">
					 <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<strong>Error!</strong><%=error%>
					</div>
					<%
						}
					%>

					<%
						String success = "";
						if (request.getAttribute("success") != null) {
							success = (String) request.getAttribute("success");
					%>
					<div class="alert alert-success alert-dismissible fade in">
					 <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<strong>Success!</strong><%=success%>
					</div>
					<%
						}
					%>
					<a
						style="padding: 7px; background: green; color: #FFFFFF; border-radius: 5px; margin-bottom: 10px;"
						href="adminDashboard.jsp"><i class="fa fa-undo"
						aria-hidden="true"></i> Back</a>
					<div style="margin-top: 15px;"></div>
					<form action="../ManageAdmin" method="POST">
						<input type="hidden" name="action" value="ADDLOCATION"> <input
							type="hidden" name="sessionname" value="<%=username%>">

						<div class="form-group">
							<label>Enter Location Name</label> <input type="text"
								class="form-control" name="locationname"
								aria-describedby="emailHelp" placeholder="Enter location name">
						</div>
						<button
							style="width: 200px; border-radius: 6px; height: 40px; margin-right: 10px;"
							type="submit" class="btn btn-primary">Submit</button>
					</form>
				</div>
			</div>
		</div>
	</section>
	<br /> <br /> <br />

	<jsp:include page="../template/admin_template/footer.jsp" />