
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../assets/ico/favicon.ico">

    <title>EMU Flight Tracker</title>

    <!-- Bootstrap core CSS -->
    <link href="/static/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Datepicker CSS -->
    <link href="/static/datetimepicker/build/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    
    <!-- Custom CSS -->
    <link href="/static/css/cover.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
  </head>

  <body>
  
	<div id="holder" class="site-wrapper">
		<div class="site-wrapper-inner">

			<div class="cover-container">

				<div class="masthead clearfix">
					<div class="inner">
						<h3 class="masthead-brand">Early Migration Updates</h3>
						<ul class="nav masthead-nav">
							<li><a href="/register">Register</a></li>
							<li><a href="/flights">Flights</a></li>
							<li><a href="/account">Settings</a></li>
						</ul>
					</div>
				</div>

				<div class="inner cover">
					<h1 class="cover-heading">Your Flights</h1>
				    <table class="table table-hover table-bordered">
				        <tr>
				            <th>Tail ID</th>
				            <th>Departure</th>
				            <th>Status</th>
				        </tr>
						% for flight in flights:
						<tr>
							<td>{{flight['tailId']}}</td>
							<td>{{flight['departureStr']}}</td>
							<td>{{flight['status']}}</td>
						</tr>
						% end
				    </table>
				</div>

			</div>
		</div>
	</div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="/static/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="/static/moment/moment.min.js"></script>
    <script src="/static/datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
    
    <script>
    	$('#dpick').datetimepicker();

    	var images = ['image1.jpg', 'image2.jpg', 'image3.jpg', 'image4.jpg', 'image5.jpg'];
    	$('#holder').css({'background-image': 'url(/static/images/' + images[Math.floor(Math.random() * images.length)] + ')'});
    </script>
  </body>
</html>
