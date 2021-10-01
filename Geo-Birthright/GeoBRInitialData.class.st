Class {
	#name : #GeoBRInitialData,
	#superclass : #Object,
	#instVars : [
		'world'
	],
	#category : #'Geo-Birthright-Data'
}

{ #category : #'instance creation' }
GeoBRInitialData class >> on: aWorld [

	^self new world: aWorld
]

{ #category : #scripts }
GeoBRInitialData >> scriptToWar [

	| davor riswynn redfang greenbottle cear |

	world emptyAllData.
	
	davor := self takeAction: (GeoBRAddRegentAction new name: 'Davor Blackfal'; bloodline: 15).
	riswynn := self takeAction: (GeoBRAddRegentAction new name: 'Riswynn Warforged'; bloodline: 15).
	redfang := self takeAction: (GeoBRAddRegentAction new name: 'Drakcilius'; bloodline: 15).
	greenbottle := self takeAction: (GeoBRAddRegentAction new name: 'Lady Greenbottle'; bloodline: 15).
	
	cear := self takeAction: (GeoBRAddProvinceAction new name: 'Cear'; level: 4; terrain: GeoBRMountain new; loyalty: GeoBRLoyaltyHigh new).
	
	world takeAction: (GeoBRProvinceOwnershipAction new province: cear; owner: davor; ruler: davor).
	
	world takeAction: (GeoBRLawOwnershipAction new province: cear ; owner: davor; ruler: redfang; level: 4).
	world takeAction: (GeoBRGuildOwnershipAction new province: cear ; owner: davor; ruler: davor; level: 3).
	world takeAction: (GeoBRTempleOwnershipAction new province: cear ; owner: davor; ruler: riswynn; level: 4).
	world takeAction: (GeoBRGuildOwnershipAction new province: cear ; owner: greenbottle; ruler: greenbottle; level: 1).
	
	
]

{ #category : #actions }
GeoBRInitialData >> takeAction: anAction [

	| action |
	action := world takeAction: anAction.
	^action id
]

{ #category : #accessing }
GeoBRInitialData >> world [

	^ world
]

{ #category : #accessing }
GeoBRInitialData >> world: anObject [

	world := anObject
]
