<jsp:include page="template/header.jsp" />
<%@page import="com.helpinghand.serviceImpl.ManageuserServiceImpl"%>
<%@page import="com.helpinghand.model.User"%>


<%
	ManageuserServiceImpl userservice = new ManageuserServiceImpl();
%>
<div class="wrapper">
	<section style="height: 32px;" class="bannersection">
		<div class="container">
			<div class="col-md-9 col-md-offset-2"></div>
		</div>
	</section>
	<br /> <br /> <br />

	<section class="Viewpostproduct">
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
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="col-md-3">
						<div class="customDiv">
							<div class="myAccount">
								<p style="margin-bottom: 10px;">
									<a href="updateprofile.jsp"> <i class="fa fa-user"></i> My
										Acccount
									</a>
								</p>
								<p style="margin-bottom: 10px;">
									<a href="updatemyprofile.jsp"> <i class="fa fa-cog"></i> My
										Settings
									</a>
								</p>
							</div>
						</div>
					</div>
					<%
						User user = userservice.getUserInfo(username);
					%>
					<div class="col-md-7 col-md-offset-1">

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

						<h4 style="text-align: center;">
							Email:
							<%=username%></h4>
						<div class="row">
							<form action="Manageuser" method="POST">
								<input type="hidden" name="action" value="UPDATEMYPROFILE" /> <input
									type="hidden" name="getId" value="<%=user.getUserId()%>" /> <input
									type="hidden" name="sessionname" value="<%=username%>" />
								<div class="form-group">
									<label for="exampleInputEmail1">User Name</label> <input
										type="text" class="form-control" name="name"
										value="<%=user.getUserName()%>">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" class="form-control" name="userpassword"
										value="<%=user.getUserPassword()%>">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">National ID</label> <input
										type="text" class="form-control" name="nid"
										value="<%=user.getUserNID()%>" required>
								</div>
								<br />
								<button
									style="width: 200px; border-radius: 6px; height: 40px; margin-right: 10px;"
									type="submit" class="btn btn-primary">Update</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<br /> <br /> <br /> <br />

	<jsp:include page="template/footer.jsp" />