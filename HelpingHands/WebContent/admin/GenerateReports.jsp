
<%@include file="../template/admin_template/header.jsp"%>

<%@page import="com.helpinghand.serviceImpl.CategoryServiceImpl"%>
<%@page import="com.helpinghand.model.Category"%>
<%
	CategoryServiceImpl categoryservice = new CategoryServiceImpl();
%>

<div id="body-container">
	<div id="body-content">
		<div class="body-nav body-nav-horizontal body-nav-fixed"></div>
		<section
			style="height: 30px; background: #95540B; border-bottom: 2px solid #95540B; margin-top: 24px;"
			class="style-page"></section>
		<%@include file="../template/admin_template/banner.jsp"%>

		<script type="text/javascript"
			src="https://www.gstatic.com/charts/loader.js"></script>
		<script type="text/javascript">
			google.charts.load('current', {
				'packages' : [ 'corechart' ]
			});
			google.charts.setOnLoadCallback(drawChart);
			function drawChart() {
				var data = google.visualization.arrayToDataTable([
						[ 'Gender', 'Number' ],
				
						<%int bookType = 0;
			int matrialType = 0;
			int assistantType = 0;
			for (Category category : categoryservice.getCategoryList()) {
				if (category.getType().equals("Book")) {
					bookType += 1;
				} else if (category.getType().equals("Education Assistant")) {
					assistantType += 1;
				} else if (category.getType().equals("Educational Material")) {
					matrialType += 1;
				}
			}%>
						
		<%out.println("['" + "Book" + "',  " + bookType + "],");%>
		<%out.println("['" + "Education Assistant" + "',  " + assistantType + "],");%>
		<%out.println("['" + "Educational Material" + "',  " + matrialType + "],");%>
		
			]);
				var options = {
					title : 'Post percentage based on type',
					is3D : true,
				// pieHole: 0.4  
				};
				var chart = new google.visualization.PieChart(document
						.getElementById('piechart1_div'));
				chart.draw(data, options);
			}
		</script>

		<div class="container">
			<div class="row col-md-offset-4">


				<div class="col-md-3 col-md-offset-9">
					<div class="button_alignment">
						<div style="margin-bottom: 10px;" class="t"></div>
					</div>
				</div>
				<br /> <br />

				<table class="columns">

					<tr>
						<td><div id="piechart1_div"
								style="border: 1px solid #FFFFFF; width: 520px; height: 300px;"></div></td>
					</tr>
				</table>
				<br /> <br /> <br />
			</div>
		</div>
	</div>
</div>
<%@include file="../template/admin_template/footer.jsp"%>