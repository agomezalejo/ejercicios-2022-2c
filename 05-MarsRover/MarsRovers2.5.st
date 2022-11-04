!classDefinition: #MarsRoversTest category: 'MarsRovers2.5'!
TestCase subclass: #MarsRoversTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRovers2.5'!

!MarsRoversTest methodsFor: 'testing' stamp: 'TA 11/2/2022 21:02:04'!
test01ElMarsRoversRecibeUnaCadenaVaciaYNoSeMueve

	| marsRovers |
	
	marsRovers := MarsRovers new.
	
	marsRovers comando: ''.
	
	"Punto inicial x= 0 y y=0"
	
	self assert: (marsRovers tienePosicion: 0@0 ).
	self assert: (marsRovers tieneDireccion: Norte)! !

!MarsRoversTest methodsFor: 'testing' stamp: 'A 11/4/2022 11:15:36'!
test02ElMarsRoversRecibeUnComandoParaRotarALaIzquierda

	 | marsRovers |
	
	marsRovers := MarsRovers new.
	
	marsRovers comando: 'L'.
	
	self assert: (marsRovers tienePosicion: 0@0 ).
	self assert: ( marsRovers tieneDireccion: Oeste)! !

!MarsRoversTest methodsFor: 'testing' stamp: 'A 11/4/2022 11:16:24'!
test03ElMarsRoverRecibeUnComandoParaRotarALaDerecha

	 | marsRovers |
	
	marsRovers := MarsRovers new.
	
	marsRovers comando: 'R'.
	
	self assert: (marsRovers tienePosicion: 0@0 ).
	self assert: ( marsRovers tieneDireccion: Este)! !

!MarsRoversTest methodsFor: 'testing' stamp: 'A 11/4/2022 11:17:02'!
test04ElMarsRoversRecibeUnComandoParaAvanzar

	 | marsRovers |
	
	marsRovers := MarsRovers new.
	
	marsRovers comando: 'F'.
	
	self assert: (marsRovers tienePosicion: 0@1 ).
	self assert: ( marsRovers tieneDireccion: Norte)! !

!MarsRoversTest methodsFor: 'testing' stamp: 'A 11/4/2022 11:18:10'!
test05ElMarsRoverRecibeUnComandoParaRetroceder

	 | marsRovers |
	
	marsRovers := MarsRovers new.
	
	marsRovers comando: 'B'.
	
	self assert: (marsRovers tienePosicion: 0@-1 ).
	self assert: ( marsRovers tieneDireccion: Norte)! !

!MarsRoversTest methodsFor: 'testing' stamp: 'A 11/4/2022 11:18:55'!
test06ElMarsRoversRotaDosVecesALaIzquierda

	 | marsRovers |
	
	marsRovers := MarsRovers new.
	
	marsRovers comando: 'LL'.
	
	self assert: (marsRovers tienePosicion: 0@0 ).
	self assert: ( marsRovers tieneDireccion: Sur)! !

!MarsRoversTest methodsFor: 'testing' stamp: 'A 11/4/2022 11:19:28'!
test07ElMarsRoversRotaDosVecesALaDerecha

	 | marsRovers |
	
	marsRovers := MarsRovers new.
	
	marsRovers comando: 'RR'.
	
	self assert: (marsRovers tienePosicion: 0@0 ).
	self assert: ( marsRovers tieneDireccion: Sur)! !

!MarsRoversTest methodsFor: 'testing' stamp: 'A 11/4/2022 11:19:56'!
test08ElMarsRoversRotaALaDerechaYAvanza

	 | marsRovers |
	
	marsRovers := MarsRovers new.
	
	marsRovers comando: 'RF'.
	
	self assert: (marsRovers tienePosicion: 1@0 ).
	self assert: ( marsRovers tieneDireccion: Este)! !

!MarsRoversTest methodsFor: 'testing' stamp: 'A 11/4/2022 11:20:25'!
test09ElMarsRoversRotaALaDerechaYRetrocede

	 | marsRovers |
	
	marsRovers := MarsRovers new.
	
	marsRovers comando: 'RB'.
	
	self assert: (marsRovers tienePosicion: -1@0 ).
	self assert: ( marsRovers tieneDireccion: Este)! !

