document.body.onload = function() {
	var bg = document.getElementById('bg'),
		boat = document.getElementById('boat'),
		spacer = document.getElementById('spacer');

	spacer.style.height = document.height + 'px';

	window.addEventListener('scroll', function() {
		bg.style.top = document.height - bg.height - (document.body.scrollTop / 1.5) + 'px';
		boat.style.bottom = ((document.body.scrollTop - spacer.offsetTop) / 1.3) + 'px';
		boat.style.left = document.body.scrollTop / 2 - (boat.width / 1.3) + 'px';
	});
}
