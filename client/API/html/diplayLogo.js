$(function() {
    window.addEventListener("message", function(event) {
        var mess = event.data;
        console.log(mess.logo)
        if (typeof mess.logo !== 'undefined') {
            $("#logo").fadeIn("slow", function() {
                setTimeout(function() {
                    $("#logo").fadeOut("slow", function() {});
                }, 5000);
            });
        }

    });

});