// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function() {
	var descriptionOptions = {
	    watermarkText: "Enter the action items here, e.g: \nEvaluate tools for startups @Joseluis #Tools [19-Sep-2011]\nRun a few tests in staging @Rebecca #Tests [Tomorrow]",
	    functionValidate: function(value) {
	        if (parseInt(value) < 18) {
	            return false;
	        }
	        return true;
	    },
	    dataType: "number",
	    liveCheck: false
	};

	var passwordOptions = {
	    watermarkText: "Este es campo de password",
	    functionValidate: function(value) {
	        if (parseInt(value) < 18) {
	            return false;
	        }
	        return true;
	    },
	    dataType: "number",
	    liveCheck: false
	};

	var minuteTitleOptions = {
	    watermarkText: "Untitled Minute",
	    functionValidate: function(value) {
	        if (parseInt(value) < 18) {
	            return false;
	        }
	        return true;
	    },
	    dataType: "number",
	    liveCheck: false
	};
	
	function showUpExample(){
		$("#egDiv").show();
	
	}

	function hideExample(){
		$("#egDiv").hide();
	
	}

	$("#minute_content").requiredfield(descriptionOptions);
	$("#minute_name").requiredfield(minuteTitleOptions);
	$("#passwrd").requiredfield(passwordOptions);

	$('#minute_content').live('focus keyup', function() {
		//showUpExample();
	});

	$('#minute_content').live('blur', function() {
		//hideExample();
	});

   /**********************************************************/

	
 
   $("#onregister").fancybox({
	  'titlePosition'		: 'inside',
	  'transitionIn'		: 'none',
	  'transitionOut'		: 'none',
	  'width'				: '100%',
	  'height'			    : '100%'
	});
   
   var emailOptions1 = {
       watermarkText: "Enter your email here",
		functionValidate: function(value) {
			if (parseInt(value) < 18) {
				return false;
			}
			return true;
		},
		dataType: "number",
		liveCheck: false
    };
	
	$("#email").requiredfield(emailOptions1);
	
	$("a.click_register").live('click', function() {
		$("a#onregister").trigger('click');
		return false;
    });
	
	$('input.loginFrm').live('keyup', function(event){
    	if(event.keyCode == '13'){
		    var user_email = $(this);
		    var current_form = $("form#loginFrm");
		    if (user_email.val()!=''){
				current_form.submit();
		    }
	   
	    }
	  return false;
	});
	// showContent
   	$('a.showMinuteContent').live('click', function(e) {
	    e.preventDefault();
	    var link = $(this);
        showMinuteContent(link.attr('data_minute'));
	    
	    return true;
	  });
	
	$('a.edit_task_link').live('click', function(e) {
	    e.preventDefault();
	    var link = $(this);
        $('div#minute_editor_'+link.attr('data_link')).show();
		$('div#minute_container_'+link.attr('data_link')).hide();

	    return true;
	  });
	$('a.cancel_action').live('click', function(e) {
	    e.preventDefault();
	    var link = $(this);
        $('div#minute_editor_'+link.attr('data_link')).hide();
		$('div#minute_container_'+link.attr('data_link')).show();

	    return true;
	  });
	
	$('.check_text_expand').keyup(function(){
		var this_text = $(this);
		if (this_text.val().length<=140){
			this_text.css("height", '32px');
		}
		if (this_text.val().length>=141 && this_text.val().length<=280){
			this_text.css("height", '64px');
		}
		if (this_text.val().length>=281 && this_text.val().length<=420){
			this_text.css("height", '96px');
		}
		if (this_text.val().length>=421){
			this_text.css("height", '96px');
		}
		
	});
	
	$('.check_task').live('click', function(e) {
	    //e.preventDefault();
	    var link = $(this);
        task_id = link.attr('data_task');
		minute_id = link.attr('data_minute');

		$.ajax({
	        url: '/minutes/' + minute_id + '/tasks/' + task_id + '?status=1',
	        type: 'put',
	        dataType: 'script'
	      });

	    return true;
	  });
});