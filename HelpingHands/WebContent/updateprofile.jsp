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
						<div class="row">
							<form>
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

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<br /> <br /> <br /> <br />

	<jsp:include page="template/footer.jsp" />