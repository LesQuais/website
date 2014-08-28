/** Add target="_blank" attribute to external selectors.
*
* Done through JS because changing the Markdown parser is complicated, and specifying the attribute inline makes the documents much less editable by non-programmers.
*/

$(function() {
	$('a[href^="http"]:not([href*="' + location.hostname.replace('www.', '') + '"])')
		.attr('target', '_blank');
});
