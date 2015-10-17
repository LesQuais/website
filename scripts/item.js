$(function() {
	if (window.innerWidth < 768)	// too small for the effect to be visible, and this is a small device so with limited computing power, will be terribly sluggish
		return;

	var under	= document.getElementById('under'),
		over	= document.getElementById('over'),
		above	= document.getElementById('above'),
		offset	= computeOffset();

	function computeOffset() {
		var pixelsLeakingBelow = under.clientHeight - window.innerHeight;
		return pixelsLeakingBelow > 0 ? pixelsLeakingBelow / 2 : 0;
	}

	function scrollHandler() {
		under.style.top	= ((above.clientHeight - window.scrollY) / 1.5 - offset) + 'px';
		over.style.top	= ((above.clientHeight - window.scrollY) / 1.25 - offset) + 'px';
	}

	under.style.position = 'fixed';	// don't do it through css to allow for progressive display of image
	over.style.position = 'fixed';	// don't do it through css to allow for progressive display of image

	window.addEventListener('scroll', scrollHandler);
	window.addEventListener('resize', function() { offset = computeOffset() });
	window.addEventListener('resize', scrollHandler);


	scrollHandler();
});
