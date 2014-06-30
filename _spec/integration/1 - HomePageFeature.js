description: 'The home page should load and present meta links, words and boat names',

scenario: [
	{
		'MetaListWidget.container':		shortestMetaRegExp,
		'BoatsListWidget.container':	longestBoatName,
		'WordsListWidget.container':	firstWord,
	},
	{
		'BoatsListWidget.firstBoatName':	longestBoatName,
	}
]
