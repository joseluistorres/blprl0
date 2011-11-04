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

	function showUpExample(){
		$("#egDiv").show();
	
	}

	function hideExample(){
		$("#egDiv").hide();
	
	}

	$("#task_description").requiredfield(descriptionOptions);
	$("#passwrd").requiredfield(passwordOptions);

	$('#task_description').live('focus keyup', function() {
		showUpExample();
	});

	$('#task_description').live('blur', function() {
		hideExample();
	});

   /**********************************************************/

	$('.slider')._TMS({
		prevBu:'.prev',
		nextBu:'.next',
		playBu:'.play',
		duration:1000,
		easing:'easeOutQuad',
		preset:'simplefade',
		pagination:'.pagination',
		slideshow:6000,
		numStatus:false,
		banners:'fromBottom1',// fromLeft, fromRight, fromTop, fromBottom
		waitBannerAnimation:false});
 
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
	
	$("a#login_link").live('click', function() {
		$("div.slider").hide();
		$("ul.pagination").hide();
		$("div.controls").hide();
		$("div.loginFrm").show();
		 $("#emailaddress").focus();
		return false;
    });
});