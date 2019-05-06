Class {
	#name : #BaselineOfCldr,
	#superclass : #BaselineOf,
	#category : #BaselineOfCldr
}

{ #category : #baselines }
BaselineOfCldr >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: ["Dependencies"
			spec baseline: 'XMLParser' with: [ spec repository: 'github://svenvc/XML-Support-Pharo' ].
			 "Packages"
			spec package: 'CLDR-Core'.
			spec package: 'CLDR-Tests' with: [ spec requires: 'CLDR-Core' ].

			"Groups"
			spec
				group: 'Core' with: #('CLDR-Core');
				group: 'Tests' with: #('CLDR-Tests') ]
]
