<jsp:include page="../template/admin_template/header.jsp" />
<%@page import="com.helpinghand.serviceImpl.AdminServiceImpl"%>
<%@page import="com.helpinghand.model.Admin"%>


<%
	AdminServiceImpl adminService = new AdminServiceImpl();
%>
<div class="wrapper">
	<section class="bannersection">
		<div class="container">
			<div class="row">
				<div class="bannertitle">
					<h3>Registration</h3>
				</div>
			</div>
		</div>
	</section>

	<section class="Viewpostproduct">
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
			<div class="row">
				<div class="col-md-12">
					<div class="col-md-3">
						
					</div>
					<%
					
						Admin admin = adminService.getAdminInfo(adminusername);
					%>
					<div class="col-md-7 col-md-offset-1">
						<div class="row">
							<form action = "../ManageAdmin" method = "post">
							 <input type="hidden" name="action" value="UPDATEADMININFO">
							  <input type="hidden" name="username" value="<%=adminusername %>">
                                <input type="hidden" name="adminId" value="<%=admin.getAdminId() %>">
								<div class="form-group">
									<label for="exampleInputEmail1">User Name</label> <input
										type="text" class="form-control" name="adminname"
										value="<%=admin.getAdminName()%>">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" class="form-control" name="adminpassword"
										value="<%=admin.getAdminPassword() %>>">
								</div>
								
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
	<br />
	<br />
	<br />
	<br />

	<jsp:include page="../template/admin_template/footer.jsp" />