
<jsp:include page="../template/admin_template/header.jsp" />

<%@page import="com.helpinghand.serviceImpl.MatrialpostServiceImpl"%>
<%@page import="com.helpinghand.model.MaterialPost"%>
<%@page import="com.helpinghand.serviceImpl.LocationServiceImpl"%>
<%@page import="com.helpinghand.serviceImpl.CategoryServiceImpl"%>
<%@page import="com.helpinghand.model.Location"%>
<%@page import="com.helpinghand.model.Category"%>

<%
	LocationServiceImpl locationservice = new LocationServiceImpl();
	CategoryServiceImpl categoryservice = new CategoryServiceImpl();
%>

<%
	MatrialpostServiceImpl materialpostservice = new MatrialpostServiceImpl();
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
		<%
			String id = request.getParameter("updatemateriallist");
			MaterialPost matrialpost = materialpostservice.getMaterialPost(Integer.parseInt(id));
		%>
		<form action="../Manageuser" method="POST">
			<input type="hidden" name="action" value="ADMINUPDATEMATERIALPOST" />
			<input type="hidden" name="sessionname" value="<%=username%>" />
			<div class="container">

				<div class="row">
					<div class="col-md-12">

						<div class="col-md-11 col-md-offset-1">
							<div class="form-group">
								<label>Confrim your post</label> <select class="form-control"
									name="confirm">
									<option value="<%=matrialpost.isUserstatus()%>">Pending</option>
									<option value="true">Pending</option>
									<option value="false">Confirm</option>
								</select>
							</div>
						</div>
						<div class="col-md-4 col-md-offset-1">
							<div class="form-group">
								<label>Select Area</label> <select class="form-control"
									name="area">
									<option><%=matrialpost.getMatrialarea()%></option>
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
									value="<%=matrialpost.getMatrialItemname()%>">

							</div>
							<div class="form-group">
								<label>Brand Name</label> <input type="text"
									class="form-control" name="brandname"
									aria-describedby="emailHelp"
									value="<%=matrialpost.getMatrialBrandname()%>">
							</div>


							<div class="form-group">
								<label>Category</label> <select class="form-control"
									name="category">
									<option><%=matrialpost.getMatrialCategory()%></option>
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
								<textarea class="form-control" rows="5" name="description">
								  <%=matrialpost.getMatrialDescription()%>
								</textarea>
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
													value="<%=matrialpost.getPaidPrice()%>">

											</div>
										</div>

										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
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
													aria-describedby="emailHelp"
													value="<%=matrialpost.getMatrialExitemname()%>">

											</div>
											<div class="form-group">
												<label>Brand Name</label> <input type="text"
													class="form-control" name="brandnameExchange"
													aria-describedby="emailHelp"
													value="<%=matrialpost.getMatrialExbarndname()%>">
											</div>

											<div class="form-group">
												<label>Category</label> <select class="form-control"
													name="categorynameExchange">
													<option><%=matrialpost.getMatrialCategory()%></option>
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
												data-dismiss="modal">Close</button>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label>Contact Number</label> <input type="text"
									class="form-control" name="contactnumber"
									value="<%=matrialpost.getMatrialContactnumber()%>">
							</div>

							<div class="form-group">
								<input type="hidden" name="fileName"
									value="<%=matrialpost.getMatrialImg()%>"> <input
									type="hidden" name="getId"
									value="<%=matrialpost.getMatrialId()%>"><img
									src="uploads/materials/<%=matrialpost.getMatrialImg()%>"
									class="img-rounded" alt="Cinque Terre" width="200px;"
									height="200px;">
							</div>

							<button
								style="width: 200px; border-radius: 6px; height: 40px; margin-right: 10px;"
								type="submit" class="btn btn-primary">Update Post</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</section>
	<jsp:include page="../template/admin_template/footer.jsp" />