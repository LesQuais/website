document.body.onload = function() {
	var bg		= document.getElementById('bg'),
		boat	= document.getElementById('boat'),
		above	= document.getElementById('above')
		spacer	= document.getElementById('spacer');

	spacer.style.height = window.innerHeight + 'px';

	window.addEventListener('scroll', function() {
		bg.style.top = ((above.clientHeight - document.body.scrollTop) / 1.5) + 'px';
		boat.style.bottom = ((document.body.scrollTop - spacer.offsetTop) / 1.25) + 'px';
	});

	window.scrollTo(0, spacer.offsetTop);
}
