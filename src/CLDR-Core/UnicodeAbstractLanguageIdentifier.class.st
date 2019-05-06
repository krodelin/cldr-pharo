Class {
	#name : #UnicodeAbstractLanguageIdentifier,
	#superclass : #Object,
	#category : #'CLDR-Core'
}

{ #category : #'instance creation' }
UnicodeAbstractLanguageIdentifier class >> fromString: aString [
	| result |
	aString = 'root'
		ifTrue: [ ^ UnicodeRootLanguageIdentifier uniqueInstance ].
	result := UnicodeLanguageIdentifierParser parse: aString.
	result first
		ifFalse: [ ^ CLDRError signal: 'Invalid language identifier ' , aString ].
	^ UnicodeLanguageIdentifier new
		setLanguage: result second
		region: result third
		script: result fourth;
		yourself
]

{ #category : #'instance creation' }
UnicodeAbstractLanguageIdentifier class >> root [
^self fromString: 'root'
]

{ #category : #converting }
UnicodeAbstractLanguageIdentifier >> asString [ self subclassResponsibility 
]

{ #category : #testing }
UnicodeAbstractLanguageIdentifier >> isRoot [
	self subclassResponsibility 
]

{ #category : #testing }
UnicodeAbstractLanguageIdentifier >> isValid [
self subclassResponsibility 
]

{ #category : #accessing }
UnicodeAbstractLanguageIdentifier >> language [
 self subclassResponsibility 
]

{ #category : #accessing }
UnicodeAbstractLanguageIdentifier >> region [
	self subclassResponsibility
]

{ #category : #accessing }
UnicodeAbstractLanguageIdentifier >> script [
	self subclassResponsibility
]
