document.observe("dom:loaded", function() {
    var content = $('micropost_content');
    var counter = $('micropost_counter');
    function update_counter() {
        var text = 140 - $F(content).length + " characters left.";
        counter.update(text);
    }
    update_counter();
    content.observe('keypress', function() {
        update_counter();
    });
    content.observe('keyup', function() {
        update_counter();
    });
});
