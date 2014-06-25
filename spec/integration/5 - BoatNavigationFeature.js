description: 'Switching between boats should be possible',

scenario: [
	BoatWidget.next(),
	{
		'BoatWidget.title':				shortestBoatName,
		'BoatWidget.aboveDiaporama':	true,
		'BoatWidget.belowDiaporama':	true,
	},
	BoatWidget.previous(),
	{
		'BoatWidget.title':	longestBoatName,
	}
]
