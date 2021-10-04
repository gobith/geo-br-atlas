Extension { #name : #Rectangle }

{ #category : #'*Geo-BR-Atlas' }
Rectangle class >> neoJsonMappingOn: mapping [
	mapping
		mapAccessor: #origin;
		mapAccessor: #corner
]
