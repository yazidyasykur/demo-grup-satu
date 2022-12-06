ACC.about = {

    _autoload: [ "aboutScript"
    ]
    ,
    aboutScript: function () {

        let faqs = $(".faq-container > div");

        for (let i = 0; i < faqs.length; i++) {
            let child = $(faqs[i]).children()
            let answer = child[1];
            let icon = child[0];
            $(faqs[i]).on('click', function (event) {
                let cond = $(answer).css("display")

                if (cond != "block") {
                    $(answer).hide().slideDown()
                    $(icon).html("-")
                } else {
                    $(answer).show().slideUp()
                    $(icon).html("+")
                }
            })
        }
    }
}



