
<jsp:include page="template/header.jsp" />

<%@page import="com.helpinghand.serviceImpl.BookpostServiceImpl"%>
<%@page import="com.helpinghand.serviceImpl.MatrialpostServiceImpl"%>
<%@page import="com.helpinghand.serviceImpl.ManageuserServiceImpl"%>
<%@page import="com.helpinghand.model.BookPost"%>
<%@page import="com.helpinghand.model.MaterialPost"%>
<%@page import="com.helpinghand.model.User"%>

<%
	BookpostServiceImpl marialpostservice = new BookpostServiceImpl();
	MatrialpostServiceImpl matrialpostsevice = new MatrialpostServiceImpl();
	ManageuserServiceImpl manageruserdao = new ManageuserServiceImpl();
%>
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

<body id="top">
	<div class="wrapper">
		<section style="height: 32px;" class="bannersection">
		<div class="container">
			<div class="col-md-9 col-md-offset-2"></div>
		</div>
	</section>
		<%
			String getId = request.getParameter("viewpost");
			BookPost bookpost = marialpostservice.getBookPost(Integer.parseInt(getId));
			MaterialPost mpost = matrialpostsevice.getMaterialPost(Integer.parseInt(getId));
		%>
		<%
			if (username == null) {
				response.sendRedirect("login.jsp");
			}
		%>
		<%
			if (bookpost != null) {
		%>
		<section class="Viewpostproduct">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="col-md-4">
							<%
								User user = manageruserdao.getUserInfo(bookpost.getBookEmail());
							%>
							<div class="customDiv">
								<img
									style="width: 150px; height: 150px; margin-left: 92px; margin-bottom: 20px;"
									src="resources/img/images/profile.png" class="img-circle"
									alt="Cinque Terre">
								<h4 style="text-align: center; margin-bottom: 20px;">
									Name:<%=user.getUserName()%></h4>
								<a style="margin-left: 70px; border-bottom: 1px solid green;"
									href="#"><i class="fa fa-envelope" aria-hidden="true"></i>
									Email: <%=user.getUserEmail()%></a>
								<p style="text-align: center; padding: 7px;">
									<i class="fa fa-globe" aria-hidden="true"></i> Address:
									<%=bookpost.getBookArea()%></p>
								<p style="text-align: center;">
									<i class="fa fa-phone" aria-hidden="true"></i> Contact No:
									<%=bookpost.getBookContactnumber()%></p>
								<Button
									style="height: 30px; margin-top: 20px; background: #80D6A3; color: #FFFFFF; width: 260px; margin-left: 40px; margin-bottom: 20px;"
									data-toggle="modal" data-target="#myModal1" type="button">Send
									Message</Button>
							</div>
						</div>


						<div class="col-md-7 col-md-offset-1">
							<div class="row">
								<form>
									<h3
										style="margin-bottom: 30px; font-size: 22px; font-weight: bold;">
										<i class="fa fa-info" aria-hidden="true"></i> Product Info
									</h3>
									<img style="width: 350px; height: 150px; margin-bottom: 30px;"
										src="uploads/bookpost/<%=bookpost.getBookImg()%>"
										" class=" img-rounded" alt="Cinque Terre">
									<div class="form-group">
										<label for="exampleInputPassword1">Book Author</label> <input
											type="text" class="form-control" id="exampleInputPassword1"
											value="<%=bookpost.getBookAuthername()%>">
									</div>

									<div class="form-group">
										<label for="exampleInputPassword1">Category</label> <input
											type="text" class="form-control" id="exampleInputPassword1"
											value="<%=bookpost.getBookCategory()%>">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">Condition</label> <input
											type="text" class="form-control" id="exampleInputPassword1"
											value="<%=bookpost.getBookCondition()%>">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">Description</label> <input
											type="text" class="form-control" id="exampleInputPassword1"
											value="<%=bookpost.getBookDescription()%>">
									</div>
									<%
										if (bookpost.getBookExchangeoption().equals("Exchange")) {
									%>
									<h3
										style="margin-bottom: 30px; font-size: 22px; font-weight: bold; margin-top: 40px;">
										<i class="fa fa-info" aria-hidden="true"></i> Exchange Info
									</h3>
									<div class="form-group">
										<label for="exampleInputEmail1">Book Name</label> <input
											type="text" class="form-control" id="exampleInputEmail1"
											aria-describedby="emailHelp"
											value="<%=bookpost.getExchangebookName()%>">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">Author Name</label> <input
											type="text" class="form-control" id="exampleInputPassword1"
											value="<%=bookpost.getExchangebookAuthername()%>">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">Publisher Name</label> <input
											type="text" class="form-control" id="exampleInputPassword1"
											value="<%=bookpost.getBookPublishername()%>">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">Category</label> <input
											type="text" class="form-control" id="exampleInputPassword1"
											value="<%=bookpost.getExchangebookCategory()%>">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">Condition</label> <input
											type="text" class="form-control" id="exampleInputPassword1"
											value="<%=bookpost.getExchangebookCondition()%>">
									</div>
									<%
										} else if (bookpost.getBookExchangeoption().equals("Sell")) {
									%>

									<h3
										style="margin-bottom: 30px; font-size: 22px; font-weight: bold; margin-top: 40px;">
										<i class="fa fa-info" aria-hidden="true"></i> Price Info
									</h3>

									<div class="form-group">
										<label for="exampleInputPassword1">Selling Price</label> <input
											type="text" class="form-control" id="exampleInputPassword1"
											value="<%=bookpost.getSellingprice()%>">
									</div>
									<%
										}
									%>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div id="myModal1" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<form>

						<div class="modal-content">
							<div style="background: #80D6A3;" class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 style="color: #FFFFFF;" class="modal-title">
									<i style="font-size: 29px;" class="fa fa-commenting"
										aria-hidden="true"></i> Send Email
								</h4>
							</div>
							<div class="modal-body">
								<div class="form-group">
									<input type="hidden" id="postId"
										value="<%=bookpost.getBookId()%>"> <input
										type="hidden" id="postuseremail"
										value="<%=bookpost.getBookEmail()%>"> <label>Enter
										Email</label> <input type="text" class="form-control" id="email"
										aria-describedby="emailHelp" value="<%=username%>">
								</div>
								<div class="form-group">
									<label for="comment">Comment</label>
									<textarea class="form-control" rows="5" id="comment"></textarea>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" id="HELPME">Send</button>
							</div>
						</div>
					</form>
				</div>
			</div>



		</section>
		<%
			}
		%>


		<%
			if (mpost != null) {
		%>
		<section class="Viewpostproduct">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="col-md-4">

							<%
								User user = manageruserdao.getUserInfo(mpost.getMatrialEmail());
							%>
							<div class="customDiv">
								<img
									style="width: 150px; height: 150px; margin-left: 92px; margin-bottom: 20px;"
									src="resources/img/images/profile.png" class="img-circle"
									alt="Cinque Terre">
								<h4 style="text-align: center; margin-bottom: 20px;">
									Name:<%=user.getUserName()%></h4>
								<a style="margin-left: 70px; border-bottom: 1px solid green;"
									href="#"><i class="fa fa-envelope" aria-hidden="true"></i>
									Email: <%=user.getUserEmail()%></a>
								<p style="text-align: center; padding: 7px;">
									<i class="fa fa-globe" aria-hidden="true"></i> Address:
									<%=mpost.getMatrialarea()%></p>
								<p style="text-align: center;">
									<i class="fa fa-phone" aria-hidden="true"></i> Contact No:
									<%=mpost.getMatrialContactnumber()%></p>


								<Button
									style="height: 30px; margin-top: 20px; background: #80D6A3; color: #FFFFFF; width: 260px; margin-left: 40px; margin-bottom: 20px;"
									data-toggle="modal" data-target="#myModal" type="button">Send
									Message</Button>
							</div>
						</div>


						<div class="col-md-7 col-md-offset-1">
							<div class="row">
								<form>
									<h3
										style="margin-bottom: 30px; font-size: 22px; font-weight: bold;">
										<i class="fa fa-info" aria-hidden="true"></i> Product Info
									</h3>

									<img style="width: 350px; height: 150px; margin-bottom: 30px;"
										src="uploads/materials/<%=mpost.getMatrialImg()%>"
										" class=" img-rounded" alt="Cinque Terre">
									<div class="form-group">
										<label for="exampleInputPassword1">Name</label> <input
											type="text" class="form-control" id="exampleInputPassword1"
											value="<%=mpost.getMatrialItemname()%>">
									</div>

									<div class="form-group">
										<label for="exampleInputPassword1">Category</label> <input
											type="text" class="form-control" id="exampleInputPassword1"
											value="<%=mpost.getMatrialCategory()%>">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">Condition</label> <input
											type="text" class="form-control" id="exampleInputPassword1"
											value="<%=mpost.getMatrialCondition()%>">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">Description</label> <input
											type="text" class="form-control" id="exampleInputPassword1"
											value="<%=mpost.getMatrialDescription()%>">
									</div>

									<%
										if (mpost.getMatrialOption().equals("Exchange")) {
									%>
									<h3
										style="margin-bottom: 30px; font-size: 22px; font-weight: bold; margin-top: 40px;">
										<i class="fa fa-info" aria-hidden="true"></i> Exchange Info
									</h3>
									<div class="form-group">
										<label for="exampleInputEmail1">Name</label> <input
											type="text" class="form-control" id="exampleInputEmail1"
											aria-describedby="emailHelp"
											value="<%=mpost.getMatrialExitemname()%>">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">Category</label> <input
											type="text" class="form-control" id="exampleInputPassword1"
											value="<%=mpost.getMatrialExcategory()%>">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">Condition</label> <input
											type="text" class="form-control" id="exampleInputPassword1"
											value="<%=mpost.getMatrialExcondtion()%>">
									</div>

									<%
										} else if (mpost.getMatrialOption().equals("Sell")) {
									%>

									<h3
										style="margin-bottom: 30px; font-size: 22px; font-weight: bold; margin-top: 40px;">
										<i class="fa fa-info" aria-hidden="true"></i> Price Info
									</h3>

									<div class="form-group">
										<label for="exampleInputPassword1">Selling Price</label> <input
											type="text" class="form-control" id="exampleInputPassword1"
											value="<%=mpost.getPaidPrice()%>">
									</div>
									<%
										}
									%>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>


			<div id="myModal" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<form>

						<div class="modal-content">
							<div style="background: #80D6A3;" class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 style="color: #FFFFFF;" class="modal-title">
									<i style="font-size: 29px;" class="fa fa-commenting"
										aria-hidden="true"></i> Send Email
								</h4>
							</div>
							<div class="modal-body">
								<div class="form-group">

									<input type="hidden" id="postId"
										value="<%=mpost.getMatrialId()%>" /> <input type="hidden"
										id="email" value="<%=mpost.getMatrialEmail()%>" /> <label>Enter
										Email</label> <input type="text" class="form-control" id="email"
										aria-describedby="emailHelp" value="<%=username%>">
								</div>
								<div class="form-group">
									<label for="comment">Comment</label>
									<textarea class="form-control" rows="5" id="comment"></textarea>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" id="HELPME">Send</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</section>
		<%
			}
		%>
		<script src="resources/js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {

				$('#HELPME').click(function() {

					var email = $('#email').val();
					var comment = $('#comment').val();
					var postuseremail = $('#postuseremail').val();
					var postId = $('#postId').val();

					if ($.trim(email) == '') {
						alert("Sorry,Email field must not be empty!!");
					} else if ($.trim(comment) == '') {
						alert("Sorry,Commnet field must not be empty!!");
					} else {

						$.ajax({
							method : 'POST',
							data : {
								email : email,
								comment : comment,
								postuseremail : postuseremail,
								postId : postId,
								action : 'CONTACT_US'
							},
							url : 'Manageuser',
							dataType : "text",
							success : function(result) {
								alert("Send your message");
							}
						});

						return false;
					}

				});

			});
		</script>

		<jsp:include page="template/footer.jsp" />