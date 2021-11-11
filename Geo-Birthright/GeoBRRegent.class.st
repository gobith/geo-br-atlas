"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	bloodline:		<Object>
	domain:		GeoBRDomain
	id:		<Object>
	name:		<Object>


    Implementation Points
"
Class {
	#name : #GeoBRRegent,
	#superclass : #Object,
	#instVars : [
		'id',
		'name',
		'bloodline',
		'regencyPoints'
	],
	#category : #'Geo-Birthright-Domain'
}

{ #category : #accessing }
GeoBRRegent class >> neoJsonMappingOn: mapping [

	mapping 
		mapAccessor: #id;
		mapAccessor: #name;
		mapAccessor: #bloodline;
		mapAccessor: #regencyPoints
]

{ #category : #accessing }
GeoBRRegent >> bloodline [

	^ bloodline
]

{ #category : #accessing }
GeoBRRegent >> bloodline: anObject [

	bloodline := anObject
]

{ #category : #accessing }
GeoBRRegent >> bloodlineModifier [

	^ bloodline - 10 // 2
]

{ #category : #accessing }
GeoBRRegent >> id [

	^ id
]

{ #category : #accessing }
GeoBRRegent >> id: anObject [

	id := anObject
]

{ #category : #accessing }
GeoBRRegent >> name [

	^ name
]

{ #category : #accessing }
GeoBRRegent >> name: anObject [

	name := anObject
]

{ #category : #printing }
GeoBRRegent >> printOn: aStream [

	aStream
		nextPutAll: 'Regent: ';
		nextPutAll: self name
]

{ #category : #accessing }
GeoBRRegent >> regencyPoints [

	^ regencyPoints
]

{ #category : #accessing }
GeoBRRegent >> regencyPoints: anObject [

	regencyPoints := anObject
]
