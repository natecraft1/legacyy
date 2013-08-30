$(document).ready(function() {
	$(".year").click(function() {

		$('#year_year').val($(this).html());
    var val = $(this).html();
    console.log(val);
    $('.intro span').html(val);
    $.ajax()
    // history.replaceState({
    //   old_text: old_text.val(),
    //   new_text: new_text.val(),
    //   slug: location.pathname.replace("/", "")
    // }, null, null);
    history.pushState({}, '', "/" + val );

    return false;
	});
});