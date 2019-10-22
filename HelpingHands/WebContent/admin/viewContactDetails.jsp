<%@page import="com.helpinghand.service.Contactservice"%>
<jsp:include page="../template/admin_template/header.jsp" />
<%@page import="com.helpinghand.serviceImpl.ContactserviceImpl"%>
<%@page import="com.helpinghand.model.ContactInfo"%>


<%
	ContactserviceImpl contactservice = new ContactserviceImpl();
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
								<th scope="col">Message</th>
								<th scope="col">Date</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>

							<%
								int countRow = 0;
								for (ContactInfo contactInfo : contactservice.getContractinfo()) {
									countRow += 1;
							%>
							<tr>
								<th scope="row"><%=countRow%></th>
								<td><%=contactInfo.getContactName()%></td>
								<td><%=contactInfo.getContactEmail()%></td>
								<td><%=contactInfo.getContactMessage()%></td>
								<td><%=contactInfo.getContactDate()%></td>
								<td><a
									style="color: red; font-weight: bold; font-size: 21px;"
									href="../Manageuser?deleteContactPOST=<%=contactInfo.getContactId()%>"
									Onclick="if (!(confirm('Are you sure you want to delete this post?'))) return false"><i
										style="margin-right: 8px;" class="fa fa-times"
										aria-hidden="true"></i></a> <a
									style="color: green; font-weight: bold; font-size: 21px;"
									href="sendemail.jsp?sendEmail=<%=contactInfo.getContactId()%>"><i
										style="margin-right: 8px;" class="fa fa-share-square"
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