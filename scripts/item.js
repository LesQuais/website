window.onload = function() {
	var under	= document.getElementById('under'),
		over	= document.getElementById('over'),
		above	= document.getElementById('above');

	function scrollHandler() {
		under.style.top	= ((above.clientHeight - window.scrollY) / 1.5) + 'px';
		over.style.top	= ((above.clientHeight - window.scrollY) / 1.25) + 'px';
	}

	window.addEventListener('scroll', scrollHandler);

	scrollHandler();
}
