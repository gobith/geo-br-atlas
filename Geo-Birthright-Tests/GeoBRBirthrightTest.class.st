Class {
	#name : #GeoBRBirthrightTest,
	#superclass : #TestCase,
	#category : #'Geo-Birthright-Tests'
}

{ #category : #tests }
GeoBRBirthrightTest >> test001 [

	"For example, Erin Velescarpe is a young Regent with a lot of work to do to carve out her domain. She owns four Provinces (levels 3, 2, 1, and 4 respectively) and five total Holdings (of levels 2, 2, 1, and 1). Her Bloodline score is 15, giving her a modifier of +2. At the beginning of the season, she collects 18 Regency Points."

	| world regent province1 province2 province3 province4|
	world := GeoBRWorld new.
	regent := GeoBRRegent new.
	regent 
		id: '1';
	 	name: 'Erin Velescarpe';
		bloodline: 15.
	
	world regents at: regent id put: regent.
	
	province1 := GeoBRProvince new.
	province1
		id: '1';
		name: 'Province 1';
		level: 3.
	world provinces at: province1 id put: province1.
	province2 := GeoBRProvince new.
	province2
		id: '2';
		name: 'Province 2';
		level: 2.
	world provinces at: province2 id put: province2.
	province3 := GeoBRProvince new.
	province3
		id: '3';
		name: 'Province 3';
		level: 1.
	world provinces at: province3 id put: province3.
	province4 := GeoBRProvince new.
	province4
		id: '4';
		name: 'Province 4';
		level: 4.
	world provinces at: province4 id put: province4.
	
	world addAction: (GeoBRProvinceOwnershipAction new province: '1'; regent: '1').
	world addAction: (GeoBRProvinceOwnershipAction new province: '2'; regent: '1').
	world addAction: (GeoBRProvinceOwnershipAction new province: '3'; regent: '1').
	world addAction: (GeoBRProvinceOwnershipAction new province: '4'; regent: '1').
	
	world addAction: (GeoBRLawOwnershipAction new province: '1'; regent: '1'; level: 2).
	world addAction: (GeoBRTempleOwnershipAction new province: '1'; regent: '1'; level: 2).
	world addAction: (GeoBRSourceOwnershipAction new province: '1'; regent: '1'; level: 1).
	world addAction: (GeoBRGuildOwnershipAction new province: '1'; regent: '1'; level: 1).
	
	world replay.
	
	self assert: (world collectedRegencyPointsFor: regent) equals: 18.
	self assert: (world domainPowerFor: regent) equals: 16
]

{ #category : #tests }
GeoBRBirthrightTest >> testAction001 [
	
	| world regent province1 |
	
	world := GeoBRWorld new.
	regent := GeoBRRegent new.
	regent id: '1'.
	regent name: 'Erin Velescarpe'.
	world regents at: regent id put: regent.
	
	province1 := GeoBRProvince new.
	province1
		id: '1';
		name: 'Province 1';
		level: 3.
	world provinces at: province1 id put: province1.
	
	
	world addAction: (GeoBRLawOwnershipAction new province: '1'; regent: '1'; level: 2).
	world addAction: (GeoBRLawOwnershipAction new province: '1'; regent: '1'; level: 3).
	
	
	world replay.
	
	self assert: world ownerships size equals: 1.
	self assert: world ownerships first level equals: 3.
	self assert: province1 ownerships size equals: 1.
	self assert: province1 ownerships first level equals: 3
]

{ #category : #tests }
GeoBRBirthrightTest >> testAction002 [
	
	| world regent province1 |
	
	world := GeoBRWorld new.
	regent := GeoBRRegent new.
	regent id: '1'.
	regent name: 'Erin Velescarpe'.
	world regents at: regent id put: regent.
	
	province1 := GeoBRProvince new.
	province1
		id: '1';
		name: 'Province 1';
		level: 3.
	world provinces at: province1 id put: province1.
	
	
	world addAction: (GeoBRGuildOwnershipAction new province: '1'; regent: '1'; level: 2).
	world addAction: (GeoBRGuildOwnershipAction new province: '1'; regent: '1'; level: 3).
	
	
	world replay.
	
	self assert: world ownerships size equals: 1.
	self assert: world ownerships first level equals: 3.
	self assert: province1 ownerships size equals: 1.
	self assert: province1 ownerships first level equals: 3
]

{ #category : #tests }
GeoBRBirthrightTest >> testAction003 [
	
	| world regent province1 |
	
	world := GeoBRWorld new.
	regent := GeoBRRegent new.
	regent id: '1'.
	regent name: 'Erin Velescarpe'.
	world regents at: regent id put: regent.
	
	province1 := GeoBRProvince new.
	province1
		id: '1';
		name: 'Province 1';
		level: 3.
	world provinces at: province1 id put: province1.
	
	
	world addAction: (GeoBRSourceOwnershipAction new province: '1'; regent: '1'; level: 2).
	world addAction: (GeoBRSourceOwnershipAction new province: '1'; regent: '1'; level: 3).
	
	
	world replay.
	
	self assert: world ownerships size equals: 1.
	self assert: world ownerships first level equals: 3.
	self assert: province1 ownerships size equals: 1.
	self assert: province1 ownerships first level equals: 3
]

{ #category : #tests }
GeoBRBirthrightTest >> testAction004 [
	
	| world regent province1 |
	
	world := GeoBRWorld new.
	regent := GeoBRRegent new.
	regent id: '1'.
	regent name: 'Erin Velescarpe'.
	world regents at: regent id put: regent.
	
	province1 := GeoBRProvince new.
	province1
		id: '1';
		name: 'Province 1';
		level: 3.
	world provinces at: province1 id put: province1.
	
	
	world addAction: (GeoBRTempleOwnershipAction new province: '1'; regent: '1'; level: 2).
	world addAction: (GeoBRTempleOwnershipAction new province: '1'; regent: '1'; level: 3).
	
	
	world replay.
	
	self assert: world ownerships size equals: 1.
	self assert: world ownerships first level equals: 3.
	self assert: province1 ownerships size equals: 1.
	self assert: province1 ownerships first level equals: 3
]

{ #category : #tests }
GeoBRBirthrightTest >> testAction005 [
	
	| world regent province1 |
	
	world := GeoBRWorld new.
	regent := GeoBRRegent new.
	regent id: '1'.
	regent name: 'Erin Velescarpe'.
	world regents at: regent id put: regent.
	
	province1 := GeoBRProvince new.
	province1
		id: '1';
		name: 'Province 1';
		level: 3.
	world provinces at: province1 id put: province1.
	
	
	world addAction: (GeoBRTempleOwnershipAction new province: '1'; regent: '1'; level: 2).
	world addAction: (GeoBRLawOwnershipAction new province: '1'; regent: '1'; level: 3).
	
	
	world replay.
	
	self assert: world ownerships size equals: 2.
	self assert: world ownerships first level equals: 2.
	self assert: world ownerships last level equals: 3.
	self assert: province1 ownerships size equals: 2.
	self assert: province1 ownerships first level equals: 2.
	self assert: province1 ownerships last level equals: 3
]

{ #category : #tests }
GeoBRBirthrightTest >> testBloodlineModifier [

	self assert: (GeoBRRegent new bloodline: 0) bloodlineModifier equals: -5.
	self assert: (GeoBRRegent new bloodline: 1) bloodlineModifier equals: -5.
	self assert: (GeoBRRegent new bloodline: 2) bloodlineModifier equals: -4.
	self assert: (GeoBRRegent new bloodline: 3) bloodlineModifier equals: -4.
	self assert: (GeoBRRegent new bloodline: 4) bloodlineModifier equals: -3.
	self assert: (GeoBRRegent new bloodline: 5) bloodlineModifier equals: -3.
	self assert: (GeoBRRegent new bloodline: 6) bloodlineModifier equals: -2.
	self assert: (GeoBRRegent new bloodline: 7) bloodlineModifier equals: -2.
	self assert: (GeoBRRegent new bloodline: 8) bloodlineModifier equals: -1.
	self assert: (GeoBRRegent new bloodline: 9) bloodlineModifier equals: -1.
	self assert: (GeoBRRegent new bloodline: 10) bloodlineModifier equals: 0.
	self assert: (GeoBRRegent new bloodline: 11) bloodlineModifier equals: 0.
	self assert: (GeoBRRegent new bloodline: 12) bloodlineModifier equals: 1.
	self assert: (GeoBRRegent new bloodline: 13) bloodlineModifier equals: 1.
	self assert: (GeoBRRegent new bloodline: 14) bloodlineModifier equals: 2.	
	self assert: (GeoBRRegent new bloodline: 15) bloodlineModifier equals: 2.
	self assert: (GeoBRRegent new bloodline: 16) bloodlineModifier equals: 3.
	self assert: (GeoBRRegent new bloodline: 17) bloodlineModifier equals: 3.
	self assert: (GeoBRRegent new bloodline: 18) bloodlineModifier equals: 4.
	self assert: (GeoBRRegent new bloodline: 19) bloodlineModifier equals: 4.
	self assert: (GeoBRRegent new bloodline: 20) bloodlineModifier equals: 5.
	self assert: (GeoBRRegent new bloodline: 21) bloodlineModifier equals: 5.
	self assert: (GeoBRRegent new bloodline: 22) bloodlineModifier equals: 6.
]

{ #category : #tests }
GeoBRBirthrightTest >> testLoyaltyAction001 [
	
	| world regent province1 |
	
	world := GeoBRWorld new.
	regent := GeoBRRegent new.
	regent id: '1'.
	regent name: 'Erin Velescarpe'.
	world regents at: regent id put: regent.
	
	province1 := GeoBRProvince new.
	province1
		id: '1';
		name: 'Province 1';
		level: 3.
	world provinces at: province1 id put: province1.
	
	
	world addAction: (GeoBRLoyaltyAverageAction  new province: '1').
	world addAction: (GeoBRLoyaltyHighAction new province: '1').
	
	
	world replay.
	
	self assert: province1 loyalty typeString equals: GeoBRLoyaltyHigh new typeString
]
