
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
					<h1 class="cover-heading">Register Your Flight!</h1>
					<form class="navbar-form" role="form">
						<div class="form-group">
							<input id="tailId" type="text" placeholder="Code (ex. UA1337)" class="form-control">
						</div>
						<div class="form-group">
							<input id='departure' type="text" placeholder="Departure Date" class="form-control">
						</div>
						<div class="form-group">
							<select id="timezones" class="form-control">
								<option>Africa/Abidjan</option>
								<option>Africa/Accra</option>
								<option>Africa/Addis_Ababa</option>
								<option>Africa/Algiers</option>
								<option>Africa/Asmara</option>
								<option>Africa/Bamako</option>
								<option>Africa/Bangui</option>
								<option>Africa/Banjul</option>
								<option>Africa/Bissau</option>
								<option>Africa/Blantyre</option>
								<option>Africa/Brazzaville</option>
								<option>Africa/Bujumbura</option>
								<option>Africa/Cairo</option>
								<option>Africa/Casablanca</option>
								<option>Africa/Ceuta</option>
								<option>Africa/Conakry</option>
								<option>Africa/Dakar</option>
								<option>Africa/Dar_es_Salaam</option>
								<option>Africa/Djibouti</option>
								<option>Africa/Douala</option>
								<option>Africa/El_Aaiun</option>
								<option>Africa/Freetown</option>
								<option>Africa/Gaborone</option>
								<option>Africa/Harare</option>
								<option>Africa/Johannesburg</option>
								<option>Africa/Juba</option>
								<option>Africa/Kampala</option>
								<option>Africa/Khartoum</option>
								<option>Africa/Kigali</option>
								<option>Africa/Kinshasa</option>
								<option>Africa/Lagos</option>
								<option>Africa/Libreville</option>
								<option>Africa/Lome</option>
								<option>Africa/Luanda</option>
								<option>Africa/Lubumbashi</option>
								<option>Africa/Lusaka</option>
								<option>Africa/Malabo</option>
								<option>Africa/Maputo</option>
								<option>Africa/Maseru</option>
								<option>Africa/Mbabane</option>
								<option>Africa/Mogadishu</option>
								<option>Africa/Monrovia</option>
								<option>Africa/Nairobi</option>
								<option>Africa/Ndjamena</option>
								<option>Africa/Niamey</option>
								<option>Africa/Nouakchott</option>
								<option>Africa/Ouagadougou</option>
								<option>Africa/Porto-Novo</option>
								<option>Africa/Sao_Tome</option>
								<option>Africa/Tripoli</option>
								<option>Africa/Tunis</option>
								<option>Africa/Windhoek</option>
								<option>America/Adak</option>
								<option>America/Anchorage</option>
								<option>America/Anguilla</option>
								<option>America/Antigua</option>
								<option>America/Araguaina</option>
								<option>America/Argentina/Buenos_Aires</option>
								<option>America/Argentina/Catamarca</option>
								<option>America/Argentina/Cordoba</option>
								<option>America/Argentina/Jujuy</option>
								<option>America/Argentina/La_Rioja</option>
								<option>America/Argentina/Mendoza</option>
								<option>America/Argentina/Rio_Gallegos</option>
								<option>America/Argentina/Salta</option>
								<option>America/Argentina/San_Juan</option>
								<option>America/Argentina/San_Luis</option>
								<option>America/Argentina/Tucuman</option>
								<option>America/Argentina/Ushuaia</option>
								<option>America/Aruba</option>
								<option>America/Asuncion</option>
								<option>America/Atikokan</option>
								<option>America/Bahia</option>
								<option>America/Bahia_Banderas</option>
								<option>America/Barbados</option>
								<option>America/Belem</option>
								<option>America/Belize</option>
								<option>America/Blanc-Sablon</option>
								<option>America/Boa_Vista</option>
								<option>America/Bogota</option>
								<option>America/Boise</option>
								<option>America/Cambridge_Bay</option>
								<option>America/Campo_Grande</option>
								<option>America/Cancun</option>
								<option>America/Caracas</option>
								<option>America/Cayenne</option>
								<option>America/Cayman</option>
								<option>America/Chicago</option>
								<option>America/Chihuahua</option>
								<option>America/Costa_Rica</option>
								<option>America/Creston</option>
								<option>America/Cuiaba</option>
								<option>America/Curacao</option>
								<option>America/Danmarkshavn</option>
								<option>America/Dawson</option>
								<option>America/Dawson_Creek</option>
								<option>America/Denver</option>
								<option>America/Detroit</option>
								<option>America/Dominica</option>
								<option>America/Edmonton</option>
								<option>America/Eirunepe</option>
								<option>America/El_Salvador</option>
								<option>America/Fortaleza</option>
								<option>America/Glace_Bay</option>
								<option>America/Godthab</option>
								<option>America/Goose_Bay</option>
								<option>America/Grand_Turk</option>
								<option>America/Grenada</option>
								<option>America/Guadeloupe</option>
								<option>America/Guatemala</option>
								<option>America/Guayaquil</option>
								<option>America/Guyana</option>
								<option>America/Halifax</option>
								<option>America/Havana</option>
								<option>America/Hermosillo</option>
								<option>America/Indiana/Indianapolis</option>
								<option>America/Indiana/Knox</option>
								<option>America/Indiana/Marengo</option>
								<option>America/Indiana/Petersburg</option>
								<option>America/Indiana/Tell_City</option>
								<option>America/Indiana/Vevay</option>
								<option>America/Indiana/Vincennes</option>
								<option>America/Indiana/Winamac</option>
								<option>America/Inuvik</option>
								<option>America/Iqaluit</option>
								<option>America/Jamaica</option>
								<option>America/Juneau</option>
								<option>America/Kentucky/Louisville</option>
								<option>America/Kentucky/Monticello</option>
								<option>America/Kralendijk</option>
								<option>America/La_Paz</option>
								<option>America/Lima</option>
								<option>America/Los_Angeles</option>
								<option>America/Lower_Princes</option>
								<option>America/Maceio</option>
								<option>America/Managua</option>
								<option>America/Manaus</option>
								<option>America/Marigot</option>
								<option>America/Martinique</option>
								<option>America/Matamoros</option>
								<option>America/Mazatlan</option>
								<option>America/Menominee</option>
								<option>America/Merida</option>
								<option>America/Metlakatla</option>
								<option>America/Mexico_City</option>
								<option>America/Miquelon</option>
								<option>America/Moncton</option>
								<option>America/Monterrey</option>
								<option>America/Montevideo</option>
								<option>America/Montreal</option>
								<option>America/Montserrat</option>
								<option>America/Nassau</option>
								<option>America/New_York</option>
								<option>America/Nipigon</option>
								<option>America/Nome</option>
								<option>America/Noronha</option>
								<option>America/North_Dakota/Beulah</option>
								<option>America/North_Dakota/Center</option>
								<option>America/North_Dakota/New_Salem</option>
								<option>America/Ojinaga</option>
								<option>America/Panama</option>
								<option>America/Pangnirtung</option>
								<option>America/Paramaribo</option>
								<option>America/Phoenix</option>
								<option>America/Port-au-Prince</option>
								<option>America/Port_of_Spain</option>
								<option>America/Porto_Velho</option>
								<option>America/Puerto_Rico</option>
								<option>America/Rainy_River</option>
								<option>America/Rankin_Inlet</option>
								<option>America/Recife</option>
								<option>America/Regina</option>
								<option>America/Resolute</option>
								<option>America/Rio_Branco</option>
								<option>America/Santa_Isabel</option>
								<option>America/Santarem</option>
								<option>America/Santiago</option>
								<option>America/Santo_Domingo</option>
								<option>America/Sao_Paulo</option>
								<option>America/Scoresbysund</option>
								<option>America/Sitka</option>
								<option>America/St_Barthelemy</option>
								<option>America/St_Johns</option>
								<option>America/St_Kitts</option>
								<option>America/St_Lucia</option>
								<option>America/St_Thomas</option>
								<option>America/St_Vincent</option>
								<option>America/Swift_Current</option>
								<option>America/Tegucigalpa</option>
								<option>America/Thule</option>
								<option>America/Thunder_Bay</option>
								<option>America/Tijuana</option>
								<option>America/Toronto</option>
								<option>America/Tortola</option>
								<option>America/Vancouver</option>
								<option>America/Whitehorse</option>
								<option>America/Winnipeg</option>
								<option>America/Yakutat</option>
								<option>America/Yellowknife</option>
								<option>Antarctica/Casey</option>
								<option>Antarctica/Davis</option>
								<option>Antarctica/DumontDUrville</option>
								<option>Antarctica/Macquarie</option>
								<option>Antarctica/Mawson</option>
								<option>Antarctica/McMurdo</option>
								<option>Antarctica/Palmer</option>
								<option>Antarctica/Rothera</option>
								<option>Antarctica/Syowa</option>
								<option>Antarctica/Vostok</option>
								<option>Arctic/Longyearbyen</option>
								<option>Asia/Aden</option>
								<option>Asia/Almaty</option>
								<option>Asia/Amman</option>
								<option>Asia/Anadyr</option>
								<option>Asia/Aqtau</option>
								<option>Asia/Aqtobe</option>
								<option>Asia/Ashgabat</option>
								<option>Asia/Baghdad</option>
								<option>Asia/Bahrain</option>
								<option>Asia/Baku</option>
								<option>Asia/Bangkok</option>
								<option>Asia/Beirut</option>
								<option>Asia/Bishkek</option>
								<option>Asia/Brunei</option>
								<option>Asia/Choibalsan</option>
								<option>Asia/Chongqing</option>
								<option>Asia/Colombo</option>
								<option>Asia/Damascus</option>
								<option>Asia/Dhaka</option>
								<option>Asia/Dili</option>
								<option>Asia/Dubai</option>
								<option>Asia/Dushanbe</option>
								<option>Asia/Gaza</option>
								<option>Asia/Harbin</option>
								<option>Asia/Hebron</option>
								<option>Asia/Ho_Chi_Minh</option>
								<option>Asia/Hong_Kong</option>
								<option>Asia/Hovd</option>
								<option>Asia/Irkutsk</option>
								<option>Asia/Jakarta</option>
								<option>Asia/Jayapura</option>
								<option>Asia/Jerusalem</option>
								<option>Asia/Kabul</option>
								<option>Asia/Kamchatka</option>
								<option>Asia/Karachi</option>
								<option>Asia/Kashgar</option>
								<option>Asia/Kathmandu</option>
								<option>Asia/Khandyga</option>
								<option>Asia/Kolkata</option>
								<option>Asia/Krasnoyarsk</option>
								<option>Asia/Kuala_Lumpur</option>
								<option>Asia/Kuching</option>
								<option>Asia/Kuwait</option>
								<option>Asia/Macau</option>
								<option>Asia/Magadan</option>
								<option>Asia/Makassar</option>
								<option>Asia/Manila</option>
								<option>Asia/Muscat</option>
								<option>Asia/Nicosia</option>
								<option>Asia/Novokuznetsk</option>
								<option>Asia/Novosibirsk</option>
								<option>Asia/Omsk</option>
								<option>Asia/Oral</option>
								<option>Asia/Phnom_Penh</option>
								<option>Asia/Pontianak</option>
								<option>Asia/Pyongyang</option>
								<option>Asia/Qatar</option>
								<option>Asia/Qyzylorda</option>
								<option>Asia/Rangoon</option>
								<option>Asia/Riyadh</option>
								<option>Asia/Sakhalin</option>
								<option>Asia/Samarkand</option>
								<option>Asia/Seoul</option>
								<option>Asia/Shanghai</option>
								<option>Asia/Singapore</option>
								<option>Asia/Taipei</option>
								<option>Asia/Tashkent</option>
								<option>Asia/Tbilisi</option>
								<option>Asia/Tehran</option>
								<option>Asia/Thimphu</option>
								<option>Asia/Tokyo</option>
								<option>Asia/Ulaanbaatar</option>
								<option>Asia/Urumqi</option>
								<option>Asia/Ust-Nera</option>
								<option>Asia/Vientiane</option>
								<option>Asia/Vladivostok</option>
								<option>Asia/Yakutsk</option>
								<option>Asia/Yekaterinburg</option>
								<option>Asia/Yerevan</option>
								<option>Atlantic/Azores</option>
								<option>Atlantic/Bermuda</option>
								<option>Atlantic/Canary</option>
								<option>Atlantic/Cape_Verde</option>
								<option>Atlantic/Faroe</option>
								<option>Atlantic/Madeira</option>
								<option>Atlantic/Reykjavik</option>
								<option>Atlantic/South_Georgia</option>
								<option>Atlantic/St_Helena</option>
								<option>Atlantic/Stanley</option>
								<option>Australia/Adelaide</option>
								<option>Australia/Brisbane</option>
								<option>Australia/Broken_Hill</option>
								<option>Australia/Currie</option>
								<option>Australia/Darwin</option>
								<option>Australia/Eucla</option>
								<option>Australia/Hobart</option>
								<option>Australia/Lindeman</option>
								<option>Australia/Lord_Howe</option>
								<option>Australia/Melbourne</option>
								<option>Australia/Perth</option>
								<option>Australia/Sydney</option>
								<option>Canada/Atlantic</option>
								<option>Canada/Central</option>
								<option>Canada/Eastern</option>
								<option>Canada/Mountain</option>
								<option>Canada/Newfoundland</option>
								<option>Canada/Pacific</option>
								<option>Europe/Amsterdam</option>
								<option>Europe/Andorra</option>
								<option>Europe/Athens</option>
								<option>Europe/Belgrade</option>
								<option>Europe/Berlin</option>
								<option>Europe/Bratislava</option>
								<option>Europe/Brussels</option>
								<option>Europe/Bucharest</option>
								<option>Europe/Budapest</option>
								<option>Europe/Busingen</option>
								<option>Europe/Chisinau</option>
								<option>Europe/Copenhagen</option>
								<option>Europe/Dublin</option>
								<option>Europe/Gibraltar</option>
								<option>Europe/Guernsey</option>
								<option>Europe/Helsinki</option>
								<option>Europe/Isle_of_Man</option>
								<option>Europe/Istanbul</option>
								<option>Europe/Jersey</option>
								<option>Europe/Kaliningrad</option>
								<option>Europe/Kiev</option>
								<option>Europe/Lisbon</option>
								<option>Europe/Ljubljana</option>
								<option>Europe/London</option>
								<option>Europe/Luxembourg</option>
								<option>Europe/Madrid</option>
								<option>Europe/Malta</option>
								<option>Europe/Mariehamn</option>
								<option>Europe/Minsk</option>
								<option>Europe/Monaco</option>
								<option>Europe/Moscow</option>
								<option>Europe/Oslo</option>
								<option>Europe/Paris</option>
								<option>Europe/Podgorica</option>
								<option>Europe/Prague</option>
								<option>Europe/Riga</option>
								<option>Europe/Rome</option>
								<option>Europe/Samara</option>
								<option>Europe/San_Marino</option>
								<option>Europe/Sarajevo</option>
								<option>Europe/Simferopol</option>
								<option>Europe/Skopje</option>
								<option>Europe/Sofia</option>
								<option>Europe/Stockholm</option>
								<option>Europe/Tallinn</option>
								<option>Europe/Tirane</option>
								<option>Europe/Uzhgorod</option>
								<option>Europe/Vaduz</option>
								<option>Europe/Vatican</option>
								<option>Europe/Vienna</option>
								<option>Europe/Vilnius</option>
								<option>Europe/Volgograd</option>
								<option>Europe/Warsaw</option>
								<option>Europe/Zagreb</option>
								<option>Europe/Zaporozhye</option>
								<option>Europe/Zurich</option>
								<option>Indian/Antananarivo</option>
								<option>Indian/Chagos</option>
								<option>Indian/Christmas</option>
								<option>Indian/Cocos</option>
								<option>Indian/Comoro</option>
								<option>Indian/Kerguelen</option>
								<option>Indian/Mahe</option>
								<option>Indian/Maldives</option>
								<option>Indian/Mauritius</option>
								<option>Indian/Mayotte</option>
								<option>Indian/Reunion</option>
								<option>Pacific/Apia</option>
								<option>Pacific/Auckland</option>
								<option>Pacific/Chatham</option>
								<option>Pacific/Chuuk</option>
								<option>Pacific/Easter</option>
								<option>Pacific/Efate</option>
								<option>Pacific/Enderbury</option>
								<option>Pacific/Fakaofo</option>
								<option>Pacific/Fiji</option>
								<option>Pacific/Funafuti</option>
								<option>Pacific/Galapagos</option>
								<option>Pacific/Gambier</option>
								<option>Pacific/Guadalcanal</option>
								<option>Pacific/Guam</option>
								<option>Pacific/Honolulu</option>
								<option>Pacific/Johnston</option>
								<option>Pacific/Kiritimati</option>
								<option>Pacific/Kosrae</option>
								<option>Pacific/Kwajalein</option>
								<option>Pacific/Majuro</option>
								<option>Pacific/Marquesas</option>
								<option>Pacific/Midway</option>
								<option>Pacific/Nauru</option>
								<option>Pacific/Niue</option>
								<option>Pacific/Norfolk</option>
								<option>Pacific/Noumea</option>
								<option>Pacific/Pago_Pago</option>
								<option>Pacific/Palau</option>
								<option>Pacific/Pitcairn</option>
								<option>Pacific/Pohnpei</option>
								<option>Pacific/Port_Moresby</option>
								<option>Pacific/Rarotonga</option>
								<option>Pacific/Saipan</option>
								<option>Pacific/Tahiti</option>
								<option>Pacific/Tarawa</option>
								<option>Pacific/Tongatapu</option>
								<option>Pacific/Wake</option>
								<option>Pacific/Wallis</option>
								<option>US/Alaska</option>
								<option>US/Arizona</option>
								<option>US/Central</option>
								<option>US/Eastern</option>
								<option>US/Hawaii</option>
								<option>US/Mountain</option>
								<option>US/Pacific</option>
							</select>
						</div>
						<button id="register" class="btn btn-success">Register</button>
					</form>
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
    <script src="/static/js/registerFlight.js"></script>
    
    <script>
    	$('#departure').datetimepicker();

    	var images = ['image1.jpg', 'image2.jpg', 'image3.jpg', 'image4.jpg', 'image5.jpg'];
    	$('#holder').css({'background-image': 'url(/static/images/' + images[Math.floor(Math.random() * images.length)] + ')'});
    </script>
  </body>
</html>
