<jsp:include page="../template/admin_template/header.jsp" />

<%@page import="com.helpinghand.serviceImpl.BookpostServiceImpl"%>
<%@page import="com.helpinghand.model.BookPost"%>
<%@page import="com.helpinghand.serviceImpl.LocationServiceImpl"%>
<%@page import="com.helpinghand.serviceImpl.CategoryServiceImpl"%>
<%@page import="com.helpinghand.model.Location"%>
<%@page import="com.helpinghand.model.Category"%>

<%
	BookpostServiceImpl bookpostservice = new BookpostServiceImpl();
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

		<%
			String id = request.getParameter("updatebooklist");
			BookPost bookpost = bookpostservice.getBookPost(Integer.parseInt(id));
		%>
		<form action="../Manageuser" method="POST">
			<input type="hidden" name="action" value="ADMINUPDATEBOOKPOST" /> <input
				type="hidden" name="sessionname" value="<%=username%>" />
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="col-md-11 col-md-offset-1">
							<div class="form-group">
								<label>Confirm your post</label> <select class="form-control"
									name="confirm">
									<option value="<%=bookpost.isUserstatus()%>">Pending</option>
									<option value="true">Pending</option>
									<option value="false">Confirm</option>
								</select>
							</div>
						</div>
						<div class="col-md-4 col-md-offset-1">
							<div class="form-group">
								<label>Select Area</label> <select class="form-control"
									name="area">
									<option><%=bookpost.getBookArea()%></option>
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
								<label>Name</label> <input type="text" class="form-control"
									name="bookname" aria-describedby="emailHelp"
									value="<%=bookpost.getBookName()%>">

							</div>
							<div class="form-group">
								<label>Author Name</label> <input type="text"
									class="form-control" name="authorname"
									aria-describedby="emailHelp"
									value="<%=bookpost.getBookAuthername()%>">

							</div>

							<div class="form-group">
								<label>Publisher Name</label> <input type="text"
									class="form-control" name="publishername"
									aria-describedby="emailHelp"
									value="<%=bookpost.getBookPublishername()%>">

							</div>
							<div class="form-group">
								<label>Category</label> <select class="form-control"
									name="category">
									<option><%=bookpost.getBookCategory()%></option>
									<option></option>
									<%
										for (Category category : categoryservice.getCategoryList()) {
									%>
									<%
										if (category.getType().equals("Book")) {
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
									     <%=bookpost.getBookDescription()%>
									</textarea>
							</div>

						</div>

						<div class="col-md-6 col-md-offset-1">

							<label>Option</label> <label class="checkbox-inline"><input
								type="radio" name="radio2" value="Donate" checked>Donate</label>
							<label class="checkbox-inline"><input type="radio"
								name="radio2" data-toggle="modal" data-target="#myModal"
								value="Exchange">Exchange</label> <label class="checkbox-inline"><input
								type="radio" name="radio2" data-toggle="modal"
								data-target="#myModalprice" value="Sell">Sell</label>
							<div id="myModalprice" class="modal fade" role="dialog">
								<div class="modal-dialog">
									<!-- Modal content-->
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">Set price</h4>
										</div>
										<div class="modal-body">
											<div class="form-group">
												<label>Enter price</label> <input type="text"
													class="form-control" name="sellingprice"
													aria-describedby="emailHelp"
													value="<%=bookpost.getSellingprice()%>">
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
											<h4 class="modal-title">Exchange option</h4>
										</div>
										<div class="modal-body">
											<div class="form-group">
												<label>Name</label> <input type="text" class="form-control"
													name="exchangebookname" aria-describedby="emailHelp"
													value="<%=bookpost.getExchangebookName()%>">
											</div>
											<div class="form-group">
												<label>Author Name</label> <input type="text"
													class="form-control" name="exchangeauthorname"
													aria-describedby="emailHelp"
													value="<%=bookpost.getExchangebookAuthername()%>">
											</div>

											<div class="form-group">
												<label>Publisher Name</label> <input type="text"
													class="form-control" name="exchangepublishername"
													aria-describedby="emailHelp"
													value="<%=bookpost.getBookPublishername()%>">

											</div>
											<div class="form-group">
												<label>Category</label> <select class="form-control"
													name="exchangecategory">
													<option><%=bookpost.getExchangebookCategory()%></option>
													<option></option>
													<%
														for (Category category : categoryservice.getCategoryList()) {
													%>
													<%
														if (category.getType().equals("Book")) {
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
													type="radio" name="radio3" value="High" checked>High</label>
												<label class="checkbox-inline"><input type="radio"
													name="radio3" value="Moderate">Moderate</label> <label
													class="checkbox-inline"><input type="radio"
													name="radio3" value="Low">Low</label>
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
								<label>Contact</label> <input type="text" class="form-control"
									name="contactnumber"
									value="<%=bookpost.getBookContactnumber()%>">
							</div>
							<div class="form-group">
								<input type="hidden" name="fileName"
									value="<%=bookpost.getBookImg()%>"> <input
									type="hidden" name="getId" value="<%=bookpost.getBookId()%>"><img
									src="../uploads/bookpost/<%=bookpost.getBookImg()%>"
									class="img-rounded" alt="Cinque Terre" width="200px;"
									height="200px;">
							</div>
							<br />
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