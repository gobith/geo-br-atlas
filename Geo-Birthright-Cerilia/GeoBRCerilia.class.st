Class {
	#name : #GeoBRCerilia,
	#superclass : #GeoBRInitialData,
	#instVars : [
		'regents',
		'provinces',
		'domains',
		'holdings',
		'ownerships',
		'xmlProvinces',
		'xmlLegends',
		'csvProvinces',
		'csvProvinceDatas',
		'csvCharacters',
		'csvDomains',
		'provinceAreas'
	],
	#category : #'Geo-Birthright-Cerilia-Data'
}

{ #category : #accessing }
GeoBRCerilia class >> database [

	^ 'birthright'
]

{ #category : #accessing }
GeoBRCerilia class >> mountains [

	^ (GeoBRPathParser onFileNamed: GeoBRFileReferences mountains) parse
	

]

{ #category : #accessing }
GeoBRCerilia class >> paths [

	^ (GeoBRPathParser onFileNamed: GeoBRFileReferences paths) parse
	

]

{ #category : #accessing }
GeoBRCerilia class >> scale [

	^ 1
]

{ #category : #accessing }
GeoBRCerilia class >> woods [

	^ (GeoBRPathParser onFileNamed: GeoBRFileReferences woods) parse
	

]

{ #category : #accessing }
GeoBRCerilia >> addToWorld [



	regents do: [ :regent | 
		| id |
		id := self takeAction: (GeoBRAddRegentAction new
				       name: regent name;
				       bloodline: regent bloodline;
				       regencyPoints: regent regencyPoints).
		regent id: id ].

	domains do: [ :domain | 
		| id |
		id := self takeAction: (GeoBRAddDomainAction new name: domain name; abbr: domain shortName).
		domain id: id.

		domain owner ifNotNil: [ 
			self takeAction: (GeoBROwnershipAction new
					 owner: domain owner id;
					 subject: id) ] ].

	provinces do: [ :province | 
		| id |
		id := self takeAction: (GeoBRAddProvinceAction new
				       name: province name;
				       level: province level;
				       terrain: province terrain;
				       loyalty: province loyalty).
		province id: id.

		self takeAction: (GeoBROwnershipAction new
				 owner: province owner id;
				 subject: id) ].

	holdings do: [ :holding | 
		| id |
		id := self takeAction: (GeoBRAddHoldingAction new
				       province: holding province id;
				       level: holding level;
				       type: holding type).
		self takeAction: (GeoBROwnershipAction new
				 owner: holding owner id;
				 subject: id) ]
]

{ #category : #accessing }
GeoBRCerilia >> areaIdForProvinceName: provinceName [

	^ self provinceNameToAreaIdMapping at: provinceName ifAbsent: nil
]

{ #category : #accessing }
GeoBRCerilia >> coupleProvinceToArea [
	
	" areaId: (self areaIdForProvinceName: xmlProvince name);""areaIdToProvinceMapping := Dictionary new.
	(provinces select: [ :each | each areaId notNil ]) do: [ :province | 
		areaIdToProvinceMapping at: province areaId put: province ].

	provinceAreas do: [ :area | 
		(areaIdToProvinceMapping at: area center ifAbsent: nil) ifNotNil: [ 
			:province | area province: province id ] ]"


	| areaIdToProvinceMapping provinceAreaDict |
	
	provinceAreaDict := Dictionary new.
	provinceAreas do: [ :provinceArea | 
		provinceAreaDict at: provinceArea center put: provinceArea ].


	provinces do: [ :province | 
		| areaId areaIds |
		areaId := self areaIdForProvinceName: province name.

		areaIds := areaId isArray
			           ifTrue: [ areaId ]
			           ifFalse: [ Array with: areaId ].

		areaIds do: [ :point | 
			(provinceAreaDict at: point ifAbsent: [ nil ])
				ifNil: [  ]
				ifNotNil: [ :provinceArea | provinceArea province: province id ] ] ]
]

{ #category : #accessing }
GeoBRCerilia >> privateScript [

	| shortNameToDomains |
	provinces := Dictionary new.
	holdings := OrderedCollection new.
	regents := Dictionary new.
	domains := Dictionary new.
	shortNameToDomains := Dictionary new.
	


	(xmlLegends select: [ :each | each domain notNil ]) do: [ :legend | 
		| regent domain |
		regent := regents
			          at: legend name
			          ifAbsentPut: [ BRRegent new name: legend name ].
		domain := BRDomain new
			          name: legend domain;
			          shortName: legend id;
			          owner: regent.

		domains at: domain name put: domain ].


	(xmlLegends select: [ :each | each domain isNil ]) do: [ :legend | 
		| domain |
		domain := BRDomain new
			          name: legend name;
			          shortName: legend id;
			          owner: nil.

		domains at: domain name put: domain ].


	domains do: [ :domain | 
		shortNameToDomains at: domain shortName put: domain ].


	xmlProvinces do: [ :xmlProvince | 
		| province |
		province := BRProvince new
			            name: xmlProvince name;
			            level: xmlProvince level;
			            loyalty: GeoBRLoyaltyAverage new;
			            terrain: (self terrainForProvince: xmlProvince);
			            owner: (domains at: xmlProvince realm).
		provinces at: xmlProvince name put: province.
		xmlProvince holdings do: [ :xmlHolding | 
			| holding |
			xmlHolding owner ~= 'none' ifTrue: [ 
				holding := BRHolding new.
				holding
					province: province;
					level: xmlHolding level;
					type: xmlHolding type;
					owner: (shortNameToDomains at: xmlHolding owner ).
				holdings add: holding ] ] ].
	



	csvProvinces do: [ :csvProvince | 
		| province |
		province := provinces at: csvProvince name.
		self setTerrain: csvProvince terrain in: province ].
	

	
]

{ #category : #accessing }
GeoBRCerilia >> provinceNameToAreaIdMapping [

	| dict |
	dict := Dictionary new.

	dict
		
at: 'Aaldnjor' put:   519 @ 913  ;
at: 'Aaldvaar' put:   456 @ 845  ;
at: 'Aandvjor' put:   335 @ 1145  ;
at: 'Abattoir' put:   1510 @ 1669  ;
at: 'Abbatuor' put:   1111@2941  ;
at: 'Abrskiy' put:   3798 @ 1490  ;
at: 'Achiese' put:   1245 @ 2536  ;
at: 'Adaba' put:   2989 @ 2886  ;
at: 'Adara' put:   {3926 @ 2244 . 3940 @ 2289}  ;
at: 'Adeid' put:   3664 @ 2770  ;
at: 'Adler' put:   1760 @ 1404  ;
at: 'Adoga' put:   4224 @ 1691  ;
at: 'Adothcwr' put:   1519 @ 1157  ;
at: 'Adwyth Tallagh' put:   2980 @ 2192  ;
at: 'Aerele' put:   748 @ 2850  ;
at: 'Aftane' put:   3006 @ 2755  ;
at: 'Aghedir' put:   2761 @ 2530  ;
at: 'Agradil' put:   2572 @ 2534  ;
at: 'Akar Bluffs' put:   3475 @ 1853  ;
at: 'Akhada' put:   2333 @ 2617  ;
at: 'Aktarsk' put:   4005 @ 2511  ;
at: 'Alamier' put:   874 @ 2807  ;
at: 'Alamsreft' put:   739 @ 2393  ;
at: 'Alarin' put:   3224 @ 2557  ;
at: 'Alaroine' put:   866 @ 2340  ;
at: 'Alber' put: 2582 @ 741;
at: 'Albiele Island' put:   1058 @ 3113  ;
at: 'Alcamar' put:   3527 @ 3118  ;
at: 'Aldrud' put:   644 @ 486  ;
at: 'Algael' put:   1307 @ 2682  ;
at: 'Alhazir' put:   2600 @ 3017  ;
at: 'Alklund' put:   2009 @ 2358  ;
at: 'Allaight' put:   3587 @ 2392  ;
at: 'Allesrecht' put:   2528 @ 1724  ;
at: 'Almein' put:   3823 @ 2480  ;
at: 'Almeysk' put:   3292 @ 1513  ;
at: 'Ambles-on-Hillsfair' put:   2498 @ 2443  ;
at: 'Anathar' put:   1674 @ 1379  ;
at: 'Andujar' put:   2338 @ 2781  ;
at: 'Angar' put:   3553 @ 1918  ;
at: 'Angarr' put:   962 @ 1279  ;
at: 'Angbryn' put:   2234 @ 2313  ;
at: 'Annydwr' put:   1318 @ 2005  ;
at: 'Ansien' put:   1359 @ 2370  ;
at: 'Anuire' put:   687 @ 2657  ;
at: 'Anzlau' put:   2376 @ 1360  ;
at: 'Aral' put:   3737 @ 2037  ;
at: 'Aralzyk' put:   3755 @ 1437  ;
at: 'Ariya' put:   2788 @ 2944  ;
at: 'Arochlep' put:   2995 @ 611  ;
at: 'Arrowsmith' put:   3654 @ 1638  ;
at: 'Arvaald' put:   810 @ 1314  ;
at: 'Assarif' put:   2914 @ 2874  ;
at: 'Auchlaken' put:   2345 @ 1799  ;
at: 'Auchsward' put:   1935 @ 2014  ;
at: 'Auslauf' put:   2952 @ 595  ;
at: 'Avallaigh' put:   1088 @ 1711  ;
at: 'Avarien' put:   588 @ 2437  ;
at: 'Ayandir' put:   3931 @ 2805  ;
at: 'Aykbun' put:   4197 @ 1017  ;
at: 'Ayon' put:   3773 @ 1839  ;
at: 'Azada' put:   2621 @ 2943  ;
at: 'Azagkhul' put:   1733 @ 1342  ;
at: 'Azedas' put:   2945 @ 2936  ;
at: 'Aziev' put:   3224 @ 2103  ;
at: 'Bacaele' put:   343 @ 2238  ;
at: 'Baered' put:   4126 @ 3026  ;
at: 'Bagira' put:   3415 @ 2917  ;
at: 'Baikal' put:   3143 @ 2052  ;
at: 'Bair el-Tehara' put:   2515 @ 2631  ;
at: 'Baiyuda' put:   2337 @ 2361  ;
at: 'Balteruine' put:   1228 @ 2203  ;
at: 'Banien''s Deep' put:   1372@2887  ;
at: 'Bannoch' put:   1601 @ 1103  ;
at: 'Barein' put:   3853 @ 2834  ;
at: 'Barniere' put:   1811 @ 2301  ;
at: 'Barrow Woods' put:   1130 @ 1248  ;
at: 'Barserat' put:   2715 @ 2847  ;
at: 'Batukhan' put:   3887 @ 1115  ;
at: 'Bauth Rayad' put:   3789 @ 2256  ;
at: 'Bayside' put:   399 @ 2411  ;
at: 'Beid' put:   4039 @ 2679  ;
at: 'Belik' put:   1925 @ 728  ;
at: 'Bellam' put:   1193 @ 2665  ;
at: 'Ber Dairas' put:   2185 @ 2707  ;
at: 'Ber Djin' put:   3651 @ 2587  ;
at: 'Ber Falaia' put:   3785 @ 2772  ;
at: 'Ber Mera' put:   3955 @ 2139  ;
at: 'Ber Tarva' put:   2951 @ 2644  ;
at: 'Bergvaas' put:   443 @ 1088  ;
at: 'Beuraben' put:   2512 @ 2211  ;
at: 'Bevaldruor' put:   1129 @ 2153  ;
at: 'Bhaine' put:   351 @ 2468  ;
at: 'Bhalaene' put:   1131 @ 2516  ;
at: 'Bheline' put:   1053 @ 2606  ;
at: 'Bhindraith' put:   1150 @ 1785  ;
at: 'Bhrein' put:   649 @ 2536  ;
at: 'Bicheda' put:   3543 @ 2748  ;
at: 'Bierlev' put:   2854 @ 1928  ;
at: 'Bliene' put:   631 @ 2829  ;
at: 'Bindier' put:   483 @ 2753  ;
at: 'Binessin' put:   3511 @ 2241  ;
at: 'Birbeg' put:   2522 @ 2719  ;
at: 'Bjarkheim' put:   785 @ 844  ;
at: 'Bjarnheim' put:   427 @ 1301  ;
at: 'Bjondrig' put:   727 @ 1567  ;
at: 'Bjorlangen' put:   1221 @ 1414  ;
at: 'Bjorlen' put:   2925 @ 1024  ;
at: 'Bjornoya' put:   1222 @ 1098  ;
at: 'Blackmarch' put:   3588 @ 2192  ;
at: 'Blackruft' put:   1970 @ 1139  ;
at: 'Blackspire' put:   3687 @ 1426  ;
at: 'Blackwater' put:   2036 @ 2560  ;
at: 'Bloodbay' put:   778 @ 1778  ;
at: 'Bloodclaw' put:   3822 @ 1322  ;
at: 'the Bloodpeaks' put:   3863 @ 2213  ;
at: 'Bloodshroud' put:   1937 @ 2076  ;
at: 'Boden' put:   1166 @ 862  ;
at: 'Boerenbach' put:   2044 @ 2264  ;
at: 'Boganhaar' put:   1403 @ 1351  ;
at: 'Bogsend' put:   1521 @ 2393  ;
at: 'Boloshoy Kavkaz' put:   4187 @ 2405  ;
at: 'Boylspyr' put:   3411 @ 1831  ;
at: 'Braeme' put:   946 @ 2821  ;
at: 'Braethindyr' put:   1140 @ 1623  ;
at: 'Bran''s Retreat' put:   1576 @ 2097  ;
at: 'Brenlie' put:   nil  ;
at: 'Broken Hills' put:   3155 @ 2487  ;
at: 'Brokendale' put:   3059 @ 2567  ;
at: 'Brosien' put:   431 @ 2527  ;
at: 'Brothendar' put:   1336 @ 2613  ;
at: 'Brushfire' put:   1281 @ 2043  ;
at: 'Btumi' put:   3851 @ 2081  ;
at: 'Buchen' put:   2782 @ 726  ;
at: 'Bugbear''s Watch' put:   1939 @ 1519  ;
at: 'Burgl' put:   3177 @ 1643  ;
at: 'Burning Forest' put:   2687 @ 735  ;
at: 'Busada' put:   3039 @ 2673  ;
at: 'Buzu' put:   3963 @ 1298  ;
at: 'Byrnnor' put:   1032 @ 2161  ;
at: 'Caebstrech' put:   1877 @ 1165  ;
at: 'Caer Cwnnar' put:   1284 @ 1193  ;
at: 'Caer Dwyth' put:   1646 @ 1206  ;
at: 'Caercas' put:   1033 @ 2773  ;
at: 'Caerpriddy' put:   2310 @ 2280  ;
at: 'Caerwil' put:   926 @ 2723  ;
at: 'Calant' put:   453 @ 2145  ;
at: 'Callanlars' put:   135 @ 1224  ;
at: 'Calliana' put:   3854 @ 3088  ;
at: 'Calrie' put:   1352@2771  ;
at: 'Cape Alceis' put:   3668 @ 2957  ;
at: 'Cape Arvuold' put:   4298 @ 3112  ;
at: 'Cape Aswir' put:   4064 @ 2756  ;
at: 'Cape Hamah' put:   3334 @ 2883  ;
at: 'Cape Rahel' put:   4040 @ 2132  ;
at: 'Careine' put:   1675 @ 2272  ;
at: 'Caudraight' put:   1527 @ 2313  ;
at: 'Caulnor' put:   709 @ 2591  ;
at: 'Cecidein' put:   {3941 @ 2973 . 3976 @ 2959}  ;
at: 'Cedeina' put:   3871 @ 2338  ;
at: 'Challra' put:   1397 @ 872  ;
at: 'Chalsedon' put:   1292 @ 2418  ;
at: 'Chelyatev' put:   3520 @ 1509  ;
at: 'Cherovnal' put:   3908 @ 1748  ;
at: 'Chur' put:   1038 @ 1268  ;
at: 'Ciliene' put:   677 @ 2771  ;
at: 'Cilmwyaren' put:   3485 @ 2150  ;
at: 'City of Anuire' put:   nil  ;
at: 'Cleftrock' put: 3736 @ 2189 ;
at: 'Cliff''s Lament' put:   1631 @ 2168  ;
at: 'Cluhagen' put:   2898 @ 1830  ;
at: 'Coarsewell' put:   2544 @ 2374  ;
at: 'Coere' put:   510 @ 2635  ;
at: 'Cohrtab' put:   2594 @ 1756  ;
at: 'Colroch' put:   2832 @ 622  ;
at: 'Colrochteb' put:   2825 @ 495  ;
at: 'Conallier' put:   1134 @ 2374  ;
at: 'Cooling Bay' put:   2747 @ 823  ;
at: 'Cornelius'' Landing' put:   1841 @ 1632  ;
at: 'Coromandel' put:   3497 @ 2312  ;
at: 'Coryl' put:   2988 @ 1112  ;
at: 'Coulbaraigh' put:   2698 @ 2150  ;
at: 'Coullibaird' put:   1803 @ 2052  ;
at: 'Cravengate' put:   3412 @ 2200  ;
at: 'Crenier' put:   nil  ;
at: 'Crushing Hills' put:   713 @ 1854  ;
at: 'Crushing Rock' put:   1498 @ 1872  ;
at: 'Cu Haellyrd' put:   1636 @ 1954  ;
at: 'Cwlldon' put:   1052 @ 2282  ;
at: 'Cwmb Daghra' put:   2886 @ 2272  ;
at: 'Cwmb Mawr' put:   2959 @ 2293  ;
at: 'Cwmbheir' put:   1202 @ 1709  ;
at: 'Cwnddrrd' put:   1500 @ 889  ;
at: 'Cymryr' put:   1284 @ 1598  ;
at: 'Daikhar' put:   2971 @ 1233  ;
at: 'Dalceir' put:   {3770 @ 2918 . 3795 @ 2939 . 3828 @ 2987 . 3862 @ 3009}  ;
at: 'Dalmsrhuud' put:   263 @ 1238  ;
at: 'Danaroene' put:   1157 @ 2597  ;
at: 'Dankmaar' put:   617 @ 1292  ;
at: 'Dansk' put:   3323 @ 2079  ;
at: 'Dantier Island' put:   60 @ 1648  ;
at: 'Darkgate' put:   3389 @ 2527  ;
at: 'Darkhollow' put:   2918 @ 2183  ;
at: 'Darres'' End' put:   2654 @ 826  ;
at: 'Darsruud' put:   475 @ 1216  ;
at: 'Daubreisch' put:   1809 @ 1872  ;
at: 'Daulton' put:   611 @ 2650  ;
at: 'Daurengate' put:   1939 @ 1646  ;
at: 'Debissin' put:   3944 @ 2410  ;
at: 'Deepshadow' put:   1533 @ 2192  ;
at: 'Deicera' put:   4014 @ 2063  ;
at: 'Deired' put:   2547 @ 2826  ;
at: 'Deishel' put:   2229 @ 2604  ;
at: 'Deseirain' put:   779 @ 2304  ;
at: 'Deuchlach' put:   2781 @ 2065  ;
at: 'Deusei' put:   2400 @ 1861  ;
at: 'Dezeel' put:   2661 @ 2082  ;
at: 'Dhalaese' put:   625 @ 2111  ;
at: 'Dhalier' put:   nil  ;
at: 'Dhalsiel' put:   1125 @ 2061  ;
at: 'Dharilein' put:   992 @ 1394  ;
at: 'Dhoenel' put:   1248@2754  ;
at: 'Dhoneaghmiere' put:   1187 @ 1542  ;
at: 'Dhovjiir' put:   2187 @ 779  ;
at: 'Dinas Mawwy' put:   3392 @ 1954  ;
at: 'Dirche' put:   2790 @ 2382  ;
at: 'Djaalfund' put:   587 @ 728  ;
at: 'Djafra' put:   3404 @ 2658  ;
at: 'Djakhande' put:   3882 @ 2536  ;
at: 'Djef el-Kadir' put:   2842 @ 2888  ;
at: 'Djin Belim' put:   3596 @ 2529  ;
at: 'Djira' put:   3161 @ 2703  ;
at: 'Djurik' put:   1947 @ 533  ;
at: 'Dmitriya' put:   3671 @ 1866  ;
at: 'Dnepol' put:   4014 @ 1680  ;
at: 'Donorssk' put:   3442 @ 1462  ;
at: 'Donskoy' put:   3971 @ 2480  ;
at: 'Doom''s Peak' put:   842 @ 1846  ;
at: 'Dourat' put:   2698 @ 2763  ;
at: 'Draaska' put:   312 @ 808  ;
at: 'Drachenjaw' put:   2578 @ 898  ;
at: 'Drachenwehr' put:   2747 @ 598  ;
at: 'Draga-Zai' put:   1643 @ 922  ;
at: 'Drauch' put:   2720 @ 660  ;
at: 'Dreidachs' put:   2767 @ 530  ;
at: 'Druinedd' put:   1427 @ 995  ;
at: 'Duarlavka' put:   2862 @ 1391  ;
at: 'Dubeswald' put:   2584 @ 1191  ;
at: 'Duegel' put:   3187 @ 1811  ;
at: 'Duene' put:   779 @ 2811  ;
at: 'Duerlin' put:   1113@2850  ;
at: 'Duornil' put:   1590 @ 2225  ;
at: 'Duriene' put:   620 @ 2482  ;
at: 'Duringhuhl' put:   2278 @ 1878  ;
at: 'Dvasviik' put:   220 @ 1160  ;
at: 'Dwarf''s Deeping' put:   3316 @ 2251  ;
at: 'Dwarf''s Hold' put:   1352 @ 1891  ;
at: 'Dzehbzed' put:   2948 @ 1997  ;
at: 'Dzernin' put:   3308 @ 2343  ;
at: 'Dzhamhou' put:   3419 @ 1371  ;
at: 'Dzhl' put:   3729 @ 2121  ;
at: 'East Direwood' put:   3326 @ 2720  ;
at: 'Ebbingtruch' put:   2286 @ 1987  ;
at: 'Edarlaskyy' put:   2967 @ 1409  ;
at: 'Edel' put:   1991 @ 2234  ;
at: 'Edlin' put:   1133 @ 2803  ;
at: 'Eiresmachen' put:   2665 @ 1135  ;
at: 'Elevesnemiere' put:   606 @ 2364  ;
at: 'Elfhaben' put:   2866 @ 1728  ;
at: 'Elfsdemise' put:   1308 @ 1815  ;
at: 'Elfseyes' put:   1584 @ 1526  ;
at: 'Endier' put:   805 @ 2590  ;
at: 'Endlun' put:   2872 @ 2037  ;
at: 'Eolrab' put:   2490 @ 2122  ;
at: 'Erystwyth' put:   2399 @ 2262  ;
at: 'Esmersdan' put:   1572 @ 1844  ;
at: 'Euchen' put:   2646 @ 641  ;
at: 'Evershruden' put:   1967 @ 1205  ;
at: 'Evuarr' put:   nil  ;
at: 'Facessin' put:   2424 @ 2606  ;
at: 'Faestadt' put:   1730 @ 1656  ;
at: 'Fairfield' put:   1139 @ 2700  ;
at: 'Fallen Rock' put:   1426 @ 1884  ;
at: 'Falling Timber' put:   711 @ 1735  ;
at: 'Fara Zhainge' put:   3048 @ 2849  ;
at: 'Faulfell' put:   1651 @ 1879  ;
at: 'Fedasa' put:   2405 @ 2373  ;
at: 'Fellrock' put:   2617 @ 2346  ;
at: 'Feyulfsky' put:   3060 @ 1581  ;
at: 'Fhiellewyn' put:   3423 @ 2434  ;
at: 'Fhirda' put:   3509 @ 2830  ;
at: 'Fhoruile' put:   462 @ 2033  ;
at: 'Fhylallien' put:   1507 @ 2046  ;
at: 'Fjoltyr' put:   633 @ 854  ;
at: 'Floodspaeth' put:   769 @ 1933  ;
at: 'Folda Fjord' put:   1314 @ 772  ;
at: 'Forestmarch' put:   {3150 @ 2247 . 3111 @ 2225} ;
at: 'Freestead' put:   617 @ 1853  ;
at: 'Freikstaad' put:   2031 @ 659  ;
at: 'Friedlund' put:   1908 @ 2277  ;
at: 'Froschschloss' put:   2586 @ 582  ;
at: 'Froylaad' put:   231 @ 861  ;
at: 'Furzitz' put:   3204 @ 1844  ;
at: 'Garradh' put:   3517 @ 2364  ;
at: 'Garten Pass' put:   1904 @ 1515  ;
at: 'Gaurgonsbaet' put:   1714 @ 1832  ;
at: 'Ghada' put:   2397 @ 2863  ;
at: 'Ghaelie' put:   nil  ;
at: 'Ghalliere' put:   1339 @ 2538  ;
at: 'Gheirut' put:   3969 @ 2327  ;
at: 'Ghiere' put:   935 @ 2461  ;
at: 'Ghonallison' put:   714 @ 2148  ;
at: 'Ghoried' put:   1025 @ 2695  ;
at: 'Ghoudaia' put:   2246 @ 2426  ;
at: 'Ghouref' put:   2287 @ 2692  ;
at: 'Ghourin' put:   3632 @ 2708  ;
at: 'Ghyllwn' put:   1408 @ 1969  ;
at: 'Giant''s Fastness' put:   1100 @ 1496  ;
at: 'Gigha' put:   79 @ 1421  ;
at: 'Glaznyy' put:   3535 @ 1648  ;
at: 'Glyncaerwyn' put:   3542 @ 2451  ;
at: 'Golbrag' put:   2654 @ 1776 ;
at: 'The Gorge' put:   648 @ 1929  ;
at: 'Gorgon''s Claw' put:   1773 @ 1549  ;
at: 'Gortz' put:   3824 @ 1205  ;
at: 'Gradny' put:   3213 @ 2330  ;
at: 'Gredaur' put:   2712 @ 1225  ;
at: 'Green Mountains' put:   4183 @ 3077  ;
at: 'Greenlock' put:   2563 @ 2290  ;
at: 'Greensward' put:   443 @ 1894  ;
at: 'Gulfport' put:   1491 @ 2595  ;
at: 'Gundviir' put:   687 @ 957  ;
at: 'Gwyddral' put:   1554 @ 1254  ;
at: 'Haarlik' put:   2921 @ 902  ;
at: 'Haekholfn' put:   448 @ 1144  ;
at: 'Haesrien' put:   700 @ 2314  ;
at: 'Haldallen' put:   1317 @ 1298  ;
at: 'Haldwaren' put:   2747 @ 1313  ;
at: 'Halried' put:   1235@2843  ;
at: 'Halten' put:   1141 @ 1098  ;
at: 'Hamein' put:   1805 @ 2384  ;
at: 'Harlskaang' put:   387 @ 923  ;
at: 'Isle of the Harpy' put:   2194 @ 2975  ;
at: 'Harpy''s Watch' put:   {2196 @ 2883 . 2230 @ 2876} ;
at: 'Hauptrehr' put:   {2756 @ 1815 . 2713 @ 1793 } ;
at: 'Helkstraad' put:   148 @ 1152  ;
at: 'Hellforge' put:   3643 @ 2201  ;
at: 'Helmshaven' put:   638 @ 2005  ;
at: 'Hidaele' put:   954 @ 1442  ;
at: 'High Asarwe' put:   2230 @ 2532  ;
at: 'Highvale' put:   3320 @ 2422  ;
at: 'Hildon' put:   823 @ 2233  ;
at: 'Hilov' put:   3972 @ 1903  ;
at: 'Hjarrsmark' put:   664 @ 1181  ;
at: 'Hjolgrun' put:   568 @ 811  ;
at: 'Hjorvaal' put:   769 @ 1253  ;
at: 'Hlossroch' put:   3088 @ 638  ;
at: 'Hoarladt' put:   1781 @ 1480  ;
at: 'Hoehnaen' put:   1387 @ 2149  ;
at: 'Hoeskal' put:   592 @ 1164  ;
at: 'Hoklep' put:   2071 @ 1126  ;
at: 'Holdane''s End' put:   3111 @ 977  ;
at: 'Holde' put:   2801 @ 909  ;
at: 'Hollenvik' put:   606 @ 1424  ;
at: 'Holstadt' put:   2826 @ 1683  ;
at: 'Holt' put:   3466 @ 2031  ;
at: 'Homellin' put:   3125 @ 2628  ;
at: 'Hope''s Demise' put:   1449 @ 2281  ;
at: 'Hor-than' put:   1684 @ 797  ;
at: 'Horvliik' put:   824 @ 650  ;
at: 'Houran' put:   2632 @ 2832  ;
at: 'Hovrimm' put:   1758 @ 927  ;
at: 'Hrukk' put:   756 @ 1036  ;
at: 'Hruthjik' put:   1882 @ 802  ;
at: 'Hurgz' put:   3388 @ 1747  ;
at: 'Hvarliik' put:   373 @ 1192  ;
at: 'Ice Haven' put:   480 @ 1785  ;
at: 'Idzar' put:   1587 @ 848  ;
at: 'Ilfressen' put:   2873 @ 1602  ;
at: 'Ilien' put:   1013 @ 2878  ;
at: 'Innherad' put:   1065 @ 1101  ;
at: 'Innsmark' put:   523 @ 1105  ;
at: 'Innsroch' put:   3191 @ 650  ;
at: 'Inysk' put:   3004 @ 1958  ;
at: 'Irbouda' put:   2645 @ 2634  ;
at: 'Iron Gap' put:   3696 @ 2361  ;
at: 'Ironguard' put:   3736 @ 2269  ;
at: 'Irtysk' put:   3676 @ 1991  ;
at: 'Iseare' put:   1620 @ 2002  ;
at: 'Islien' put:   331 @ 2626  ;
at: 'Itave' put:   4010 @ 2779  ;
at: 'Izedas' put:   3477 @ 2987  ;
at: 'Jardwessen' put:   2828 @ 1272  ;
at: 'Jarnborg' put:   954 @ 665  ;
at: 'Jarstoldt' put:   2871 @ 788  ;
at: 'Jeifel' put:   2889 @ 2708  ;
at: 'Jharvild' put:   1944 @ 850  ;
at: 'Jogh Warren' put:   1665 @ 1748  ;
at: 'Jograb' put:   3166 @ 1713  ;
at: 'Jokkajoen' put:   449 @ 1006  ;
at: 'Junfjor' put:   2087 @ 580  ;
at: 'Jurva' put:   550 @ 988  ;
at: 'Kafrin' put:   2906 @ 2799  ;
at: 'Kal-Saitharak' put:   1543 @ 1581  ;
at: 'Kandalask' put:   939 @ 743  ;
at: 'Kaniera' put:   3456 @ 2285  ;
at: 'Kantswatch' put:   1980 @ 974  ;
at: 'Karkev' put:   3096 @ 1984  ;
at: 'Karljappen' put:   2948 @ 1634  ;
at: 'Kauth' put:   2740 @ 746  ;
at: 'Kazal-Zai' put:   1812 @ 1014  ;
at: 'Kearn' put:   2890 @ 677  ;
at: 'Kfeira' put:   2729 @ 3021  ;
at: 'Khesselim' put:   2130 @ 2788  ;
at: 'Khousaba' put:   2673 @ 2533  ;
at: 'Khoused' put:   2438 @ 2784  ;
at: 'Khul-Na' put:   1614 @ 753  ;
at: 'Khurin-Azur' put:   1775 @ 1199  ;
at: 'Kierholme' put:   1730 @ 1939  ;
at: 'Kiyegov' put:   3938 @ 2581  ;
at: 'Knana' put:   3832 @ 1396  ;
at: 'Kobar' put:   3130 @ 1282  ;
at: 'Kolinau' put:   4203 @ 1108  ;
at: 'Kolyma' put:   3732 @ 1742  ;
at: 'Kopingdal' put:   1946 @ 617  ;
at: 'Kordan' put:   2829 @ 841  ;
at: 'Kostwode' put:   2807 @ 1829  ;
at: 'Kouzir' put:   2857 @ 2958  ;
at: 'Kumar' put:   3035 @ 974  ;
at: 'Kurmansk' put:   3152 @ 1962  ;
at: 'Kustagran' put:   3911 @ 1510  ;
at: 'Kvigmarheim' put:   2028 @ 775  ;
at: 'Land''s Victory' put:   1742 @ 2119  ;
at: 'Landsborough' put:   2007 @ 2117  ;
at: 'Laoghaire' put:   2019 @ 2648  ;
at: 'Laptevykh' put:   3802 @ 1702  ;
at: 'Laraeth' put:   940 @ 2360  ;
at: 'Lathier' put:   nil  ;
at: 'Lausruf' put:   1818 @ 1972  ;
at: 'Lazzgrad' put:   2971 @ 1325  ;
at: 'Leipzur' put:   2234 @ 1920  ;
at: 'Leivika' put:   336 @ 1300  ;
at: 'Lektra' put:   3002 @ 1030  ;
at: 'Lemnjohen' put:   1116 @ 1419  ;
at: 'Levasta' put:   4131 @ 1624  ;
at: 'Liispyk' put:   3203 @ 1959  ;
at: 'Lindholme' put:   523 @ 1942  ;
at: 'Llandrae' put:   2126 @ 2309  ;
at: 'Llewhoellen' put:   1404 @ 2057  ;
at: 'Llwaiss' put:   1319 @ 997  ;
at: 'Llyrandor' put:   1315 @ 1699  ;
at: 'Llyvwyngsiele' put:   3522 @ 2112  ;
at: 'Loch Shel' put:   2967 @ 741  ;
at: 'Loden' put:   3440 @ 1608  ;
at: 'Lofkirdik' put:   873 @ 1240  ;
at: 'Longfjord' put:   2041 @ 2469  ;
at: 'Lorka' put:   3992 @ 1192  ;
at: 'Lost Realm' put:   nil  ;
at: 'Low Asarwe' put:   2131 @ 2591  ;
at: 'Lukzor' put:   4046 @ 1346  ;
at: 'Lyssan' put:   1734 @ 2351  ;
at: 'Markazor Province ?' put: 1117 @ 1903 ;
at: 'Madrik' put:   3690 @ 1569  ;
at: 'Maesford' put:   823 @ 2486  ;
at: 'Maesilar' put:   1171 @ 2248  ;
at: 'Maghabhie' put:   2994 @ 2093  ;
at: 'Mairada' put:   3864 @ 2917  ;
at: 'Mandal' put:   1134 @ 959  ;
at: 'Marchbehr' put:   2762 @ 1936  ;
at: 'Marhab' put:   4155 @ 2012  ;
at: 'Marilen' put:   457 @ 2615  ;
at: 'Marloer''s Gap' put:   1098 @ 2022  ;
at: 'Masetiele' put:   4157 @ 2949  ;
at: 'Masetium' put:   3950 @ 3154  ;
at: 'Massenhode' put:   2171 @ 2027  ;
at: 'Meid Ain' put:   2449 @ 2518  ;
at: 'Meid Assada' put:   3183 @ 2755  ;
at: 'Meid Tarvai' put:   2623 @ 2715  ;
at: 'Meid Zhirgen' put:   2405 @ 2699  ;
at: 'Meklsburg' put:   1875 @ 1915  ;
at: 'Melekes' put:   4100 @ 2453  ;
at: 'Mergarrote' put:   870 @ 1788  ;
at: 'Mermoune' put:   2085 @ 2712  ;
at: 'Mesel' put:   2876 @ 2374  ;
at: 'Mesire' put:   3142 @ 2870  ;
at: 'Mettle' put:   1674 @ 1505  ;
at: 'Mhelliviene' put:   967 @ 1888  ;
at: 'Mholien' put:   1284 @ 2289  ;
at: 'Mhowe' put:   1824 @ 2485  ;
at: 'Mickelbraun' put:   3156 @ 1193  ;
at: 'Midjarna' put:   1296 @ 1486  ;
at: 'Mielen' put:   nil  ;
at: 'Milfynn' put:   2259 @ 2087  ;
at: 'Minisk' put:   3895 @ 1266  ;
at: 'Mistil' put:   1646 @ 2381  ;
at: 'Mjollinar' put:   2860 @ 1221  ;
at: 'Moere' put:   767 @ 2693  ;
at: 'Moergen' put:   1444 @ 2488  ;
at: 'Molabrech' put:   2963 @ 1778  ;
at: 'Molevof' put:   3060 @ 1496  ;
at: 'Monellrha' put:   1550 @ 998  ;
at: 'Monsedge' put:   681 @ 2213  ;
at: 'Morbuch' put:   2976 @ 819  ;
at: 'Moriel' put:   1411 @ 2580  ;
at: 'Morrins' put:   3831 @ 1591  ;
at: 'Morwyth' put:   3458 @ 2495  ;
at: 'Motere' put:   3585 @ 2273  ;
at: 'Motile' put:   1593 @ 1723  ;
at: 'Mountainsedge' put:   1050 @ 1834  ;
at: 'Moura' put:   2298 @ 2890  ;
at: 'Movorsk' put:   3404 @ 2061  ;
at: 'Muellan' put:   2468 @ 1919  ;
at: 'Murthang' put:   3285 @ 1698  ;
at: 'Musbrahlen' put:   2380 @ 1932  ;
at: 'Mutian''s Point' put:   1578 @ 1345  ;
at: 'Mythelwyd' put:   2179 @ 2113  ;
at: 'Nabhriene' put:   675 @ 2423  ;
at: 'Nalhorske' put:   718 @ 1214  ;
at: 'Namal' put:   3225 @ 2831  ;
at: 'Namverg' put:   696 @ 1360  ;
at: 'Narzur' put:   2143 @ 1920  ;
at: 'Nentril' put:   523 @ 2408  ;
at: 'Nenza' put:   4268 @ 1589  ;
at: 'Newtonor' put:   181 @ 1277  ;
at: 'Newyth' put:   2118 @ 2203  ;
at: 'Nietier' put:   538 @ 2202  ;
at: 'Nikolai' put:   3569 @ 1826  ;
at: 'Njorl' put:   3079 @ 1230  ;
at: 'Njorldar' put:   550 @ 610  ;
at: 'Nob Heath' put:   2412 @ 2156  ;
at: 'Nochlauch' put:   2656 @ 2237  ;
at: 'Nodarch' put:   2684 @ 1891  ;
at: 'Nolien' put:   793 @ 1664  ;
at: 'Nordcapp' put:   1156 @ 796  ;
at: 'Nordricht' put:   3205 @ 1020  ;
at: 'North Caelcorwynn' put:   nil  ;
at: 'North Deeps' put:   3068 @ 2103  ;
at: 'North Marten' put:   3384 @ 2290  ;
at: 'Northcape' put:   4102 @ 2921  ;
at: 'Northvale' put:   1431@2783  ;
at: 'Nortmoor' put:   904 @ 2152  ;
at: 'Norvsk' put:   3977 @ 1353  ;
at: 'Nourne' put:   2860 @ 970  ;
at: 'Novgorik' put:   3211 @ 2403  ;
at: 'Nulthan' put:   1797 @ 781  ;
at: 'Nunkappel' put:   1896 @ 2360  ;
at: 'Nurida' put:   3427 @ 2843  ;
at: 'Nys Annwn' put:   3208 @ 1127  ;
at: 'Nyurehv' put:   3066 @ 1401  ;
at: 'Nyurskyy' put:   3057 @ 1343  ;
at: 'Oelfrun' put:   619 @ 677  ;
at: 'Okati' put:   3749 @ 1607  ;
at: 'Olapeysk' put:   3707 @ 1492  ;
at: 'Orog''s Head' put:   1396 @ 1522  ;
at: 'Osoeriene' put:   1405 @ 2416  ;
at: 'Osternord' put:   1889 @ 2132  ;
at: 'Ostwode' put:   3137 @ 754  ;
at: 'Oulu' put:   1020 @ 972  ;
at: 'Oused' put:   2977 @ 2700  ;
at: 'Pashacht' put:   2570 @ 2086  ;
at: 'Patea' put:   3728 @ 1938  ;
at: 'Pavisk' put:   4101 @ 1132  ;
at: 'Pavstrakhan' put:   3519 @ 1608  ;
at: 'Pechalinn' put:   612 @ 2243  ;
at: 'Pelt' put:   1524 @ 1767  ;
at: 'Periltrees' put:   1234 @ 2092  ;
at: 'Pervezniki' put:   3343 @ 1460  ;
at: 'Petnoi' put:   4078 @ 1076  ;
at: 'Pipryet' put:   4043 @ 2412  ;
at: 'Pitea' put:   1285 @ 872  ;
at: 'Plumbago' put:   1421 @ 1614  ;
at: 'Podenstahl' put:   2573 @ 2150  ;
at: 'Point Qasar' put:   4204 @ 1934  ;
at: 'Port Helen' put:   88 @ 1330  ;
at: 'Portage' put:   347 @ 2338  ;
at: 'Proliv' put:   3830 @ 1809  ;
at: 'The Promontory' put:   1683 @ 2144  ;
at: 'Puggzeg' put:   3469 @ 1759  ;
at: 'Puinol' put:   884 @ 1976  ;
at: 'Qadal' put:   3549 @ 2624  ;
at: 'Rafr' put:   2975 @ 2537  ;
at: 'Raka-Zai' put:   1853 @ 911  ;
at: 'Ral Vorgrad' put:   3114 @ 1859  ;
at: 'Ranien' put:   1598 @ 2325  ;
at: 'Ras Assad' put:   3093 @ 2785  ;
at: 'Ras Bedra' put:   2751 @ 2660  ;
at: 'Ras Beiber' put:   3556 @ 3048  ;
at: 'Ras Chedin' put:   4110 @ 1970  ;
at: 'Ras Dheiredin' put:   3791 @ 2348  ;
at: 'Ras Dhoumaire' put:   3496 @ 2695  ;
at: 'Ras Gherdin' put:   3880 @ 2439  ;
at: 'Ras Ghineb' put:   2883 @ 2628  ;
at: 'Ras Ghul' put:   3316 @ 2527  ;
at: 'Ras Medecin' put:   3302 @ 2013  ;
at: 'Ras Mhin' put:   3754 @ 2590  ;
at: 'Ras Nabil' put:   3932 @ 2665  ;
at: 'Redfoot' put:   3725 @ 1360  ;
at: 'Redoubt' put:   454 @ 2245  ;
at: 'Rhoisneibhal' put:   1479 @ 1071  ;
at: 'Rhumannen' put:   999 @ 2536  ;
at: 'Rhuobhe' put:   545 @ 2317  ;
at: 'Rig' put:   3914 @ 1836  ;
at: 'Rivenrock' put:   1662 @ 2053  ;
at: 'Rivenrock II' put:   nil  ;
at: 'Riverford' put:   981 @ 1796  ;
at: 'Riverspring' put:   1172 @ 1950  ;
at: 'Riveside' put:   793 @ 1513  ;
at: 'Rivien' put:   520 @ 2066  ;
at: 'Rjutaffel' put:   430 @ 759  ;
at: 'Roaren' put:   2580 @ 806  ;
at: 'Rohrgaard' put:   1838 @ 2178  ;
at: 'Romiene' put:   857 @ 1463  ;
at: 'Ruorven' put:   1594 @ 2461  ;
at: 'Rovan' put:   938 @ 959  ;
at: 'Ruapacht' put:   2081 @ 2129  ;
at: 'Ruelshegh' put:   2682 @ 1988  ;
at: 'Rhuiddar' put:   1410 @ 1232  ;
at: 'Ruidewash' put:   987 @ 1672  ;
at: 'Rulsfeg' put:   2915 @ 1151  ;
at: 'Ruorkhe' put:   1752 @ 2239  ;
at: 'Ry''Peski' put:   4036 @ 2559  ;
at: 'Rzhlevskyy' put:   2990 @ 1519  ;
at: 'Saerskaap' put:   761 @ 1407  ;
at: 'Sage''s Fen' put:   1505 @ 1498  ;
at: 'Sahadein' put:   3900 @ 2743  ;
at: 'Sahaiad' put:   3429 @ 2759  ;
at: 'Salviene' put:   1759 @ 2441  ;
at: 'Saurmath' put:   3854 @ 2167  ;
at: 'Schlessblut' put:   3136 @ 1078  ;
at: 'Seamist' put:   450 @ 2442  ;
at: 'Seaport' put:   382 @ 1943  ;
at: 'Seasdeep' put:   303 @ 2517  ;
at: 'Seasedge' put:   354 @ 2147  ;
at: 'Seaward' put:   nil  ;
at: 'Sehaka' put:   715 @ 709  ;
at: 'Seidre' put:   2807 @ 2823  ;
at: 'Seif el-Avarra' put:   2619 @ 2430  ;
at: 'Seiria' put:   3343 @ 2636  ;
at: 'Selkhauske' put:   160 @ 1071  ;
at: 'Sendouras' put:   1237 @ 2336  ;
at: 'Sere''s Hold' put:   1648 @ 1621  ;
at: 'Serien' put:   nil  ;
at: 'Serifel' put:   2339 @ 2508  ;
at: 'Serimset' put:   558 @ 1878  ;
at: 'Serir Rigal' put:   2319 @ 2435  ;
at: 'Sevlakol' put:   2930 @ 1896  ;
at: 'Sh''kkra' put:   1001 @ 1141  ;
at: 'Shadowgreen' put:   1304@2932  ;
at: 'Shattered Hills' put:   1228 @ 1906  ;
at: 'Shauz' put:   4068 @ 1220  ;
at: 'Shir''kh''an' put:   939 @ 1185  ;
at: 'Shirshet' put:   2166 @ 2435  ;
at: 'Shoufal' put:   2803 @ 2733  ;
at: 'Shudder Cliff' put:   3169 @ 946  ;
at: 'Siast' put:   3042 @ 1873  ;
at: 'Sideath' put:   1385 @ 1698  ;
at: 'Sidhuire' put:   1043 @ 1597  ;
at: 'Silverheart' put:   1123 @ 1319  ;
at: 'Sjalikfjord' put:   2071 @ 841  ;
at: 'Sjarkhoelle' put:   628 @ 1055  ;
at: 'Sjaruud' put:   832 @ 756  ;
at: 'Skansoeren' put:   1302 @ 1398  ;
at: 'Skapa Hjarring' put:   212 @ 1011  ;
at: 'Skaplan' put:   3054 @ 1076  ;
at: 'Sleppsig' put:   2801 @ 1173  ;
at: 'Slieve Siona' put:   3064 @ 2195  ;
at: 'Snogatroi' put:   3299 @ 1770  ;
at: 'Sodenside' put:   3000 @ 927  ;
at: 'Soileite' put:   1373 @ 2265  ;
at: 'Solung Bank' put:   952 @ 875  ;
at: 'Soniele' put:   978 @ 1544  ;
at: 'Sonnelind' put:   904 @ 1587  ;
at: 'Sorelies' put:   816 @ 2139  ;
at: 'Sorfeet' put:   2774 @ 969  ;
at: 'Soroya' put:   1048 @ 750  ;
at: 'South Caelcorwynn' put:   nil  ;
at: 'South Deeps' put:   3056 @ 2278  ;
at: 'South Ibnoume' put:   3746 @ 2525  ;
at: 'South Marten' put:   3405 @ 2361  ;
at: 'Soutmoor' put:   928 @ 2249  ;
at: 'Sovradaloy' put:   3355 @ 2164  ;
at: 'The Spiderfell' put:   916 @ 2616  ;
at: 'Spiritsend' put:   1437 @ 2678  ;
at: 'Stangajord' put:   285 @ 927  ;
at: 'Starkhundt' put:   2118 @ 944  ;
at: 'Steppegrad' put:   2903 @ 1470  ;
at: 'Stjolvar' put:   359 @ 1038  ;
at: 'Stnerba' put:   3967 @ 1801  ;
at: 'The Stone Field' put:   2907 @ 2524  ;
at: 'Stone''s End' put:   1421 @ 1777  ;
at: 'Storm''s Release' put:   642 @ 1699  ;
at: 'Stormwatch' put:   3654 @ 2275  ;
at: 'Sufhanie' put:   836 @ 2067  ;
at: 'Sulaia' put:   2116 @ 2475  ;
at: 'Sunder Falls' put:   1535 @ 1414  ;
at: 'Sunken Lands' put:   1524 @ 2508  ;
at: 'Surtafel' put:   2057 @ 2022  ;
at: 'Sutren Hills' put:   1305 @ 2157  ;
at: 'Svarkannek' put:   545 @ 1258  ;
at: 'Svesmail' put:   3818 @ 2122  ;
at: 'Svinoy Island' put:   1994 @ 404  ;
at: 'The Swanwood' put:   3211 @ 2187  ;
at: 'Sykvar' put:   4123 @ 1723  ;
at: 'Taeg Plain' put:   4183 @ 2999  ;
at: 'Taelrhud' put:   279 @ 1053  ;
at: 'Taldy' put:   3963 @ 1298  ;
at: 'Talhundt' put:   2161 @ 862  ;
at: 'Taliern' put:   546 @ 2561  ;
at: 'Tariene' put:   367 @ 2039  ;
at: 'Tarlhass' put:   1837 @ 664  ;
at: 'Tarvonyy' put:   3234 @ 2220  ;
at: 'Tawir' put:   2968 @ 2402  ;
at: 'Tegher' put:   2702 @ 2940  ;
at: 'Temir' put:   4090 @ 1307  ;
at: 'Tenarien' put:   1033 @ 2368  ;
at: 'Tgar' put:   4042 @ 1759  ;
at: 'Thalbrough' put:   1358 @ 1116  ;
at: 'Thasbyrn' put:   705 @ 2076  ;
at: 'Thoralinar' put:   1192 @ 2433  ;
at: 'Thrugger' put:   3264 @ 1989  ;
at: 'Thuringode' put:   2037 @ 1900  ;
at: 'Thurzimm' put:   932 @ 1058  ;
at: 'Tier' put:   831 @ 2722  ;
at: 'Tiess' put:   3012 @ 1684  ;
at: 'Tiklek' put:   3283 @ 1889  ;
at: 'Timbedrif' put:   3079 @ 2340  ;
at: 'Tinsouf' put:   2087 @ 2394  ;
at: 'Tireste' put:   883 @ 2534  ;
at: 'Tobol' put:   3446 @ 1537  ;
at: 'Tomad' put:   3493 @ 3175  ;
at: 'Tommot' put:   3538 @ 2024  ;
at: 'Tonega' put:   3058 @ 1812  ;
at: 'Toothmark' put:   2501 @ 701  ;
at: 'Topek' put:   3835 @ 1926  ;
at: 'Torain' put:   783 @ 2003  ;
at: 'Torien''s Watch' put:   1018 @ 1984  ;
at: 'Torinaur' put:   1972 @ 1942  ;
at: 'Torne' put:   1023 @ 829  ;
at: 'Tornilen' put:   1062 @ 2450  ;
at: 'Tory' put:   1944 @ 2423  ;
at: 'Toure el-Fasil' put:   3761 @ 2434  ;
at: 'Tradebhein' put:   902 @ 1711  ;
at: 'Traiward' put:   841 @ 2402  ;
at: 'Trestahlen' put:   2590 @ 1877  ;
at: 'Treuchlyn' put:   2329 @ 2157  ;
at: 'Treumar' put:   2387 @ 2015  ;
at: 'Treustap' put:   2485 @ 2056  ;
at: 'Trondelaag' put:   1235 @ 1308  ;
at: 'Tsing' put:   2996 @ 2052  ;
at: 'Tsongya Vale' put:   {3129 @ 2139 . 3164 @ 2147}  ;
at: 'Tsupek' put:   4253 @ 1540  ;
at: 'Tuar Llyrien' put:   1503 @ 1960  ;
at: 'Tuared' put:   2466 @ 2877  ;
at: 'Tuarime' put:   3743 @ 2710  ;
at: 'Tuor''s Hold' put:   733 @ 2496  ;
at: 'Turin' put:   2377 @ 2957  ;
at: 'Two Giant''s Tread' put:   1839 @ 1363  ;
at: 'Twopeak' put:   3077 @ 865  ;
at: 'Tyrtep' put:   2837 @ 1082  ;
at: 'Tzubinstak' put:   3982 @ 1093  ;
at: 'Ubalmulen' put:   { 2587 @ 2031 . 2547 @ 1969}  ;
at: 'Udvika' put:   891 @ 1327  ;
at: 'Uelzau' put:   2402 @ 1300  ;
at: 'Ufhevsk' put:   3594 @ 1487  ;
at: 'Ulbrun' put:   1976 @ 1332  ;
at: 'Ulfsted' put:   {3061 @ 1659 . 3080 @ 1686}  ;
at: 'Unbraustadt' put:   2680 @ 2294  ;
at: 'Uptlund' put:   2774 @ 2263  ;
at: 'Urgtau' put:   3598 @ 1559  ;
at: 'Urik-Na' put:   1738 @ 1101  ;
at: 'Urtha' put:   1653 @ 669  ;
at: 'Urysk' put:   3868 @ 1994  ;
at: 'Ust Atka' put:   3591 @ 1708  ;
at: 'Ustkjuvil' put:   683 @ 1473  ;
at: 'Ustuheim' put:   3055 @ 1153  ;
at: 'Vaaltrand' put:   2158 @ 611  ;
at: 'Valkheim' put:   808 @ 914  ;
at: 'Valkith' put:   784 @ 1117  ;
at: 'Van Garreg' put:   3638 @ 2085  ;
at: 'Vanilen' put:   529 @ 2491  ;
at: 'Vejle' put:   1258 @ 965  ;
at: 'Velesk' put:   3914 @ 1429  ;
at: 'Virskaap' put:   2112 @ 706  ;
at: 'Vjelthelma' put:   1463 @ 1385  ;
at: 'Voldar' put:   1728 @ 1258  ;
at: 'Vrallik' put:   877 @ 1151  ;
at: 'Vulzin' put:   1673 @ 1046  ;
at: 'Vychek' put:   3977 @ 1964  ;
at: 'Vyslav' put:   3913 @ 2027  ;
at: 'Wahlrud' put:   2853 @ 2240  ;
at: 'Warzlau' put:   2497 @ 1181  ;
at: 'Wasser''s Reach' put:   1924 @ 1256  ;
at: 'Waterfjord' put:   {1988 @ 2560 . 2002 @ 2537 . 2003 @ 2524} ;
at: 'Werthangen' put:   1949 @ 2191  ;
at: 'Wesbralen' put:   2533 @ 1860  ;
at: 'West Direwood' put:   3266 @ 2740  ;
at: 'West Ibnoume' put:   3652 @ 2469  ;
at: 'Westmarch' put:   1215@2919  ;
at: 'Westport' put:   1958 @ 2488  ;
at: 'Westriet' put:   2755 @ 1003  ;
at: 'Westwatch' put:   2497 @ 791  ;
at: 'Westwold' put:   2472 @ 2319  ;
at: 'Wiergau' put:   1944 @ 1067  ;
at: 'Wiestod' put:   2885 @ 2125  ;
at: 'Wilder''s Gorge' put:   460 @ 2347  ;
at: 'Winoene' put:   1001 @ 2083  ;
at: 'Winter''s Deep' put:   585 @ 1784  ;
at: 'Woderoch' put:   3190 @ 731  ;
at: 'Woettap' put:   2725 @ 1068  ;
at: 'Wohlers' put:   2791 @ 2165  ;
at: 'Wormflyd' put:   3444 @ 1696  ;
at: 'Wrexwyn' put:   3454 @ 1946  ;
at: 'Wyndil' put:   2226 @ 2195  ;
at: 'Yanskia' put:   3643 @ 1756  ;
at: 'Yulesprech' put:   2607 @ 692  ;
at: 'Yvarre' put:   511 @ 1347  ;
at: 'Ywrndor' put:   1469 @ 2145  ;
at: 'Zakkhur' put:   843 @ 1026  ;
at: 'Zaliv' put:   3598 @ 1972  ;
at: 'Zaptig' put:   1595 @ 1440  ;
at: 'Zaruul' put:   1843 @ 1080  ;
at: 'Zedforst' put:   2836 @ 2168  ;
at: 'Zegrabin' put:   3346 @ 1824  ;
at: 'Zeph-Na' put:   1774 @ 649  ;
at: 'Zhigun' put:   3019 @ 1257  ;
at: 'Zhylenkal' put:   2650 @ 1007  ;
at: 'Ziass' put:   3366 @ 1541  ;
at: 'Ziguin' put:   2705 @ 2414  ;
at: 'Zikala' put:   2509 @ 3050  ;
at: 'Zilber' put:   1925 @ 1437  ;
at: 'Zulaf' put:   3814 @ 2636  ;
at: 'Zuluk' put:   3096 @ 1767  ;
at: 'Zurtrode' put:   3049 @ 710  ;
at: 'Zweilund' put:   2475 @ 1263  ;
at: 'Zwesserlund' put:   2956 @ 428  ;
at: 'Zzurk' put:   3350 @ 1917  ;
at: 'Zzyk' put:   3917 @ 1188  ;
at: 'el-Assire' put:   4274 @ 3028  ;
at: 'el-Besr' put:   3132 @ 2544  ;
at: 'el-Denebi' put:   3640 @ 3060  ;
at: 'el-Deyir' put:   3480 @ 2569  ;
at: 'el-Faril' put:   2430 @ 2987  ;
at: 'el-Feyin' put:   3608 @ 2905  ;
at: 'el-Kesir' put:   3125 @ 2378  ;
at: 'el-Qadr' put:   3259 @ 2658  ;
at: 'el-Saroume' put:   3983 @ 2621  ;
at: 'el-Sefra' put:   3045 @ 2443  ;
at: 'el-Sirte' put:   3696 @ 2648  ;
at: 'el-Tasri' put:   {2250 @ 2784 . 2205 @ 2799}  ;
at: 'el-Tehara' put:   2525 @ 2938  .
^dict
]

{ #category : #accessing }
GeoBRCerilia >> script [

	provinceAreas := self provinceAreas.
	
	"self islandAreas do: [ :islandArea | world repository save: islandArea ]."
	self woodAreas do: [ :woodArea | world repository save: woodArea ].
	self mountainAreas do: [ :mountainArea | world repository save: mountainArea ].
	self borders do: [ :border | world repository save: border ].
	
	xmlProvinces := GeoBRXMLConverter new parse provinces.
	xmlLegends := GeoBRXMLConverter new parse legends.
	
	csvProvinces := GeoBRCSVConverter new convertedProvinces.
	csvProvinceDatas := GeoBRCSVConverter new convertedProvinceDatas.
	csvCharacters := GeoBRCSVConverter new convertedCharacters.
	csvDomains := GeoBRCSVConverter new convertedDomains.
	
	self privateScript.
	self addToWorld.
	
	self coupleProvinceToArea.
	
	provinceAreas do: [ :provinceArea | world repository save: provinceArea ].
]

{ #category : #accessing }
GeoBRCerilia >> setTerrain: terrainString in: aProvince [

	| terrain potential modifier |
	potential := aProvince terrain potential.

	terrain := (GeoBRTerrain allSubclasses detect: [ :cls | 
		            cls terrainName = terrainString ]) new.

	modifier := terrain potential - potential.
	modifier ~= 0 ifTrue: [ terrain modifier: modifier ].
	aProvince terrain: terrain
]

{ #category : #accessing }
GeoBRCerilia >> takeAction: anAction [

	| action |
	action := world takeAction: anAction.
	^ action id
]

{ #category : #accessing }
GeoBRCerilia >> terrainForProvince: aProvince [

	| potential |
	potential := aProvince level + aProvince magic.
	potential = 15 ifTrue: [ ^ GeoBRAncientForest new modifier: 6 ].
	potential = 14 ifTrue: [ ^ GeoBRAncientForest new modifier: 5 ].
	potential = 13 ifTrue: [ ^ GeoBRAncientForest new modifier: 4 ].
	potential = 12 ifTrue: [ ^ GeoBRAncientForest new modifier: 3 ].
	potential = 11 ifTrue: [ ^ GeoBRAncientForest new modifier: 2 ].
	potential = 10 ifTrue: [ ^ GeoBRAncientForest new modifier: 1 ].
	potential = 9 ifTrue: [ ^ GeoBRHighMountains new ].
	potential = 7 ifTrue: [ ^ GeoBRLightForest new ].
	potential = 6 ifTrue: [ ^ GeoBRPlains new modifier: 1 ].
	potential = 5 ifTrue: [ ^ GeoBRPlains new ].
	potential = 4 ifTrue: [ ^ GeoBRPlains new modifier: -1 ].
	potential = 3 ifTrue: [ ^ GeoBRPlains new modifier: -2 ].
	potential = 1 ifTrue: [ ^ GeoBRDesert new modifier: -4 ].
	potential = 0 ifTrue: [ ^ GeoBRDesert new modifier: -5 ].
	potential = 8 ifTrue: [ ^ GeoBRSwamp new ].

]
