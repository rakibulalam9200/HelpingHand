<jsp:include page="../template/admin_template/header.jsp" />
<%@page import="com.helpinghand.serviceImpl.LocationServiceImpl"%>
<%@page import="com.helpinghand.model.Location"%>
<%
	LocationServiceImpl lcoationservice = new LocationServiceImpl();
%>

<div class="wrapper">
	<jsp:include page="../template/admin_template/banner.jsp" />
	<section class="maincontentsection">
		<div class="container">
			<%
				String getId = request.getParameter("updateLocation");
				Location location = lcoationservice.getLocationInfo(getId);
			%>
			<div class="row">
				<div class="col-md-10 col-md-offset-2">
					<a
						style="padding: 7px; background: green; color: #FFFFFF; border-radius: 5px; margin-bottom: 10px;"
						href="viewlocationDetails.jsp"><i class="fa fa-undo"
						aria-hidden="true"></i> Back</a>
                    <div style="margin-top:15px;"></div>
					<form action="../ManageAdmin" method="POST">
						<input type="hidden" name="action" value="UpdateLocation">
						<input type="hidden" name="getId"
							value="<%=location.getLocationId()%>"> <input
							type="hidden" name="getEmail"
							value="<%=location.getLocationEmail()%>">
						<div class="form-group">
							<label>Enter Location Name</label> <input type="text"
								class="form-control" name="locationname"
								aria-describedby="emailHelp"
								value="<%=location.getLocationName()%>">
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