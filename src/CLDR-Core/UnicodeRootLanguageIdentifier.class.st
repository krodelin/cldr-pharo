Class {
	#name : #UnicodeRootLanguageIdentifier,
	#superclass : #UnicodeAbstractLanguageIdentifier,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'CLDR-Core'
}

{ #category : #accessing }
UnicodeRootLanguageIdentifier class >> uniqueInstance [ 
^uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #converting }
UnicodeRootLanguageIdentifier >> asString [
	^'root'
]

{ #category : #testing }
UnicodeRootLanguageIdentifier >> isRoot [
	^true
]
