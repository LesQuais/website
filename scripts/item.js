document.body.onload = function() {
	var under	= document.getElementById('under'),
		over	= document.getElementById('over'),
		above	= document.getElementById('above')
		spacer	= document.getElementById('spacer');

	spacer.style.height = window.innerHeight + 'px';

	window.addEventListener('scroll', function() {
		under.style.top = ((above.clientHeight - window.scrollY) / 1.5) + 'px';
		over.style.top = ((above.clientHeight - window.scrollY) / 1.25) + 'px';
	});

	window.scrollTo(0, spacer.offsetTop);
}
