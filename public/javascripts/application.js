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
	
});