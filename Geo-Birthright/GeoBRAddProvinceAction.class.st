Class {
	#name : #GeoBRAddProvinceAction,
	#superclass : #GeoBRAction,
	#instVars : [
		'id',
		'name',
		'areaId',
		'level',
		'loyalty',
		'terrain'
	],
	#category : #'Geo-Birthright-Actions'
}

{ #category : #accessing }
GeoBRAddProvinceAction class >> typeClass [

	^GeoBRProvince
]

{ #category : #accessing }
GeoBRAddProvinceAction >> areaId [

	^ areaId
]

{ #category : #accessing }
GeoBRAddProvinceAction >> areaId: anObject [

	areaId := anObject
]

{ #category : #actions }
GeoBRAddProvinceAction >> doActionIn: aWorld [

	| province |
	province := self typeClass new.
	province
		id: id;
		areaId: areaId;
		name: name;
		level: level;
		loyalty: loyalty;
		terrain: terrain.
	aWorld provinces at: province id put: province.
	aWorld pool at: province id put: province.
]

{ #category : #accessing }
GeoBRAddProvinceAction >> ensureId [

	id ifNil: [ id := UUID new asString ]
]

{ #category : #accessing }
GeoBRAddProvinceAction >> id [

	^ id
]

{ #category : #accessing }
GeoBRAddProvinceAction >> id: anObject [

	id := anObject
]

{ #category : #accessing }
GeoBRAddProvinceAction >> level [

	^ level
]

{ #category : #accessing }
GeoBRAddProvinceAction >> level: anObject [

	level := anObject
]

{ #category : #accessing }
GeoBRAddProvinceAction >> loyalty [

	^ loyalty
]

{ #category : #accessing }
GeoBRAddProvinceAction >> loyalty: anObject [

	loyalty := anObject
]

{ #category : #accessing }
GeoBRAddProvinceAction >> name [

	^ name
]

{ #category : #accessing }
GeoBRAddProvinceAction >> name: anObject [

	name := anObject
]

{ #category : #accessing }
GeoBRAddProvinceAction >> terrain [

	^ terrain
]

{ #category : #accessing }
GeoBRAddProvinceAction >> terrain: anObject [

	terrain := anObject
]
