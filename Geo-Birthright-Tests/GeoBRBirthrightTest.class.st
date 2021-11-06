Class {
	#name : #GeoBRBirthrightTest,
	#superclass : #TestCase,
	#instVars : [
		'world'
	],
	#category : #'Geo-Birthright-Tests'
}

{ #category : #tests }
GeoBRBirthrightTest >> setUp [

	world := GeoBRWorld new.
	world repository: GeoBRTestRepository new
]

{ #category : #tests }
GeoBRBirthrightTest >> test001 [

	"For example, Erin Velescarpe is a young Regent with a lot of work to do to carve out her domain. She owns four Provinces (levels 3, 2, 1, and 4 respectively) and five total Holdings (of levels 2, 2, 1, and 1). Her Bloodline score is 15, giving her a modifier of +2. At the beginning of the season, she collects 18 Regency Points."

	|  regent province1 province2 province3 province4|

	world takeAction: (GeoBRAddRegentAction new id: '1'; name: 'Eric Velescarpe'; bloodline: 15; regencyPoints: 10).
	
	world takeAction: (GeoBRAddDomainAction new id: '2'; name: 'Erics Domain').
	
	world takeAction: (GeoBROwnershipAction2 new  owner: '1';  subject: '2').
	

	
	world takeAction: (GeoBRAddProvinceAction new id: '3'; name: 'Province 1'; level: 3; terrain: GeoBRLightForest new; loyalty: GeoBRLoyaltyAverage new).
	world takeAction: (GeoBRAddProvinceAction new id: '4'; name: 'Province 2'; level: 2; terrain: GeoBRLightForest new; loyalty: GeoBRLoyaltyAverage new).
	world takeAction: (GeoBRAddProvinceAction new id: '5'; name: 'Province 3'; level: 1; terrain: GeoBRLightForest new; loyalty: GeoBRLoyaltyAverage new).
	world takeAction: (GeoBRAddProvinceAction new id: '6'; name: 'Province 4'; level: 4; terrain: GeoBRLightForest new; loyalty: GeoBRLoyaltyAverage new).
	
	province1 := world poolAt: '3'.
	province2 := world poolAt: '4'.
	province3 := world poolAt: '5'.
	province4 := world poolAt: '6'.
	
	world takeAction: (GeoBROwnershipAction2 new  owner: '1';  subject: '3').
	world takeAction: (GeoBROwnershipAction2 new  owner: '1';  subject: '4').
	world takeAction: (GeoBROwnershipAction2 new  owner: '1';  subject: '5').
	world takeAction: (GeoBROwnershipAction2 new  owner: '1';  subject: '6').
	
	world takeAction: (GeoBRAddHoldingAction new id: '7'; province: '3';  level: 2;  type: 'law').
	world takeAction: (GeoBRAddHoldingAction new id: '8'; province: '3';  level: 2;  type: 'temple').
	world takeAction: (GeoBRAddHoldingAction new id: '9'; province: '3';  level: 1;  type: 'source').
	world takeAction: (GeoBRAddHoldingAction new id: '10'; province: '3';  level: 1;  type: 'guild').
	
	world takeAction: (GeoBROwnershipAction2 new  owner: '2';  subject: '7').
	world takeAction: (GeoBROwnershipAction2 new  owner: '2';  subject: '8').
	world takeAction: (GeoBROwnershipAction2 new  owner: '2';  subject: '9').
	world takeAction: (GeoBROwnershipAction2 new  owner: '2';  subject: '10').
	
	
	
	world replay.
	
	regent := world poolAt: '1'.
	
	"self assert: (world collectedRegencyPointsFor: regent) equals: 18.
	self assert: (world domainPowerFor: regent) equals: 16."
	
	world inspect
]

{ #category : #tests }
GeoBRBirthrightTest >> testAction001 [
	
	|  regent province1 |
	
	
	
	world takeAction: (GeoBRAddRegentAction new id: '1'; name: 'Eric Velescarpe'; bloodline: 13).
	
	world takeAction: (GeoBRAddProvinceAction new id: '1'; name: 'Province 1'; level: 3; terrain: GeoBRLightForest new; loyalty: GeoBRLoyaltyAverage new).
	
	regent := world regentAt: '1'.
	province1 := world provinceAt: '1'.
	
	world takeAction: (GeoBRLawOwnershipAction new province: '1'; owner: '1'; ruler: '1'; level: 2).
	world takeAction: (GeoBRLawOwnershipAction new province: '1'; owner: '1'; ruler: '1'; level: 3).
	
	self assert: world ownerships size equals: 1.
	self assert: world ownerships first level equals: 3.
	self assert: province1 ownerships size equals: 1.
	self assert: province1 ownerships first level equals: 3
]

{ #category : #tests }
GeoBRBirthrightTest >> testAction002 [
	
	|  regent province1 |
	

	world takeAction: (GeoBRAddRegentAction new id: '1'; name: 'Eric Velescarpe'; bloodline: 13).
	world takeAction: (GeoBRAddProvinceAction new id: '1'; name: 'Province 1'; level: 3; terrain: GeoBRLightForest new; loyalty: GeoBRLoyaltyAverage new).
	
	regent := world regentAt: '1'.
	province1 := world provinceAt: '1'.
	
	world takeAction: (GeoBRGuildOwnershipAction new province: '1'; owner: '1'; ruler: '1'; level: 2).
	world takeAction: (GeoBRGuildOwnershipAction new province: '1'; owner: '1'; ruler: '1'; level: 3).
	
	
	self assert: world ownerships size equals: 1.
	self assert: world ownerships first level equals: 3.
	self assert: province1 ownerships size equals: 1.
	self assert: province1 ownerships first level equals: 3
]

{ #category : #tests }
GeoBRBirthrightTest >> testAction003 [
	
	|  regent province1 |
	
	
	world takeAction: (GeoBRAddRegentAction new id: '1'; name: 'Eric Velescarpe'; bloodline: 13).
	
	world takeAction: (GeoBRAddProvinceAction new id: '1'; name: 'Province 1'; level: 3; terrain: GeoBRLightForest new; loyalty: GeoBRLoyaltyAverage new).
	
	regent := world regentAt: '1'.
	province1 := world provinceAt: '1'.
	
	world takeAction: (GeoBRSourceOwnershipAction new province: '1'; owner: '1'; ruler: '1'; level: 2).
	world takeAction: (GeoBRSourceOwnershipAction new province: '1'; owner: '1'; ruler: '1'; level: 3).
	

	
	self assert: world ownerships size equals: 1.
	self assert: world ownerships first level equals: 3.
	self assert: province1 ownerships size equals: 1.
	self assert: province1 ownerships first level equals: 3
]

{ #category : #tests }
GeoBRBirthrightTest >> testAction004 [
	
	|  regent province1 |
	
	
	world takeAction: (GeoBRAddRegentAction new id: '1'; name: 'Eric Velescarpe'; bloodline: 13).
	
	world takeAction: (GeoBRAddProvinceAction new id: '1'; name: 'Province 1'; level: 3; terrain: GeoBRLightForest new; loyalty: GeoBRLoyaltyAverage new).
	
	regent := world regentAt: '1'.
	province1 := world provinceAt: '1'.
	
	
	world takeAction: (GeoBRTempleOwnershipAction new province: '1'; owner: '1'; ruler: '1'; level: 2).
	world takeAction: (GeoBRTempleOwnershipAction new province: '1'; owner: '1'; ruler: '1'; level: 3).
	
	
	
	self assert: world ownerships size equals: 1.
	self assert: world ownerships first level equals: 3.
	self assert: province1 ownerships size equals: 1.
	self assert: province1 ownerships first level equals: 3
]

{ #category : #tests }
GeoBRBirthrightTest >> testAction005 [
	
	|  regent province1 |
	
	
	world takeAction: (GeoBRAddRegentAction new id: '1'; name: 'Eric Velescarpe'; bloodline: 13).
	
	world takeAction: (GeoBRAddProvinceAction new id: '1'; name: 'Province 1'; level: 3; terrain: GeoBRLightForest new; loyalty: GeoBRLoyaltyAverage new).
	
	regent := world regentAt: '1'.
	province1 := world provinceAt: '1'.
	
	
	world takeAction: (GeoBRTempleOwnershipAction new province: '1'; owner: '1'; ruler: '1'; level: 2).
	world takeAction: (GeoBRLawOwnershipAction new province: '1'; owner: '1'; ruler: '1'; level: 3).
	
	
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
	
	|  regent province1 |
	

	
	world takeAction: (GeoBRAddRegentAction new id: '1'; name: 'Eric Velescarpe'; bloodline: 13).
	
	world takeAction: (GeoBRAddProvinceAction new id: '1'; name: 'Province 1'; level: 3; terrain: GeoBRLightForest new; loyalty: GeoBRLoyaltyAverage new).
	
	regent := world regentAt: '1'.
	province1 := world provinceAt: '1'.
	
	world takeAction: (GeoBRLoyaltyAverageAction  new province: '1').
	world takeAction: (GeoBRLoyaltyHighAction new province: '1').
	
	
	
	self assert: province1 loyalty typeString equals: GeoBRLoyaltyHigh new typeString
]

{ #category : #tests }
GeoBRBirthrightTest >> testProvinceTerrain [
	
	|   province1 |
	
	
	
	world takeAction: (GeoBRAddProvinceAction new id: '1'; name: 'Province 1'; level: 3; terrain: GeoBRLightForest new; loyalty: GeoBRLoyaltyAverage new).
	
	province1 := world provinceAt: '1'.
	
	self assert: province1 sourceRating equals: 4
]

{ #category : #tests }
GeoBRBirthrightTest >> testProvinceTerrainModifier [
	
	|   province1 |
	
	
	world takeAction: (GeoBRAddProvinceAction new id: '1'; name: 'Province 1'; level: 3; terrain: (GeoBRLightForest new modifier: 2); loyalty: GeoBRLoyaltyAverage new).
	
	province1 := world provinceAt: '1'.
	
	self assert: province1 sourceRating equals: 6
]

{ #category : #tests }
GeoBRBirthrightTest >> testVasal001 [
	
	|  regent1 regent2 regent3 province1 |
	
	
	world takeAction: (GeoBRAddRegentAction new id: '1'; name: 'Owner'; bloodline: 10).
	world takeAction: (GeoBRAddRegentAction new id: '2'; name: 'Ruler 1'; bloodline: 10).
	world takeAction: (GeoBRAddRegentAction new id: '3'; name: 'Ruler 2'; bloodline: 10).
	
	regent1 := world regentAt: '1'.
	regent2 := world regentAt: '2'.
	regent3 := world regentAt: '3'.
	
	world takeAction: (GeoBRAddProvinceAction new id: '1'; name: 'Province 1'; level: 3; terrain: GeoBRLightForest new; loyalty: GeoBRLoyaltyAverage new).
	
	province1 := world provinceAt: '1'.
	
	world takeAction: (GeoBRProvinceOwnershipAction new ruler: '2'; owner: '1' ; province: '1').
	world takeAction: (GeoBRProvinceOwnershipAction new ruler: '3'; owner: '1' ; province: '1').
	
	
	
	self assert: province1 ownerships size equals: 1.
	self assert: province1 ownerships first owner equals: regent1.
	
	self assert: (world collectedRegencyPointsFor: regent1) equals: 3.
	self assert: (world domainPowerFor: regent1) equals: 3.
	
	self assert: (world collectedRegencyPointsFor: regent2) equals: 0.
	self assert: (world domainPowerFor: regent2) equals: 0.
	
	self assert: (world collectedRegencyPointsFor: regent3) equals: 0.
	self assert: (world domainPowerFor: regent3) equals: 0.
]
