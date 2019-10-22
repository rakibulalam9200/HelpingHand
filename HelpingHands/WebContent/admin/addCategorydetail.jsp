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
					<a
						style="padding: 7px; background: green; color: #FFFFFF; border-radius: 5px; margin-bottom: 10px;"
						href="viewCategory.jsp"><i class="fa fa-undo"
						aria-hidden="true"></i> Back</a>

					<form action="../ManageAdmin" method="POST">
						<input type="hidden" name="action" value="ADDCATEGORY"> <input
							type="hidden" name="email" value="<%=username%>">

						<div style="margin-top: 20px;" class="form-group">
							<label for="">Category Name</label> <input type="text"
								class="form-control" name="categoryname"
								aria-describedby="emailHelp" placeholder="Enter Category Name">

						</div>
						<div class="form-group">
							<label>Select Type</label> <select class="form-control"
								name="categorytype">
								<option></option>
								<option>Book</option>
								<option>Educational Material</option>
								<option>Education Assistant</option>

							</select>
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