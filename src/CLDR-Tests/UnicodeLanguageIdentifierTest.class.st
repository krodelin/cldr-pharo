Class {
	#name : #UnicodeLanguageIdentifierTest,
	#superclass : #TestCase,
	#category : #'CLDR-Tests'
}

{ #category : #tests }
UnicodeLanguageIdentifierTest >> testLanguageAndRegionSubtag [
	| id |
	self
		shouldnt: [ id := UnicodeLanguageIdentifier fromString: 'en-US' ]
			raise: CLDRError;
			assert: id asString equals: 'en_US';
		assert: id language equals: 'en';
		assert: id region equals: 'US';
		assert: id script equals: nil
]

{ #category : #tests }
UnicodeLanguageIdentifierTest >> testLanguageAndScriptSubtag [
	| id |
	self
		shouldnt: [ id := UnicodeLanguageIdentifier fromString: 'uz-Cyrl' ]
			raise: CLDRError;
					assert: id asString equals: 'uz_Cyrl';
		assert: id language equals: 'uz';
		assert: id region equals: nil;
		assert: id script equals: 'Cyrl'
]

{ #category : #tests }
UnicodeLanguageIdentifierTest >> testRoot [
	| id |
	self
		shouldnt: [ id := UnicodeLanguageIdentifier root ] raise: CLDRError;
		assert: id isRoot
]
