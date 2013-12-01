var ready;
ready = function() {

$('#one_pager_company_name').typeahead({
  name: 'one_pager[company_name]',
  local: ['Apple Inc.', 'Samsung Corp.', 'Microsoft', 'Sony',]
});

// Tooltip only Text
$('.masterTooltip').hover(function(){
        // Hover over code
        var title = $(this).attr('title');
        $("#descText").text(title);
        $(this).data('tipText', title).removeAttr('title');
        $('<h5 class="helpMessage"></h5>')
        .text(title)
        .appendTo('body')
        .fadeIn('slow');
}, function() {
        // Hover out code
        $(this).attr('title', $(this).data('tipText'));
        $('.helpMessage').remove();
}).mousemove(function(e) {
        var mousex = e.pageX + 20; //Get X coordinates
        var mousey = e.pageY + 10; //Get Y coordinates
        $('.helpMessage')
        .css({ top: mousey, left: mousex })
});

};

$(document).ready(ready);
$(document).on('page:load', ready);