function showMinuteContent(a){$("#showContent").hide(),$("#showContent").fadeIn("slow"),$("#showContent").html($("#"+a).html())}$(function(){$(".error").hide(),$(".buttonSubmit").click(function(){$(".error").hide();var a=$("input#email").val();if(a==""||a=="Enter your email here"||!a.match(/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/))return $("label#email_error").show(),$("input#email").focus(),!1;var b="email="+a;return $.ajax({type:"POST",url:"/register_email",data:b,success:function(){$("#contact_form").html("<div id='message'></div>"),$("#message").html("<h2 style='color:#009;'>Thanks for your support!</h2>").append("<p>We will be in touch soon.</p>").hide().fadeIn(1500,function(){$("#message").append("<img id='checkmark' src='images/check.png' />")})}}),!1}),$("a.submit").live("click",function(){var a=$(this).parents("form:first");return $(this).attr("href")!="#"&&a.attr("action",$(this).attr("href")),method=$(this).is(".delete")?"delete":$(this).is(".post")?"post":$(this).is(".put")?"put":"",method!=""&&a.find("[name=_method]").val(method),window.setTimeout(function(){a.submit()},500),!1})})