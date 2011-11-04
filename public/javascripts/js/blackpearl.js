$(function() {
  $('.error').hide();
  

  $(".buttonSubmit").click(function() {
		// validate and process form
		// first hide any error messages
    $('.error').hide();
		
	 var email = $("input#email").val();
	 
	if (email == "" || email == "Enter your email here" || !email.match(/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/)) {
	  
      $("label#email_error").show();
      $("input#email").focus();
      return false;
    }
	
	
	var dataString = 'email=' + email;
		//alert (dataString);return false;
		
		$.ajax({
      type: "POST",
      url: "bin/process.php",
      data: dataString,
      success: function() {
        $('#contact_form').html("<div id='message'></div>");
        $('#message').html("<h2 style='color:#009;'>Thanks for your support!</h2>")
        .append("<p>We will be in touch soon.</p>")
        .hide()
        .fadeIn(1500, function() {
          $('#message').append("<img id='checkmark' src='images/check.png' />");
        });
      }
     });
    return false;
	});
});

