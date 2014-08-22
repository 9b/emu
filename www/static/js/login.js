$( document ).ready(function() {

	$('#error').hide();

	$('#username').focus();

	$('#login').click(function() {

		var username = $('#username').val();
		var password = $('#password').val();
		
		$.ajax({
			url: '/validate',
			type: 'post',
			dataType: 'json',
			contentType:'application/json',
			data: JSON.stringify({ username: username, password: password }),
			success: function(data) {
				if (data.success) {
					window.location.replace("/flights");
				} else {
					$('#errorMsg').html(data.error);
					$('#error').show();
				}
			}
    	}); //end of ajax
	}); // end of click
	
	$('#register').click(function() {
		window.location.replace("/signup");
	});

    $('.input').keyup(function(event) {
        if (event.keyCode == 13) {
			$('#login').click();
         }
    });

});

