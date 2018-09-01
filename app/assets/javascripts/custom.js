$( function(){
    $('.add-category').click(function() {
        display()
    });
    $('.close-category').click(function() {
        display()
    });
    $('.update-post').click(function () {
        $('#form-post-create').toggle(1000); $('.add-category').toggle(1000);
        $('#form-post-update').bind('ajax:success', function() {
            $('#posts').children().find('td.title').html("test success");
            $('#posts').children().find('td.content').html("success");
        });
    });
});
function display() {
    $('.add-category').toggle(1000);
    $('#new-category').toggle(1000);
    $('.close-category').toggle(1000);
}