!MarsRoversTest methodsFor: 'testing' stamp: 'A 11/4/2022 11:21:01'!
test10ElMarsRoversRotaALaDerechaYAvanzaDosVeces

	 | marsRovers |
	
	marsRovers := MarsRovers new.
	
	marsRovers comando: 'RFF'.
	
	self assert: (marsRovers tienePosicion: 2@0 ).
	self assert: ( marsRovers tieneDireccion: Este)! !

!MarsRoversTest methodsFor: 'testing' stamp: 'A 11/4/2022 11:21:33'!
test11ElMarsRoversRotaDosVecesALaDerechaYRetrocede

	 | marsRovers |
	
	marsRovers := MarsRovers new.
	
	marsRovers comando: 'RRB'.
	
	self assert: (marsRovers tienePosicion: 0@1 ).
	self assert: ( marsRovers tieneDireccion: Sur)! !

!MarsRoversTest methodsFor: 'testing' stamp: 'A 11/4/2022 11:22:42'!
test12ElMarsRoversRecibeUnComandoInvalidoYSeProduceUnError

	 | marsRovers |
	
	marsRovers := MarsRovers new.
	
	self 
	should: [marsRovers comando: 'a' ]
	raise: Error
	withExceptionDo: [ :anError | self assert: MarsRovers caracterInvalido equals: anError messageText ]! !

!MarsRoversTest methodsFor: 'testing' stamp: 'A 11/4/2022 11:25:03'!
test13ElMarsRoversRealizaComandosValidosYLuegoSeProduceErrorPorComandoInvalido

	 | marsRovers |
	
	marsRovers := MarsRovers new.
	
	self 
	should: [marsRovers comando: 'LLFFRFZBBB' ]
	raise: Error
	withExceptionDo: [ :anError | self assert: MarsRovers caracterInvalido equals: anError messageText ].
	
	self assert: (marsRovers tienePosicion: -1@-2).
	self assert: (marsRovers tieneDireccion: Oeste)! !


!classDefinition: #GPS category: 'MarsRovers2.5'!
Object subclass: #GPS
	instanceVariableNames: 'puntoActual'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRovers2.5'!

!GPS methodsFor: 'initialization' stamp: 'TA 11/3/2022 20:54:23'!
initializeConPuntoActual: unPunto

	puntoActual := unPunto.! !


!GPS methodsFor: 'private' stamp: 'TA 11/3/2022 20:46:48'!
getPuntoActual

	^ puntoActual ! !


!GPS methodsFor: 'moverse' stamp: 'TA 11/2/2022 20:56:21'!
backwards
	self subclassResponsibility ! !

!GPS methodsFor: 'moverse' stamp: 'TA 11/2/2022 20:53:21'!
foward
	
	self subclassResponsibility ! !

!GPS methodsFor: 'moverse' stamp: 'TA 11/2/2022 20:35:46'!
rotateLeft

	self subclassResponsibility ! !

!GPS methodsFor: 'moverse' stamp: 'TA 11/2/2022 20:35:50'!
rotateRight

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'GPS class' category: 'MarsRovers2.5'!
GPS class
	instanceVariableNames: ''!

!GPS class methodsFor: 'instance creation' stamp: 'TA 11/3/2022 20:58:44'!
conPunto: unPunto

	^ self new initializeConPuntoActual: unPunto.! !


!classDefinition: #Este category: 'MarsRovers2.5'!
GPS subclass: #Este
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRovers2.5'!

!Este methodsFor: 'moverse' stamp: 'TA 11/3/2022 20:44:03'!
backwards

	puntoActual := puntoActual + (-1@0).! !

!Este methodsFor: 'moverse' stamp: 'TA 11/3/2022 20:44:08'!
foward

	puntoActual := puntoActual +(1@0)! !

!Este methodsFor: 'moverse' stamp: 'TA 11/3/2022 20:55:14'!
rotateLeft

	^ Norte conPunto: puntoActual.! !

!Este methodsFor: 'moverse' stamp: 'TA 11/3/2022 20:57:37'!
rotateRight

	^ Sur conPunto: puntoActual .! !


!classDefinition: #Norte category: 'MarsRovers2.5'!
GPS subclass: #Norte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRovers2.5'!

!Norte methodsFor: 'moverse' stamp: 'TA 11/3/2022 20:44:34'!
backwards

	puntoActual := puntoActual + (0@-1).! !

!Norte methodsFor: 'moverse' stamp: 'TA 11/3/2022 20:45:34'!
foward

	puntoActual := puntoActual + (0@1).! !

