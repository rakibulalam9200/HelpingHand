
<jsp:include page="template/header.jsp" />

<div class="wrapper">
	<section style="height:32px;" class="bannersection">
		<div class="container">
			<div class="col-md-9 col-md-offset-2"></div>
		</div>
	</section>
	<br /> <br /><br />
		<section class="maincontentsection">
			<div class="container">
				<div class="row">

					
					<div class="col-md-12">

						<div class="col-md-4 col-md-offset-1">

							<img style="height: 500px; width: 300px;"
								src="resources/img/loginImages.jpg"
								class="img-rounded" alt="Cinque Terre" />

						</div>

						<div class="col-md-6">
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

							<form action="Manageuser" method="POST">
								<input type="hidden" name="action" value="USERREGISTRATION" />
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" class="form-control" name="email"
										aria-describedby="emailHelp" placeholder="Enter email"
										required>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Name</label> <input
										type="text" class="form-control" name="name"
										placeholder="name" required>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">National ID</label> <input
										type="password" class="form-control" name="nid"
										placeholder="Enter national ID" required>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" class="form-control" name="userpassowrd"
										placeholder="Enter Password" required>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">RePassword</label> <input
										type="password" class="form-control" name="repassword"
										placeholder="Enter Password Again" required>
								</div>
								<div class="form-check">
									<input type="checkbox" class="form-check-input"
										id="exampleCheck1" required /> <label
										class="form-check-label" for="exampleCheck1">I agree
										to the Terms of Use and <a href="privacy.jsp">Privacy and Policy</a>
									</label>
								</div>
								<br/>
								<button
									style="width: 200px; border-radius: 6px; height: 40px; margin-right: 10px;"
									type="submit" class="btn btn-primary">Submit</button>
								
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
		<jsp:include page="template/footer.jsp" />