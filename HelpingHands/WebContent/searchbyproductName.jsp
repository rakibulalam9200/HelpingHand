
<jsp:include page="template/header.jsp" />
<%@page import="com.helpinghand.daoImpl.BookpostDaoImpl"%>
<%@page import="com.helpinghand.daoImpl.MatrialpostDaoImpl"%>
<%@page import="com.helpinghand.model.BookPost"%>
<%@page import="com.helpinghand.model.MaterialPost"%>
<%@page import="com.helpinghand.serviceImpl.LocationServiceImpl"%>
<%@page import="com.helpinghand.serviceImpl.CategoryServiceImpl"%>
<%@page import="com.helpinghand.model.Location"%>
<%@page import="com.helpinghand.model.Category"%>

<%
	BookpostDaoImpl bookpost = new BookpostDaoImpl();
	MatrialpostDaoImpl matrialpost = new MatrialpostDaoImpl();
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
	<section class="Viewpostproduct">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="col-md-3">

						<form action="Manageuser" method="POST">
							<input type="hidden" name="action" value="SEARCH" /> <input
								style="margin-bottom: 20px; width: 220px;" type="text"
								name="searchvalue" placeholder="Search.." name="search">
							<button type="submit">
								<i class="fa fa-search"></i>
							</button>
						</form>

						<div id="accordion" class="panel-group">
							<div class="panel panel-default">
								<div
									style="background: #E4E4E4; border: 1px solid #FFFFFF; height: 45px;"
									class="myheader">
									<span
										style="margin-left: 8px; font-size: 15px; font-weight: bold;">Select
										Area</span> <a href="#pane_1" data-toggle="collapse"
										data-parent="#accordion"> </a>
								</div>
								<div id="pane_1" class="panel-collapse collapse in">
									<div style="border: 1px solid #FFFFFF;" class="panel-body">
										<ul>
											<%
												for (Location location : locationservice.getLocationList()) {
											%>
											<li><a
												href="searchproduct.jsp?getsearchValue=<%=location.getLocationName()%>"><span
													class="glyphicon glyphicon-ok-sign"></span> <%=location.getLocationName()%></a></li>
											<%
												}
											%>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<%
						String getValue = request.getParameter("searchValue");
					%>
					<div class="col-md-9">
						<%
							for (BookPost post : bookpost.searchBookNamepost(getValue)) {
						%>
						<div class="myalignment">
							<div class="row">
								<div class="col-md-3">
									<div class="imagesection">
										<img
											style="height: 113px; width: 170px; height: 90px; margin-top: 12px; margin-left: 11px;"
											src="uploads/bookpost/<%=post.getBookImg()%>"
											class="img-rounded" alt="Cinque Terre" />
									</div>
								</div>
								<div class="col-md-4">
									<div class="productdescription">
										<h4>
											Product Name:
											<%=post.getBookName()%></h4>
										<h6>
											<span class="checkfont">Authername:</span>
											<%=post.getBookAuthername()%>

										</h6>
										<h6>
											<span class="checkfont">Publishername:</span>
											<%=post.getBookPublishername()%>
										</h6>
										<p>
											<span class="checkfont">Category:</span>
											<%=post.getBookCategory()%>
										</p>
									</div>
								</div>
								<div class="col-md-3">
									<div class="productType">
										<h4><%=post.getBookExchangeoption()%></h4>
									</div>
								</div>
								<div class="col-md-2">
									<div class="productView">
										<h3><%=post.getBookExchangeoption()%></h3>
										<p style="margin-left: 10px; margin-bottom: 18px;"><%=post.getBookDate()%></p>
										<a
											href="viewdetailsproduct.jsp?viewpost=<%=post.getBookId()%>">View
											post</a>
									</div>
								</div>
							</div>
						</div>

						<%
							}
						%>

						<%
							for (MaterialPost mpost : matrialpost.searchMaterialNamepost(getValue)) {
						%>
						<div class="myalignment">
							<div class="row">
								<div class="col-md-3">
									<div class="imagesection">
										<img
											style="height: 113px; width: 170px; height: 90px; margin-top: 12px; margin-left: 11px;"
											src="uploads/materials/<%=mpost.getMatrialImg()%>"
											class="img-rounded" alt="Cinque Terre" />
									</div>
								</div>
								<div class="col-md-4">
									<div class="productdescription">
										<h4>
											Item Name:
											<%=mpost.getMatrialItemname()%></h4>
										<h6>
											<span class="checkfont">Brand Name:</span>
											<%=mpost.getMatrialBrandname()%>
										</h6>
										<h6>
											<span class="checkfont">Category:</span>
											<%=mpost.getMatrialCategory()%>
										</h6>
										<br /> <br />
									</div>
								</div>
								<div class="col-md-3">
									<div class="productType">
										<h4><%=mpost.getMatrialOption()%></h4>
									</div>
								</div>
								<div class="col-md-2">
									<div class="productView">
										<h3><%=mpost.getMatrialOption()%></h3>
										<p style="margin-left: 10px; margin-bottom: 18px;"><%=mpost.getMatrialDate()%></p>
										<a
											href="viewdetailsproduct.jsp?viewpost=<%=mpost.getMatrialId()%>">View
											post</a>
									</div>
								</div>
							</div>
						</div>
						<%
							}
						%>
					</div>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="template/footer.jsp" />