
<jsp:include page="template/header.jsp" />

<%@page import="com.helpinghand.serviceImpl.MatrialpostServiceImpl"%>
<%@page import="com.helpinghand.model.MaterialPost"%>

<%
	MatrialpostServiceImpl marialpostservice = new MatrialpostServiceImpl();
%>

<div class="wrapper">
	<section style="height: 32px;" class="bannersection">
		<div class="container">
			<div class="col-md-9 col-md-offset-2"></div>
		</div>
	</section>
	<br /> <br />
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
						href="materrialspost.jsp"><i class="fa fa-plus"
						aria-hidden="true"></i> Add Post</a> <br />
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">SL</th>
								<th scope="col">First</th>
								<th scope="col">Last</th>
								<th scope="col">Handle</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<%
								int countRow = 0;
								for (MaterialPost mpost : marialpostservice.getMaterialpostList(username)) {
									countRow += 1;
							%>
							
							<tr>
								<th scope="row"><%=countRow%></th>
								<td><%=mpost.getMatrialItemname()%></td>
								<td><%=mpost.getMatrialBrandname()%></td>
								<td><%=mpost.getMatrialCategory()%></td>
								<td><a
									style="color: red; font-weight: bold; font-size: 21px;"
									href="Manageuser?deleteMaterialPOST=<%=mpost.getMatrialId()%>"
									Onclick="if (!(confirm('Are you sure you want to delete this post?'))) return false"><i
										style="margin-right: 8px;" class="fa fa-times"
										aria-hidden="true"></i></a> <a
									style="color: green; font-weight: bold; font-size: 21px;"
									href="updatematerialList.jsp?updatemateriallist=<%=mpost.getMatrialId()%>">
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
	<jsp:include page="template/footer.jsp" />