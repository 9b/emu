$( document ).ready(function() {

	$('#error').hide();

	$('#register').click(function() {

		var invite = $('#invite').val();
		var username = $('#email').val();
		var password = $('#password').val();
		
		$.ajax({
			url: '/processSignup',
			type: 'post',
			dataType: 'json',
			contentType:'application/json',
			data: JSON.stringify({ username: username, password: password, invite: invite }),
			success: function(data) {
				if (data.success) {
					window.location.replace("/");
				} else {
					$('#errorMsg').html(data.error);
					$('#error').show();
				}
			}
    	}); //end of ajax
	}); // end of click

    $('.input').keyup(function(event) {
        if (event.keyCode == 13) {
			$('#login').click();
         }
    });

});

