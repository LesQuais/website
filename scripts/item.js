window.onload = function() {
	var under	= document.getElementById('under'),
		over	= document.getElementById('over'),
		above	= document.getElementById('above'),
		pixelsLeakingBelow = under.clientHeight - window.innerHeight;

	var offset	= (pixelsLeakingBelow > 0 ? pixelsLeakingBelow / 2 : 0);

	function scrollHandler() {
		under.style.top	= ((above.clientHeight - window.scrollY) / 1.5 - offset) + 'px';
		over.style.top	= ((above.clientHeight - window.scrollY) / 1.25 - offset) + 'px';
	}

	window.addEventListener('scroll', scrollHandler);

	scrollHandler();
}
