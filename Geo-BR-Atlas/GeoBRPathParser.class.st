Class {
	#name : #GeoBRPathParser,
	#superclass : #Object,
	#instVars : [
		'document',
		'paths'
	],
	#category : #'Geo-BR-Atlas'
}

{ #category : #tests }
GeoBRPathParser class >> example001 [

	^((self onFileNamed: '/home/georges/Geo BR Atlas/3.svg') parse)
]

{ #category : #tests }
GeoBRPathParser class >> exampleDeepsouth [

	^((self onFileNamed: '/home/georges/Geo BR Atlas/deepsouth007.svg') parse)
]

{ #category : #'instance creation' }
GeoBRPathParser class >> onFileNamed: fileNameString [

	^(self new onFileNamed: fileNameString)
]

{ #category : #'instance creation' }
GeoBRPathParser >> onFileNamed: fileNameString [

	paths := OrderedCollection new.

	fileNameString asFileReference readStreamDo: [ :readStream | 
		document := (XMLDOMParser on: readStream) optimizeForLargeDocuments parseDocument ]
]

{ #category : #actions }
GeoBRPathParser >> parse [

	(document allElementsNamed: 'path') do: [ :pathNode | 
		self parsePath: pathNode ].

	^ paths
]

{ #category : #actions }
GeoBRPathParser >> parsePath: pathElement [

	| d path |
	d := pathElement attributeAt: 'd'.



	path := GeoBRPath new
		        id: paths size + 1;
		        d: d;
		        yourself.
	paths add: path
]
