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

{ #category : #testing }
UnicodeRootLanguageIdentifier >> isValid [
	^true
]

{ #category : #accessing }
UnicodeRootLanguageIdentifier >> language [
	^nil
]

{ #category : #accessing }
UnicodeRootLanguageIdentifier >> region [
	^nil
]

{ #category : #accessing }
UnicodeRootLanguageIdentifier >> script [
	^nil
]
