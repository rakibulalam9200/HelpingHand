<jsp:include page="../template/admin_template/header.jsp" />
<%@page import="com.helpinghand.serviceImpl.ManageuserServiceImpl"%>
<%@page import="com.helpinghand.model.User"%>


<%
	ManageuserServiceImpl userservice = new ManageuserServiceImpl();
%>

<div class="wrapper">

	<jsp:include page="../template/admin_template/banner.jsp" />
	<section class="maincontentsection">
		<div class="container">
			<div class="row">
				<div class="col-md-11 col-md-offset-1">
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">SL</th>
								<th scope="col">Name</th>
								<th scope="col">Email</th>
								<th scope="col">NID</th>
								<th scope="col">Date</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>

							<%
								int countRow = 0;
								for (User user : userservice.getuserList()) {
									countRow += 1;
							%>
							<tr>
								<th scope="row"><%=countRow%></th>
								<td><%=user.getUserName()%></td>
								<td><%=user.getUserEmail()%></td>
								<td><%=user.getUserNID()%></td>
								<td><%=user.getUserDate()%></td>
								<td><a
									style="color: red; font-weight: bold; font-size: 21px;"
									href="../Manageuser?deleteUserPOST=<%=user.getUserId()%>"
									Onclick="if (!(confirm('Are you sure you want to delete this post?'))) return false"><i
										style="margin-right: 8px;" class="fa fa-times"
										aria-hidden="true"></i></a></td>
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