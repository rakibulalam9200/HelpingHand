<jsp:include page="../template/admin_template/header.jsp" />
<%@page import="com.helpinghand.serviceImpl.CategoryServiceImpl"%>
<%@page import="com.helpinghand.model.Category"%>
<%
	CategoryServiceImpl categoryservice = new CategoryServiceImpl();
%>

<div class="wrapper">
	<jsp:include page="../template/admin_template/banner.jsp" />
	<section class="maincontentsection">
		<div class="container">
			<%
				String getId = request.getParameter("updateCategory");
				Category category = categoryservice.getCategoryInfo(getId);
			%>

			<div class="row">
				<div class="col-md-10 col-md-offset-2">
					<a
						style="padding: 7px; background: green; color: #FFFFFF; border-radius: 5px; margin-bottom: 10px;"
						href="viewContactDetails.jsp"><i class="fa fa-undo" aria-hidden="true"></i> Back</a>

					<form action="../ManageAdmin" method="POST">
						<input type="hidden" name="action" value="UpdateCategory">

						<input type="hidden" name="getId"
							value="<%=category.getCategoryId()%>">
							
							<input type="hidden" name="getEmail"
							value="<%=category.getCategoryEmail() %>">
							
						<div style="margin-top: 20px;" class="form-group">
							<label for="">Category Name</label> <input type="text"
								class="form-control" name="categoryname"
								aria-describedby="emailHelp"
								value="<%=category.getCategoryName()%>">

						</div>
						<div class="form-group">
							<label>Select Area</label> <select class="form-control"
								name="categorytype">
								<option><%=category.getType()%></option>
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