
<jsp:include page="template/header.jsp" />

<%@page import="com.helpinghand.serviceImpl.ManageuserServiceImpl"%>

<%
	ManageuserServiceImpl manageservice = new ManageuserServiceImpl();
%>

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
				<div style="background:#827C7C;" class="formtitle">
					<h5 style="font-weight:bold;color:white;text-align:center;">
						<i style="font-size:26px;" class="fa fa-book" aria-hidden="true"></i> Please, Register yourself before long in
						in the system. Enter your Valid Email Address and Password for Log in
					</h5>
				</div>

				<div class="col-md-12">
					<div class="col-md-5 col-md-offset-1">
						<img style="height: auto; width: 100%; height: 362px;"
							src="resources/img/loginImages.jpg"
							class="img-rounded" alt="EducationalBooks" />

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
							<input type="hidden" name="action" value="LOGIN">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" name="email"
									aria-describedby="emailHelp" placeholder="Enter email" required>
								
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" name="password"
									placeholder="Password" required>
							</div>
							<div class="form-check">
								<a href="forgotpassowrd.jsp">Forgot
										Password?</a></span>
							</div>
							<button
								style="width: 200px; border-radius: 6px; height: 40px; margin-right: 10px; margin-top: 25px; margin-bottom: 50px;"
								type="submit" class="btn btn-primary">LOGIN</button>
							<div class="form-check">
								<span class="registratoinreminder"> Don't have an
									account?<a href="registration.jsp"> Register Now!</a>
								</span>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
<jsp:include page="template/footer.jsp" />