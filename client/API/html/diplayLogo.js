$(function() {
    window.addEventListener("message", function(event) {
        var mess = event.data;
        if (typeof mess.logo !== 'undefined') {
            $("#logo").fadeIn("slow", function() {
                setTimeout(function() {
                    $("#logo").fadeOut("slow", function() {});
                }, 5000);
            });
        }

        if (typeof mess.succes !== 'undefined') {
            $("#succes").fadeIn(200, function() {
                setTimeout(function() {
                    $("#succes").fadeOut("slow", function() {});
                }, 10000);
            });
        }

        if (typeof mess.mic !== 'undefined') {
            if (mess.mic == true) {
                $("#mic").fadeIn(500);
            } else {
                $("#mic").fadeOut(500);
            }

        }

    });

});