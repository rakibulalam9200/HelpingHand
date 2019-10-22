
<jsp:include page="template/header.jsp" />

<%@page import="com.helpinghand.serviceImpl.BookpostServiceImpl"%>
<%@page import="com.helpinghand.serviceImpl.MessageServiceImpl"%>
<%@page import="com.helpinghand.model.BookPost"%>
<%@page import="com.helpinghand.model.Messageshopkeeper"%>

<%
	BookpostServiceImpl bookpostservice = new BookpostServiceImpl();
	MessageServiceImpl messageservice = new MessageServiceImpl();
%>
<div class="wrapper">
	<section style="height: 32px;" class="bannersection">
		<div class="container">
			<div class="col-md-9 col-md-offset-2"></div>
		</div>
	</section>
	<br /> <br /> <br />

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
						href="bookpost.jsp"><i class="fa fa-plus" aria-hidden="true"></i>
						Add Book Post</a> <br />
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">SL</th>
								<th scope="col">First</th>
								<th scope="col">Last</th>
								<th scope="col">Handle</th>
								<th scope="col">Image</th>
								<th scope="col">Action</th>
								<th scope="col">Ensure</th>
							</tr>
						</thead>
						<tbody>
							<%
								int countRow = 0;
								for (BookPost post : bookpostservice.getBookpostList(username)) {
									countRow += 1;
							%>
							<tr>
								<th scope="row"><%=countRow%></th>
								<td><%=post.getBookName()%></td>
								<td><%=post.getBookAuthername()%></td>
								<td><%=post.getBookCategory()%></td>
								<td><img
									style="width: 90px; height: 40px;"
									src="uploads/bookpost/<%=post.getBookImg()%>"
									class="img-rounded" alt="Cinque Terre" /></td>
								<td><a
									style="color: green; font-weight: bold; font-size: 22px;"
									href=""> <i style="margin-right: 8px;"
										class="fa fa-check-circle" aria-hidden="true"></i>
								</a> <a style="color: red; font-weight: bold; font-size: 21px;"
									href="Manageuser?deletebookPOST=<%=post.getBookId()%>"
									Onclick="if (!(confirm('Are you sure you want to delete this post?'))) return false"><i
										style="margin-right: 8px;" class="fa fa-times"
										aria-hidden="true"></i></a> <a
									style="color: green; font-weight: bold; font-size: 21px;"
									href="updatebookList.jsp?updatebooklist=<%=post.getBookId()%>">
										<i style="margin-right: 8px;" class="fa fa-pencil"
										aria-hidden="true"></i>
								</a></td>
								<td>
									<%
										int countMessage = 0;
											for (Messageshopkeeper messageshopkeeper : messageservice.getMessageList(username)) {
												if (messageshopkeeper.getStatus() == 1) {
													countMessage++;
												}
											}
									%> <a style="color: orange; font-weight: bold; font-size: 33px;"
									href="viewMessage.jsp">
										<i style="margin-right: 8px;" class="fa fa-comments"
										aria-hidden="true"><span class="badge badge-danger"><%=countMessage%></span></i>
								</a>





								</td>
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