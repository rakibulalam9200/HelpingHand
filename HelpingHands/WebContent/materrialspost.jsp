
<jsp:include page="template/header.jsp" />
<%@page import="com.helpinghand.serviceImpl.LocationServiceImpl"%>
<%@page import="com.helpinghand.serviceImpl.CategoryServiceImpl"%>
<%@page import="com.helpinghand.model.Location"%>
<%@page import="com.helpinghand.model.Category"%>
<%
	LocationServiceImpl locationservice = new LocationServiceImpl();
	CategoryServiceImpl categoryservice = new CategoryServiceImpl();
%>

<div class="wrapper">
	<section style="height: 32px;" class="bannersection">
		<div class="container">
			<div class="col-md-9 col-md-offset-2"></div>
		</div>
	</section>
	<br />
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

		<form action="Manageuser" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="action" value="ADDMATRIAL" /> <input
				type="hidden" name="sessionname" value="<%=username%>" />
			<div class="container">
				<div class="row">
					<div class="col-md-12">
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
						<div class="col-md-4 col-md-offset-1">
							<div class="form-group">
								<label>Select Area</label> <select class="form-control"
									name="area">
									<option></option>
									<%
										for (Location location : locationservice.getLocationList()) {
									%>
									<option><%=location.getLocationName()%></option>
									<%
										}
									%>
								</select>
							</div>


							<div class="form-group">
								<label>Item Name</label> <input type="text" class="form-control"
									name="itemname" aria-describedby="emailHelp"
									placeholder="Enter Material Name">

							</div>
							<div class="form-group">
								<label>Brand Name</label> <input type="text"
									class="form-control" name="brandname"
									aria-describedby="emailHelp" placeholder="Enter Brand Name">
							</div>


							<div class="form-group">
								<label>Category</label> <select class="form-control"
									name="category">
									<option></option>
									<option style="font-weight: bold; color: red;">Edu
										Materials</option>

									<option></option>
									<option style="font-weight: bold; color: red;">Edu
										Materials</option>


									<option></option>
									<%
										for (Category category : categoryservice.getCategoryList()) {
									%>
									<%
										if (category.getType().equals("Educational Material")) {
									%>
									<option><%=category.getCategoryName()%></option>
									<%
										}
									%>
									<%
										}
									%>



									<option></option>
									<option style="font-weight: bold; color: red;">Edu
										Assistance</option>



									<option></option>
									<%
										for (Category category : categoryservice.getCategoryList()) {
									%>
									<%
										if (category.getType().equals("Education Assistant")) {
									%>
									<option><%=category.getCategoryName()%></option>
									<%
										}
									%>
									<%
										}
									%>


								</select>
							</div>

							<div class="form-group">
								<label>Condition</label> <label class="checkbox-inline"><input
									type="radio" name="radio1" value="High" checked>High</label> <label
									class="checkbox-inline"><input type="radio"
									name="radio1" value="Moderate">Moderate</label> <label
									class="checkbox-inline"><input type="radio"
									name="radio1" value="Low">Low</label>
							</div>


							<div class="form-group">
								<label for="comment">Description</label>
								<textarea class="form-control" rows="5" name="description"></textarea>
							</div>

						</div>
						<div class="col-md-6 col-md-offset-1">

							<label>Option </label> <label class="checkbox-inline"><input
								type="radio" name="radio2" value="Donate" checked>Donate</label>
							<label class="checkbox-inline"> <input type="radio"
								name="radio2" data-toggle="modal" data-target="#myModal"
								value="Exchange">Exchange
							</label> <label class="checkbox-inline"><input type="radio"
								name="radio2" data-toggle="modal" data-target="#myModalprice"
								value="Sell">Sell</label>
							<div id="myModalprice" class="modal fade" role="dialog">
								<div class="modal-dialog">
									<!-- Modal content-->
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">Sell Option</h4>
										</div>
										<div class="modal-body">
											<div class="form-group">
												<label>Enter price</label> <input type="text"
													class="form-control" name="sellprice"
													aria-describedby="emailHelp"
													placeholder="Enter price details">

											</div>
										</div>

										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Save</button>
										</div>
									</div>

								</div>
							</div>

							<div id="myModal" class="modal fade" role="dialog">
								<div class="modal-dialog">
									<!-- Modal content-->
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">Exchange Option</h4>
										</div>
										<div class="modal-body">
											<div class="form-group">
												<label>Item Name</label> <input type="text"
													class="form-control" name="itemnameExchange"
													aria-describedby="emailHelp" placeholder="Enter Material Name">

											</div>
											<div class="form-group">
												<label>Brand Name</label> <input type="text"
													class="form-control" name="brandnameExchange"
													aria-describedby="emailHelp"
													placeholder="Enter Brand Name">
											</div>

											<div class="form-group">
												<label>Category</label> <select class="form-control"
													name="categorynameExchange">
													<option></option>
													<option style="font-weight: bold; color: red;">Edu
														Materials</option>

													<option></option>
													<option style="font-weight: bold; color: red;">Edu
														Materials</option>


													<option></option>
													<%
														for (Category category : categoryservice.getCategoryList()) {
													%>
													<%
														if (category.getType().equals("Educational Material")) {
													%>
													<option><%=category.getCategoryName()%></option>
													<%
														}
													%>
													<%
														}
													%>



													<option></option>
													<option style="font-weight: bold; color: red;">Edu
														Assistance</option>



													<option></option>
													<%
														for (Category category : categoryservice.getCategoryList()) {
													%>
													<%
														if (category.getType().equals("Education Assistant")) {
													%>
													<option><%=category.getCategoryName()%></option>
													<%
														}
													%>
													<%
														}
													%>


												</select>
											</div>


											<div class="form-group">
												<label>Condition</label> <label class="checkbox-inline"><input
													type="radio" name="exradio1" value="High" checked>High</label>
												<label class="checkbox-inline"><input type="radio"
													name="exradio1" value="Moderate">Moderate</label> <label
													class="checkbox-inline"><input type="radio"
													name="exradio1" value="Low">Low</label>
											</div>

										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Save</button>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label>Contact Number</label> <input type="text"
									class="form-control" name="contactnumber"
									placeholder="Enter Contact Name">
							</div>

							<div class="form-group">
								<label>Image</label> <input type="file" class="form-control"
									name="img">
							</div>

							<button
								style="width: 200px; border-radius: 6px; height: 40px; margin-right: 10px;"
								type="submit" class="btn btn-primary">Add Post</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</section>
	<jsp:include page="template/footer.jsp" />