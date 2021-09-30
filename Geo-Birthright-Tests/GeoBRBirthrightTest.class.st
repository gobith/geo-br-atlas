Class {
	#name : #GeoBRBirthrightTest,
	#superclass : #TestCase,
	#category : #'Geo-Birthright-Tests'
}

{ #category : #tests }
GeoBRBirthrightTest >> test001 [

	"For example, Erin Velescarpe is a young Regent with a lot of work to do to carve out her domain. She owns four Provinces (levels 3, 2, 1, and 4 respectively) and five total Holdings (of levels 2, 2, 1, and 1). Her Bloodline score is 15, giving her a modifier of +2. At the beginning of the season, she collects 18 Regency Points."
	
	| regent province1 |
	regent := GeoBRRegent new name: 'Erin Velescarpe'.
	province1 := GeoBRProvince new.
	province1 id: 1.
	province1 name: 'Province 1'
]
