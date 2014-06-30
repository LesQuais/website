description: 'Meta links should be visitable and have content',

scenario: [
	MetaListWidget.firstMeta(),
	{
		'MetaWidget.title':	shortestMetaName
	},
	MetaWidget.close(),
	{
		'MetaListWidget.container': true
	}
]
