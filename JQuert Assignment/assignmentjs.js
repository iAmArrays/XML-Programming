$(document).ready(function() {

	$("#nav a").hover(function(){
		$(this).stop().animate({'opacity': 0.5});
	}, function(){
		$(this).stop().animate({'opacity': 0});
	});

	$("#theband p:odd").hide();

	$('<a>',{
		text: 'Read more...',
		title: 'Read more',
		href: '#',
		class: 'readMore'
	}).appendTo("#theband p:even");

	$(".readMore").click(function(event){
		event.preventDefault();
		$(this).parent().next().slideToggle();
	});

	$(".data tbody tr:odd").css({
		"background-color":"#ccc",
		"color":"#FFF",
		"font-weight":"bold"
	});

	$("img").wrap('<span style="display:inline-block"></span>')
    .css('display', 'block')
    .parent()
    .zoom();



    $("*").jrumble({
	x: 2,
	y: 2,
	rotation: 1
	});

    $("*").hover(function(){
		$(this).trigger('startRumble');
	}, function(){
		$(this).trigger('stopRumble');
	});
});