!Norte methodsFor: 'moverse' stamp: 'TA 11/3/2022 20:56:09'!
rotateLeft

	^ Oeste conPunto: puntoActual.! !

!Norte methodsFor: 'moverse' stamp: 'TA 11/3/2022 20:57:46'!
rotateRight 

	^ Este conPunto: puntoActual .! !


!classDefinition: #Oeste category: 'MarsRovers2.5'!
GPS subclass: #Oeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRovers2.5'!

!Oeste methodsFor: 'moverse' stamp: 'TA 11/3/2022 20:44:43'!
backwards

	puntoActual := puntoActual +(1@0).! !

!Oeste methodsFor: 'moverse' stamp: 'TA 11/3/2022 20:45:43'!
foward

	puntoActual := puntoActual + (-1@0).! !

!Oeste methodsFor: 'moverse' stamp: 'TA 11/3/2022 20:56:18'!
rotateLeft

	^ Sur conPunto: puntoActual.! !

!Oeste methodsFor: 'moverse' stamp: 'TA 11/3/2022 20:57:57'!
rotateRight

	^ Norte conPunto: puntoActual .! !


!classDefinition: #Sur category: 'MarsRovers2.5'!
GPS subclass: #Sur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRovers2.5'!

!Sur methodsFor: 'moverse' stamp: 'TA 11/3/2022 20:45:04'!
backwards

	puntoActual := puntoActual + (0@1).! !

!Sur methodsFor: 'moverse' stamp: 'TA 11/3/2022 20:45:53'!
foward

	puntoActual := puntoActual + (0@-1).! !

!Sur methodsFor: 'moverse' stamp: 'TA 11/3/2022 20:56:27'!
rotateLeft

	^Este conPunto: puntoActual .! !

!Sur methodsFor: 'moverse' stamp: 'TA 11/3/2022 20:58:04'!
rotateRight

	^Oeste conPunto: puntoActual .! !


!classDefinition: #MarsRovers category: 'MarsRovers2.5'!
Object subclass: #MarsRovers
	instanceVariableNames: 'gps listaDeComandos'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRovers2.5'!

!MarsRovers methodsFor: 'moverse - private' stamp: 'TA 11/3/2022 20:47:37'!
backwards

	gps backwards.! !

!MarsRovers methodsFor: 'moverse - private' stamp: 'TA 11/3/2022 20:47:54'!
foward
	
	gps foward! !

!MarsRovers methodsFor: 'moverse - private' stamp: 'TA 11/3/2022 20:48:55'!
rotateLeft

	gps:= gps rotateLeft.! !

!MarsRovers methodsFor: 'moverse - private' stamp: 'TA 11/3/2022 20:49:01'!
rotateRight

	gps:= gps rotateRight! !


!MarsRovers methodsFor: 'moverse' stamp: 'TA 11/3/2022 20:30:18'!
comando: unaListaDeComandos
	unaListaDeComandos do: [:comando| | unaInstruccion unComando | 
		unaInstruccion := comando asSymbol.
		unComando := (listaDeComandos at: unaInstruccion ifAbsent: [Error signal: MarsRovers caracterInvalido ] ).
		unComando value.
	].! !


!MarsRovers methodsFor: 'initialization' stamp: 'TA 11/3/2022 21:01:27'!
initialize

	gps := Norte conPunto: 0@0.
	listaDeComandos := Dictionary new.
	listaDeComandos at: #L put: ( [self rotateLeft ] ).
	listaDeComandos at: #R put: ( [self rotateRight ] ).
	listaDeComandos at: #F put: ([self foward ]).
	listaDeComandos at: #B put: ([self backwards ]).! !


!MarsRovers methodsFor: 'testing' stamp: 'TA 11/3/2022 20:37:41'!
tieneDireccion: unDireccion
	^ gps isKindOf: unDireccion 
	! !

!MarsRovers methodsFor: 'testing' stamp: 'TA 11/3/2022 20:47:10'!
tienePosicion: unPunto  
	^(gps getPuntoActual) = unPunto ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRovers class' category: 'MarsRovers2.5'!
MarsRovers class
	instanceVariableNames: ''!

!MarsRovers class methodsFor: 'error' stamp: 'TA 11/2/2022 21:14:15'!
caracterInvalido

	^'Se encontro un caracter invalido en las instrucciones'! !
