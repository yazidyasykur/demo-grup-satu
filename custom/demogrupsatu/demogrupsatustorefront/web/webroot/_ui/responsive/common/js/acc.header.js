ACC.header = {

    _autoload: [ "navBarList"
    ]
    ,
    navBarList: function () {

        let navs = $(".nav-container");

        let child = $(navs[0]).children()
        let nav = child[0];
        let navList = $(".on-nav-link");
        $(nav).on('click', function (event) {
            let cond = $(navList).css("display")

            if (cond != "block") {
                $(navList).hide().slideDown()
            } else {
                $(navList).show().slideUp()
            }
        })
    }
}



