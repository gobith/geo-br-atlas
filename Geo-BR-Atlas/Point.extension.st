Extension { #name : #Point }

{ #category : #'*Geo-BR-Atlas' }
Point >> =<>= aPoint [ 
	^(self - aPoint) abs < (1@1)
]
