$(document).ready(function() {
	$(".year").click(function() {

		$('#year_year').val($(this).html());
    var val = $(this).html();
    console.log(val);
    $('.intro span').html(val);
    history.pushState({}, '', "/" + val );

    return false;
	});
});