
<jsp:include page="template/header.jsp" />

<div class="wrapper">
	<section style="height:32px;" class="bannersection">
		<div class="container">
			<div class="col-md-9 col-md-offset-2"></div>
		</div>
	</section>
	<br /> <br /><br />
	<section class="maincontentsection">
		<div class="container">
			<div class="row">

				<div style="background:#827C7C;" class="formtitle">

					<h5 style="font-weight:bold;color:white;text-align:center;">
						<i style="font-size:26px;" class="fa fa-book" aria-hidden="true"></i> Contact with us if have any queries/comments.
					</h5>
				</div>


				<div class="col-md-12">

					<div class="col-md-4 col-md-offset-1">

						<img style="height: auto; width: 100%; height: 420px;"
							src="resources/img/loginImages.jpg""
							class="img-rounded" alt="EducationalBooks" />

					</div>

					<div class="col-md-6">
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

						<form action="Manageuser" method="POST">
							<input type="hidden" name="action" value="USER_CONTACT" />

							<div class="form-group">
								<label for="">Name</label> <input type="text"
									class="form-control" name="name" placeholder="Enter Name" required>

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" name="email"
									aria-describedby="emailHelp" placeholder="Enter email" required>
							</div>

							<div class="form-group">
								<label for="">Your Comment</label>
								<textarea class="form-control" rows="8" name="comment"
									placeholder="Message" required></textarea>
							</div>

							<button
								style="width: 200px; border-radius: 6px; height: 40px; margin-right: 10px; margin-top: 25px; margin-bottom: 50px;"
								type="submit" class="btn btn-primary">Send</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="template/footer.jsp" />