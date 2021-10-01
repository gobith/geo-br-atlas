Class {
	#name : #GeoBRAction,
	#superclass : #Object,
	#category : #'Geo-Birthright-Actions'
}

{ #category : #accessing }
GeoBRAction class >> typeClass [

	self subclassResponsibility 
]

{ #category : #actions }
GeoBRAction >> asActionWrapper [

	^ GeoBRActionWrapper new
		  action: self;
		  dateAndTime: DateAndTime now;
		  yourself
]

{ #category : #actions }
GeoBRAction >> doActionIn: aWorld [

	self subclassResponsibility 
]

{ #category : #accessing }
GeoBRAction >> ensureId [

]

{ #category : #accessing }
GeoBRAction >> id [

	^nil
]

{ #category : #actions }
GeoBRAction >> typeClass [ 
	
	^self class typeClass
]
