document.observe("dom:loaded", function() {
    var content = $('micropost_content');
    var counter = $('micropost_counter');
    function update_counter() {
        var chars_left = 140 - $F(content).length;
        counter.update(chars_left.abs() + " character"
                       + (chars_left.abs() == 1 ? "" : "s")
                       + (chars_left < 0 ? " too much!" : " left."));
        counter.setStyle({color: chars_left < 0 ? "red" : "black"});
    }
    update_counter();
    content.observe('keypress', function() {
        update_counter();
    });
    content.observe('keyup', function() {
        update_counter();
    });
});
