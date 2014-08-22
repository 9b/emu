<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../docs-assets/ico/favicon.png">

    <title>EMU</title>

    <!-- Bootstrap core CSS -->
    <link href="/static/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

	<link href="/static/css/starter-template.css" rel="stylesheet">

	<link href="/static/css/signin.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="container">

      <div class="form-signin">
        <h2 class="form-signin-heading">EMU Flight Tracker</h2>
		<div id="error" class="alert alert-error">
			<div id="errorMsg"></div>
		</div>
        <input id="invite" type="text" class="form-control" placeholder="Invite code" required autofocus>
        <input id="email" type="text" class="form-control" placeholder="Email" required>
        <input id="password" type="password" class="form-control" placeholder="Password" required>
        
        <button id="register" class="btn btn-lg btn-success btn-block" type="submit">Register</button>
      </div>

    </div> <!-- /container -->

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script src="/static/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="/static/js/signup.js"></script>
	<script>
		var images = ['image1.jpg', 'image2.jpg', 'image3.jpg', 'image4.jpg', 'image5.jpg'];
	    $('body').css({'background-image': 'url(/static/images/' + images[Math.floor(Math.random() * images.length)] + ')'});
	</script>
  </body>
</html>

