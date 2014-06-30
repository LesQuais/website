description: 'Word links should be visitable and have content',

scenario: [
	WordsListWidget.firstWord(),
	{
		'WordWidget.title':	firstWord
	},
	WordWidget.close(),
	{
		'WordsListWidget.container': true
	}
]
