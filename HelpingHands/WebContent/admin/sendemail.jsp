
<jsp:include page="../template/admin_template/header.jsp" />
<%@page import="com.helpinghand.serviceImpl.ContactserviceImpl"%>
<%@page import="com.helpinghand.model.ContactInfo"%>
<%@page import="com.helpinghand.model.ContactInfo"%>


<%
ContactserviceImpl contactservice = new ContactserviceImpl();
%>

<div class="wrapper">

	<jsp:include page="../template/admin_template/banner.jsp" />
	<section class="maincontentsection">
		<div class="container">
			<div class="row">
			<%
			String getValue=request.getParameter("sendEmail");
			 ContactInfo contactInfo= contactservice.getContactInfo(Integer.parseInt(getValue));
			
			
			%>
				<div class="col-md-11 col-md-offset-1">

					<form action="../ManageAdmin" method="POST">
					<input type="hidden" name="action" value="SENDEMAIL">
						<div class="form-group">
							<label for="email">Email address:</label> <input type="email"
								class="form-control" name="email" value="<%=contactInfo.getContactEmail() %>">
						</div>
						<div class="form-group">
							<label for="comment">Comment:</label>
							<textarea class="form-control" rows="5" name="comment"></textarea>
						</div>
						<button type="submit" class="btn btn-default">Send</button>
					</form>
				</div>
			</div>
		</div>
	</section>
	<br /> <br /> <br />
	<jsp:include page="../template/admin_template/footer.jsp" />