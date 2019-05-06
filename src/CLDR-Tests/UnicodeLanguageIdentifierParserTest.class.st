Class {
	#name : #UnicodeLanguageIdentifierParserTest,
	#superclass : #TestCase,
	#instVars : [
		'parser'
	],
	#category : #'CLDR-Tests'
}

{ #category : #tests }
UnicodeLanguageIdentifierParserTest >> testEnGb [
	| result |
	result := UnicodeLanguageIdentifierParser parse: 'en_GB'.
	self
		assert: result second equals: 'en';
		assert: result third equals: 'GB';
		assert: result fourth equals: nil
]

{ #category : #tests }
UnicodeLanguageIdentifierParserTest >> testEnUs [
	| result |
	result := UnicodeLanguageIdentifierParser parse: 'en-US'.
	self
		assert: result second equals: 'en';
		assert: result third equals: 'US';
		assert: result fourth equals: nil
]

{ #category : #tests }
UnicodeLanguageIdentifierParserTest >> testUzCyrl [
	| result |
	result := UnicodeLanguageIdentifierParser parse: 'uz-Cyrl'.
	self
		assert: result second equals: 'uz';
		assert: result third equals: nil;
		assert: result fourth equals: 'Cyrl'
]
