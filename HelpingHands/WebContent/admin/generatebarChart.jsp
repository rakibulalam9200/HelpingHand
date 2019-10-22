
<%@include file="../template/admin_template/header.jsp"%>

<%@page import="com.helpinghand.serviceImpl.LocationServiceImpl"%>
<%@page import="com.helpinghand.serviceImpl.BookpostServiceImpl"%>
<%@page import="com.helpinghand.serviceImpl.MatrialpostServiceImpl"%>
<%@page import="com.helpinghand.model.Location"%>
<%@page import="com.helpinghand.model.BookPost"%>
<%@page import="com.helpinghand.model.MaterialPost"%>

<%
	LocationServiceImpl locationservice = new LocationServiceImpl();
	BookpostServiceImpl bookpostservice = new BookpostServiceImpl();
	MatrialpostServiceImpl matrialservice = new MatrialpostServiceImpl();
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
						[ 'Location', 'Number of post' ],
				
			<%for (Location location : locationservice.getLocationList()) {
				int count = 0;
				for (BookPost bookpost : bookpostservice.getBookpostListadmin()) {
					if (location.getLocationName().equals(bookpost.getBookArea())) {
						count++;
					}
				}
				for (MaterialPost materialPost : matrialservice.getMatrialpostListadmin()) {
					if (location.getLocationName().equals(materialPost.getMatrialarea())) {
						count++;
					}
				}%>
			  <%out.println("['" + location.getLocationName() + "',  " + count + "],");%>     
		<%}%>
		
			]);
				var options = {
					title : 'Number of post by locations',
					is3D : true,
				// pieHole: 0.4  
				};
				var chart = new google.visualization.BarChart(document
						.getElementById('piechart1_div'));
				chart.draw(data, options);
			}
		</script>
		<div class="container">
			<div class="row col-md-offset-3">
				<div class="col-md-3 col-md-offset-9">
					<div class="button_alignment">
						<div style="margin-bottom: 10px;" class="t"></div>
					</div>
				</div>
				<br /> <br />
				<table class="columns">
					<tr>
						<td><div id="piechart1_div"
								style="border: 1px solid #FFFFFF; width: 700px; height: 300px;"></div></td>
					</tr>
				</table>
				<br /> <br /> <br />
			</div>
		</div>
	</div>
</div>
<%@include file="../template/admin_template/footer.jsp"%>