(function ($) {
    "use strict";

    $(".group4").colorbox({rel: 'group4', slideshow: true});
//    Sticky Header

    window.onscroll = function () {
        styckyHeader()
    };

    var header = document.getElementById("header");
    var sticky = header.offsetTop + $('#header').height();

    function styckyHeader() {

        //console.log(window.pageYOffset,sticky);

        if (window.pageYOffset > sticky) {
            header.classList.add("sticky");

        } else {
            header.classList.remove("sticky");
        }
    }

    $(".sub_arrow").click(function () {
        $(this).parents('li').toggleClass("open");
    });

    // Cache selectors
    var lastId,
            topMenu = $("#mainmenu"),
            topMenuHeight = topMenu.outerHeight() + 15,
            // All list items
            menuItems = topMenu.find("a.scroll"),
            // Anchors corresponding to menu items
            scrollItems = menuItems.map(function () {
                var item = $($(this).attr("href"));
                if (item.length) {
                    return item;
                }
            });

    // Bind click handler to menu items
    // so we can get a fancy scroll animation
    menuItems.click(function (e) {

        var x = document.getElementById("mainmenu");
        if (x.className === "mainmenu") {
            x.className += " responsive";
        } else {
            x.className = "mainmenu";
        }

        if ($('.sticky').length) {
            var extOfset = 0;
        } else {
            var extOfset = 110;
        }


        var href = $(this).attr("href"),
                offsetTop = href === "#" ? 0 : $(href).offset().top - topMenuHeight + 1;
        $('html, body').stop().animate({
            scrollTop: offsetTop - extOfset
        }, 900);


        e.preventDefault();
    });

    // Bind to scroll
   /* $(window).scroll(function () {
        // Get container scroll position
        var fromTop = $(this).scrollTop() + topMenuHeight;

        // Get id of current scroll item
        var cur = scrollItems.map(function () {
            if ($(this).offset().top < fromTop)
                return this;
        });
        // Get the id of the current element
        cur = cur[cur.length - 1];
        var id = cur && cur.length ? cur[0].id : "";

        if (lastId !== id) {
            lastId = id;
            // Set/remove active class
            menuItems
                    .parent().removeClass("active")
                    .end().filter("[href='#" + id + "']").parent().addClass("active");
        }
    });*/
    
    

})(jQuery);

 $(".manutoggle").on('click', function(){   
    $(".mobile-hide").toggleClass("mobile-show");
 });