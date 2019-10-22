
<jsp:include page="../template/admin_template/header.jsp" />

<%@page import="com.helpinghand.serviceImpl.BookpostServiceImpl"%>
<%@page import="com.helpinghand.model.BookPost"%>

<%
	BookpostServiceImpl bookpostservice = new BookpostServiceImpl();
%>
<div class="wrapper">
	<jsp:include page="../template/admin_template/banner.jsp" />
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
						String success = "";
						if (request.getParameter("success") != null) {
							success = (String) request.getParameter("success");
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
						href="adminaddbooklist.jsp"><i class="fa fa-plus"
						aria-hidden="true"></i> Add Book Post</a> <br />
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">SL</th>
								<th scope="col">Name</th>
								<th scope="col">Author Name</th>
								<th scope="col">Category</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<%
								int countRow = 0;
								for (BookPost post : bookpostservice.getBookpostListadmin()) {
									countRow += 1;
							%>
							<tr>
								<th scope="row"><%=countRow%></th>
								<td><%=post.getBookName()%></td>
								<td><%=post.getBookAuthername()%></td>
								<td><%=post.getBookCategory()%></td>
								<td><a
									style="color: red; font-weight: bold; font-size: 21px;"
									href="../ManageAdmin?deletebookPOST=<%=post.getBookId()%>"
									Onclick="if (!(confirm('Are you sure you want to delete this post?'))) return false"><i
										style="margin-right: 8px;" class="fa fa-times"
										aria-hidden="true"></i></a> <a
									style="color: green; font-weight: bold; font-size: 21px;"
									href="adminupdatebookList.jsp?updatebooklist=<%=post.getBookId()%>">
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