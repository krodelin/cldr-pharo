Class {
	#name : #UnicodeLanguageIdentifier,
	#superclass : #UnicodeAbstractLanguageIdentifier,
	#instVars : [
		'language',
		'region',
		'script'
	],
	#category : #'CLDR-Core'
}

{ #category : #converting }
UnicodeLanguageIdentifier >> asString [
	^ String
		streamContents: [ :stream | 
			stream nextPutAll: self language.
			self region
				ifNotNil: [ :value | 
					stream
						nextPut: $_;
						nextPutAll: value ].
			self script
				ifNotNil: [ :value | 
					stream
						nextPut: $_;
						nextPutAll: value ] ]
]

{ #category : #testing }
UnicodeLanguageIdentifier >> isRoot [
	^false
]

{ #category : #accessing }
UnicodeLanguageIdentifier >> language [
	^ language
]

{ #category : #accessing }
UnicodeLanguageIdentifier >> region [
	^ region 
]

{ #category : #accessing }
UnicodeLanguageIdentifier >> script [
	^ script 
]

{ #category : #initialization }
UnicodeLanguageIdentifier >> setLanguage: languageString region: regionString script: scriptString [
language := languageString .
region := regionString .
script := scriptString 

]
