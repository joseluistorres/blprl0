// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
//= require jquery
//= require jquery_ujs
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
	
	$('select#filter_label_or_person').live('change', function(e) {
	    e.preventDefault();
	    var link = $(this);
        var r = confirm("Please click OK to vote for this feature");
        if (r){
	      	$.ajax({
		        url: '/users/?id=0aa0c37b59077d3f8b0d43c4d5faf86d40949f5f',
		        type: 'put',
				headers: {
				      'X-Transaction': 'POST Example',
				      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
				    },
		
		        dataType: 'script'
		      });
        }
		
	    return true;
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

	    return false;
	  });
	
	$('a.cancel_action').live('click', function(e) {
	    e.preventDefault();
	    var link = $(this);
        $('div#minute_editor_'+link.attr('data_link')).hide();
		$('div#minute_container_'+link.attr('data_link')).show();

	    return false;
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
	    var link = $(this);
        task_id = link.attr('data_task');
		minute_id = link.attr('data_minute');

		$.ajax({
	        url: '/minutes/' + minute_id + '/tasks/' + task_id + '?status=1',
	        type: 'put',
			headers: {
			      'X-Transaction': 'POST Example',
			      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
			    },
	        dataType: 'script'
	      });

	    return true;
	  });
	
	
	$('.title_assigned').live('click', function(e) {
	    var link = $(this);
        task_id = link.attr('data_link');
		
		$.ajax({
	        url: '/tasks/' + task_id + '?r=1',
	        type: 'put',
			headers: {
			      'X-Transaction': 'POST Example',
			      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
			    },
	        dataType: 'script'
	      });
        link.hide();
		$('a.title_assigned[data_link|="' + task_id + '"]').hide();
	    return false;
	  });
	
	$('a.action_add_people').live('click', function(e) {
		var link = $(this);
        task_id = link.attr('data_link');
		link.hide();
		if (task_id!=''){
			$('#for_assigning' + task_id).fadeIn("slow");
			$('#for_assigning' + task_id).css('display','inline-block');
		}else{
			$('#for_assigning').fadeIn("slow");
			$('#for_assigning').css('display','inline-block');
			link.focus();
			$('#for_assigning').focus();
		}
		return false;
	});
	
	$('a.cancel_assign').live('click', function(e) {
	    e.preventDefault();
	    var link = $(this);
	    var task_id = link.attr('data_link');
        $('a.action_add_people[data_link|="' + task_id + '"]').show();
		$('#for_assigning' + task_id).hide();

	    return false;
	  });
	
	$('a.due_date_link').live('click', function(e) {
	    e.preventDefault();
	    var link = $(this);
		var task_id = link.attr('data_link');
		$('a.edit_task_link[data_link|="' + task_id + '"]').trigger('click');
		var due_date_input = $('input#due_date_' + task_id);
		due_date_input.focus();
		due_date_input.trigger('click');
        

	    return false;
	  });
	
	$('a.open_form').live('click', function(e) {
		var link = $(this);
		var minute_id = link.attr('data_link');
		link.hide();
		$('div.minute_form_'+minute_id).show();
		return false;
	});
	
	$('a.cancel_action_task').live('click', function(e) {
		var link = $(this);
		var minute_id = link.attr('data_link');
		$('a.open_form[data_link|="' + minute_id + '"]').show();
		$('div.minute_form_'+minute_id).hide();
		return false;
	});
}); /**************************** end of jquery ******************/