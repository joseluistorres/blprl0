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
      url: "/register_email",
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
	
	$('a.submit').live('click', function() {
      var form = $(this).parents('form:first');

      if ($(this).attr('href') != "#")
      {
        form.attr('action', $(this).attr('href'));
      }

      method = $(this).is('.delete') ? 'delete' : $(this).is('.post') ? 'post' : $(this).is('.put') ? 'put' : ''
      if (method != '')
      {
              form.find('[name=_method]').val(method);
      }

      window.setTimeout(function() {
              form.submit();
      }, 500);
      return false;
    });
});



function showMinuteContent(div_content){
	$('#showContent').hide();
	$('#showContent').fadeIn('slow');
	$("#showContent").html($("#"+div_content).html());
}
;
