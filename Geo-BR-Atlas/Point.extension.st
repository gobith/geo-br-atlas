Extension { #name : #Point }

{ #category : #'*Geo-BR-Atlas' }
Point >> =<>= aPoint [ 
	^(self - aPoint) abs < (1@1)
]

{ #category : #'*Geo-BR-Atlas' }
Point class >> neoJsonMappingOn: mapping [
	mapping
		mapAccessor: #x;
		mapAccessor: #y
]
