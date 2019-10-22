
<jsp:include page="template/header.jsp" />

<%@page import="com.helpinghand.serviceImpl.MessageServiceImpl"%>
<%@page import="com.helpinghand.model.Messageshopkeeper"%>

<%
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
								for (Messageshopkeeper shopkeeper : messageservice.getMessageList(username)) {
									countRow++;
							%>
							<tr>
								<th scope="row"><%=countRow%></th>
								<td><%=shopkeeper.getToemail()%></td>
								<td><%=shopkeeper.getComment()%></td>
								<td><%=shopkeeper.getDate()%></td>
								<td></td>
								<td>
								
								
								<a
									style="color: red; font-weight: bold; font-size: 21px;"
									href="Manageuser?deleteMesssagePOST=<%=shopkeeper.getId()%>"
									Onclick="if (!(confirm('Are you sure you want to delete this post?'))) return false"><i
										style="margin-right: 8px;" class="fa fa-times"
										aria-hidden="true"></i></a>
										
									<%
									if (shopkeeper.getStatus() == 1) {
									%>	
									<a style="color: orange; font-weight: bold; font-size: 23px;"
									href="Manageuser?updateMessage=<%=shopkeeper.getId()%>">
										<i style="margin-right: 8px;" class="fa fa-comments"
										aria-hidden="true"></i>
								</a>
								
								<a style="color: orange; font-weight: bold; font-size: 23px;"
									href="updatebookList.jsp?updatebooklist=<%=shopkeeper.getId()%>">
										<i style="margin-right: 8px;" class="fa fa-share-square"
										aria-hidden="true"></i>
								</a>
								
								
								
								
									<% } %>
										
										
										
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