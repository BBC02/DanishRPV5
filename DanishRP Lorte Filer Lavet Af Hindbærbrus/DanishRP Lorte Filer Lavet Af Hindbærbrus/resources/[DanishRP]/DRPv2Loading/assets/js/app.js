$(function () {
    document.getElementById('link').innerHTML = config.text.link;

    var llllll = config.images.forEach(appen)
    function appen(i) {
        document.getElementById("bg").innerHTML= document.getElementById("bg").innerHTML + `<img width="100%"height="100%" src=assets/img/${i}>`;
}
    function random(pp) {
        return Math.floor(Math.random() * pp);
    }
    var img = $('div#bg img');
    var len = img.length;
    var current = random(len);
    img.hide();
    img.eq(current).show();

    var x = setInterval(function () {
        img.eq(current).fadeOut(config.transitionInterval, function () {
            current = random(len);
            img.eq(current).fadeIn(config.transitionInterval);
        });
    }, 2 * config.transitionInterval + config.imgInterval);
})

