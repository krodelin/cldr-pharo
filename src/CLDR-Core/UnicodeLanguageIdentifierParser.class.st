Class {
	#name : #UnicodeLanguageIdentifierParser,
	#superclass : #Object,
	#instVars : [
		'matcher',
		'mutex'
	],
	#classVars : [
		'Matcher'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'CLDR-Core'
}

{ #category : #parsing }
UnicodeLanguageIdentifierParser class >> parse: aString [
^self uniqueInstance parse: aString
]

{ #category : #accessing }
UnicodeLanguageIdentifierParser class >> uniqueInstance [ 
^uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #initialization }
UnicodeLanguageIdentifierParser >> initialize [
	super initialize .
	self initializeMatcher .
	mutex := Mutex new.
]

{ #category : #initialization }
UnicodeLanguageIdentifierParser >> initializeMatcher [
	| alphanum alpha digit sep variantSubtag regionSubtag scriptSubtag languageSubtag languageId |
	

	"alphanum	 = [0-9 A-Z a-z];"
	alphanum := '[[:alnum:]]'.
	"alpha	= [A-Z a-z];"
	alpha := '[[:alpha:]]'.
	"digit	= [0-9];"
	digit := '[[:digit:]]'.
	"sep	= [-_];"
	sep := '[ -_]'.
	"unicode_variant_subtag	= (alphanum{5,8} | digit alphanum{3});"
	variantSubtag := '(' , (alphanum repeat: 5)
		, (alphanum , '?' repeat: 3) , ')|(' , digit , (alphanum repeat: 3)
		, ')'.
	"unicode_region_subtag	= (alpha{2} | digit{3});"
	regionSubtag := '(' , (alpha repeat: 2) , '|' , (digit repeat: 3)
		, ')'.
	"unicode_script_subtag	= alpha{4};"
	scriptSubtag := '(' , (alpha repeat: 4) , ')'.
	"unicode_language_subtag	= alpha{2,3} | alpha{5,8};"
	languageSubtag := '(' , (alpha repeat: 3) , '?|' , (alpha repeat: 5)
		, (alpha , '?' repeat: 3) , ')'.
	"unicode_language_id	= 'root'|(unicode_language_subtag(sep unicode_script_subtag)?|unicode_script_subtag)(sep unicode_region_subtag)?(sep unicode_variant_subtag)*;"
	languageId := '(root|(' , languageSubtag , '(' , sep , scriptSubtag
		, ')?|' , scriptSubtag , ')(' , sep , regionSubtag , ')?(' , sep
		, variantSubtag , ')*)'.
	matcher := languageId asRegex
]

{ #category : #'parsing-private' }
UnicodeLanguageIdentifierParser >> parse: aString [
	^ mutex
		critical: [ {(matcher matches: aString).
			(matcher subexpression: 5).
			(matcher subexpression: 9).
			(matcher subexpression: 7).
			self subexpressions} ]
]

{ #category : #'parsing-private' }
UnicodeLanguageIdentifierParser >> subexpressions [
	^ (1 to: matcher subexpressionCount)
		collect: [ :i | matcher subexpression: i ]
]
