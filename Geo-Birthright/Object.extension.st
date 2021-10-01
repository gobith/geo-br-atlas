Extension { #name : #Object }

{ #category : #'*Geo-Birthright' }
Object class >> neoJsonMapping: mapper [
	mapper for: self do: [ :mapping | self neoJsonMappingOn: mapping ]
]

{ #category : #'*Geo-Birthright' }
Object class >> neoJsonMappingOn: mapping [
]
