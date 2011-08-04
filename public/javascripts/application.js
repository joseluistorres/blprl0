// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function() {
	
var descriptionOptions = {
    watermarkText: "Write your To DO action here...",
    functionValidate: function(value) {
        if (parseInt(value) < 18) {
            return false;
        }
        return true;
    },
    dataType: "number",
    liveCheck: false
};

$("#task_description").requiredfield(descriptionOptions);

});