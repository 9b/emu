$( document ).ready(function() {

	console.log("registerFlight loaded");

	$('#register').click(function(e) {
		e.preventDefault();

		var tailId = $('#tailId').val();
		var departure = $('#departure').val();
		var timezone = $( "#timezones option:selected" ).text();
		
		$.ajax({
			url: '/processFlight',
			type: 'post',
			dataType: 'json',
			contentType:'application/json',
			data: JSON.stringify({ tailId: tailId, departure: departure, timezone: timezone }),
			success: function(data) {
				if (data.success) {
					window.location.replace("/flights");
				} else {
					console.log("shit failed");
				}
			}
    	}); //end of ajax
	}); // end of click

});