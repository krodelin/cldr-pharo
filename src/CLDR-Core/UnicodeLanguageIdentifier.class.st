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

{ #category : #'accessing-private' }
UnicodeLanguageIdentifier >> language: aString [
	language := aString
]

{ #category : #accessing }
UnicodeLanguageIdentifier >> region [
	^ region 
]

{ #category : #'accessing-private' }
UnicodeLanguageIdentifier >> region: aString [
	region := aString
]

{ #category : #accessing }
UnicodeLanguageIdentifier >> script [
	^ script 
]

{ #category : #'accessing-private' }
UnicodeLanguageIdentifier >> script: aString [
	script := aString
]
