description: 'The home page should load and present meta links, words and boat names',

scenario: [
	{
		'MetaListWidget.container':		shortestMetaRegExp,
		'BoatListWidget.container':		longestBoatName,
		'WordsListWidget.container':	firstWord,
	},
	{
		'BoatListWidget.firstBoatName':	longestBoatName,
	}
]
