description: 'The longest-named boat should be visitable and have content',

scenario: [
	BoatsListWidget.firstBoat(),
	{
		'BoatWidget.title':				longestBoatName,
		'BoatWidget.aboveDiaporama':	true,
		'BoatWidget.belowDiaporama':	true,
	}
]
