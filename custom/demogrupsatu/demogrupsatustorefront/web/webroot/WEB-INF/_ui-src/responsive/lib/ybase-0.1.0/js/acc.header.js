ACC.header = {

    _autoload: [ "navBarList"
    ]
    ,
    navBarList: function () {

        let navs = $(".nav-container > div");

        console.log(navs);

        let child = $(navs[0]).children()
        console.log(child);
        let nav = child[0];
        let navList = child[1];
        $(navs[0]).on('click', function (event) {
            let cond = $(navList).css("display")

            if (cond != "block") {
                $(navList).hide().slideDown()
            } else {
                $(navList).show().slideUp()
            }
        })
    }
}



