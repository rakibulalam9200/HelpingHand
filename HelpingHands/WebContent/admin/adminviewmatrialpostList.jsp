
<jsp:include page="../template/admin_template/header.jsp" />

<%@page import="com.helpinghand.serviceImpl.MatrialpostServiceImpl"%>
<%@page import="com.helpinghand.model.MaterialPost"%>
<%
	MatrialpostServiceImpl marialpostservice = new MatrialpostServiceImpl();
%>

<div class="wrapper">

<jsp:include page="../template/admin_template/banner.jsp" />
	<br /> <br />
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
		<div class="container">
			<div class="row">
				<div class="col-md-11 col-md-offset-1">
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
					<a
						style="padding: 7px; background: green; color: #FFFFFF; border-radius: 5px; margin-bottom: 10px;"
						href="adminmaterrialspost.jsp"><i class="fa fa-plus"
						aria-hidden="true"></i> Add Post</a> <br />
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">SL</th>
								<th scope="col">Name</th>
								<th scope="col">Brand</th>
								<th scope="col">Category</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<%
								int countRow = 0;
								for (MaterialPost mpost : marialpostservice.getMatrialpostListadmin()) {
									countRow += 1;
							%>
							<tr>
								<th scope="row"><%=countRow%></th>
								<td><%=mpost.getMatrialItemname()%></td>
								<td><%=mpost.getMatrialBrandname()%></td>
								<td><%=mpost.getMatrialCategory()%></td>
								<td><a
									style="color: red; font-weight: bold; font-size: 21px;"
									href="../ManageAdmin?deleteMaterialPOST=<%=mpost.getMatrialId()%>"
									Onclick="if (!(confirm('Are you sure you want to delete this post?'))) return false"><i
										style="margin-right: 8px;" class="fa fa-times"
										aria-hidden="true"></i></a> <a
									style="color: green; font-weight: bold; font-size: 21px;"
									href="adminupdatematerialList.jsp?updatemateriallist=<%=mpost.getMatrialId()%>">
										<i style="margin-right: 8px;" class="fa fa-pencil"
										aria-hidden="true"></i>
								</a></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>
	<br /> <br /> <br />
	<jsp:include page="../template/admin_template/footer.jsp" />