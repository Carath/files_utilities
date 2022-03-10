// ----------------------------------------------------------------------------
// markItUp!
// ----------------------------------------------------------------------------
// Copyright (C) 2008 Jay Salvat
// http://markitup.jaysalvat.com/
// ----------------------------------------------------------------------------
// BBCode tags example
// http://en.wikipedia.org/wiki/Bbcode
// ----------------------------------------------------------------------------
// Feel free to add more tags
// ----------------------------------------------------------------------------
_BBCodeSettings = {
	previewParserVar: 'content', 
	previewParserPath:	'', // path to your BBCode parser
	markupSet: [
		{name:'Bold', key:'B', openWith:'[b]', closeWith:'[/b]',className:'bbcbold'},
		{name:'Italic', key:'I', openWith:'[i]', closeWith:'[/i]',className:'bbcitalic'},
		{name:'Underline', key:'U', openWith:'[u]', closeWith:'[/u]',className:'bbcunderline'},
		{name:'Stroke',  openWith:'[s]', closeWith:'[/s]',className:'bbcstroke'},
		{name:'Left',  openWith:'[left]', closeWith:'[/left]',className:'bbcleft'},
		{name:'Center',  openWith:'[center]', closeWith:'[/center]',className:'bbccenter'},
		{name:'Right',  openWith:'[right]', closeWith:'[/right]',className:'bbcright'},
		{name:'Justify',  openWith:'[justify]', closeWith:'[/justify]',className:'bbcjustify'},
		{separator:'---------------' },
		{name:'Picture', key:'P', replaceWith:'[img][![Url]!][/img]',className:'bbcpic'},
		{name:'Link', key:'L', openWith:'[url=[![Url]!]]', closeWith:'[/url]', placeHolder:'Your text to link here...',className:'bbclink'},
		{separator:'---------------' },
		{name:'Size', key:'S', openWith:'[size=[![Text size]!]]', closeWith:'[/size]',className:'bbcfont',
		dropMenu :[
			{name:'20', openWith:'[size=20]', closeWith:'[/size]' },
			{name:'18', openWith:'[size=18]', closeWith:'[/size]' },
			{name:'16', openWith:'[size=16]', closeWith:'[/size]' },
			{name:'14', openWith:'[size=14]', closeWith:'[/size]' },
			{name:'12', openWith:'[size=12]', closeWith:'[/size]' },
			{name:'10', openWith:'[size=10]', closeWith:'[/size]' }
		]},
		{name:'Colors', 
			className:'colors bbccolors', 
			openWith:'[color=[![Color]!]]', 
			closeWith:'[/color]', 
				dropMenu: [
					{name:'Yellow',	openWith:'[color=yellow]', 	closeWith:'[/color]', className:"col1-1" },
					{name:'Orange',	openWith:'[color=orange]', 	closeWith:'[/color]', className:"col1-2" },
					{name:'Red', 	openWith:'[color=red]', 	closeWith:'[/color]', className:"col1-3" },
					
					{name:'Blue', 	openWith:'[color=blue]', 	closeWith:'[/color]', className:"col2-1" },
					{name:'Purple', openWith:'[color=purple]', 	closeWith:'[/color]', className:"col2-2" },
					{name:'Green', 	openWith:'[color=green]', 	closeWith:'[/color]', className:"col2-3" },
					
					{name:'White', 	openWith:'[color=white]', 	closeWith:'[/color]', className:"col3-1" },
					{name:'Gray', 	openWith:'[color=gray]', 	closeWith:'[/color]', className:"col3-2" },
					{name:'Black',	openWith:'[color=black]', 	closeWith:'[/color]', className:"col3-3" }
				]
		},
		{separator:'---------------' },
		{name:'Bulleted list', openWith:'[ul]\n', closeWith:'\n[/ul]',className:'bbcul'},
		{name:'Numeric list', openWith:'[ol=[![Starting number]!]]\n', closeWith:'\n[/ol]',className:'bbcol'}, 
		{name:'List item', openWith:'[li]', closeWith:'[/li]',className:'bbcli'},
		{separator:'---------------' },
		{name:'Quotes', openWith:'[quote]', closeWith:'[/quote]',className:'bbcquote'},
		{name:'Code', openWith:'[code]', closeWith:'[/code]',className:'bbccode'}, 
		{name:'Hidden block', key:'L', openWith:'[hide=[![Title]!]]', closeWith:'[/hide]', placeHolder:'[q]Your content[/q]',className:'bbchide'},
		{separator:'---------------' },
		{name:'Clean', className:"clean", replaceWith:function(markitup) { return markitup.selection.replace(/\[(.*?)\]/g, "") } },
		{name:'Preview', className:"preview", call:'preview' }
	]
}