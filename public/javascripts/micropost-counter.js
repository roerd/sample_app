function update_counter(field) {
    var text = 140 - $F(field).length + " characters left.";
    $('micropost_counter').update(text);
}

document.observe("dom:loaded", function() {
    var content = $('micropost_content');
    update_counter(content);
    content.observe('keypress', function() {
        update_counter(this);
    });
    content.observe('keyup', function() {
        update_counter(this);
    });
});
