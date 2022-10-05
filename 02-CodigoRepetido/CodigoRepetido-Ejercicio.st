!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'A 9/27/2022 12:27:29'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook addCustomer |
	
	customerBook := CustomerBook new.
	addCustomer :=  [customerBook addCustomerNamed: 'John Lennon'].
	
	self should: addCustomer notTakeMoreThan: 50 milliSeconds.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'A 9/27/2022 12:43:02'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney removeCustomer |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	
	removeCustomer := [customerBook removeCustomerNamed: paulMcCartney].
	
	self should: removeCustomer notTakeMoreThan: 100 milliSeconds.
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'A 9/27/2022 15:31:53'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook addEmptyName customerNotAdded description|
			
	customerBook := CustomerBook new.
	addEmptyName := [ customerBook addCustomerNamed: ''].
	customerNotAdded := [ :anError | self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
				self assert: customerBook isEmpty ].
	description := CustomerBook customerCanNotBeEmptyErrorMessage.
	 
	self should: addEmptyName raise: Error withExceptionDo: customerNotAdded description: description.
		
		! !

!CustomerBookTest methodsFor: 'testing' stamp: 'A 9/27/2022 16:01:54'!
test04CanNotRemoveAnInvalidCustomer
	"
	| customerBook johnLennon removeInvalidCustomer customerBookDidNotChange |
			
	johnLennon := 'John Lennon'.
	customerBook := self createCustomerBookWith: johnLennon .
	removeInvalidCustomer := [ customerBook removeCustomerNamed: 'Paul McCartney' .].
	customerBookDidNotChange := self is: johnLennon theOnlyCustomerInCustomerBook: customerBook.
	
	self should: removeInvalidCustomer raise: NotFound withExceptionDo: customerBookDidNotChange description: nil..
	"		
	| customerBook johnLennon removeInvalidCustomer customerBookDidNotChange|
			
	johnLennon := 'John Lennon'.
	customerBook := self createCustomerBookWith: johnLennon .
	removeInvalidCustomer := [customerBook removeCustomerNamed: 'Paul McCartney'].
	customerBookDidNotChange := self is: johnLennon theOnlyCustomerInCustomerBook: customerBook.
		
	self should: removeInvalidCustomer raise: NotFound withExceptionDo: [ :anError | customerBookDidNotChange ].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'A 9/27/2022 15:02:26'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self createCustomerBookWithSuspended: paulMcCartney.
	
	self assert: (self checkNumberActiveCustomers: 0 numberSupendedCustomers: 1 totalNumberOfCustomers: 1 in: customerBook ).
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'A 9/27/2022 15:02:31'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self createCustomerBookWithSuspended: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assert: (self checkNumberActiveCustomers: 0 numberSupendedCustomers: 0 totalNumberOfCustomers: 0 in: customerBook ).
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'A 9/27/2022 16:08:53'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon customerBookDidNotChange suspendAnInvalidCustomer |
	
	johnLennon := 'John Lennon'.
	customerBook := self createCustomerBookWith: johnLennon .
	suspendAnInvalidCustomer := [customerBook suspendCustomerNamed: 'Ringo Starr'].
	customerBookDidNotChange := self is: johnLennon theOnlyCustomerInCustomerBook: customerBook.
	
	self should: suspendAnInvalidCustomer raise: CantSuspend withExceptionDo: [ :anError | customerBookDidNotChange ].
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'A 9/27/2022 16:10:07'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon customerBookDidNotChange suspendCustomerSuspended|
			
	johnLennon := 'John Lennon'.
	customerBook := self createCustomerBookWithSuspended: johnLennon.
	customerBookDidNotChange := self is: johnLennon theOnlyCustomerInCustomerBook: customerBook.
	suspendCustomerSuspended := [ customerBook suspendCustomerNamed: johnLennon.].
	
	self should: suspendCustomerSuspended raise: CantSuspend withExceptionDo: [ :anError | customerBookDidNotChange].
	! !


!CustomerBookTest methodsFor: 'repeated' stamp: 'A 9/27/2022 14:53:19'!
assertNumberActiveCustomers: totalActiveCustomers numberSupendedCustomers: totalSupendedCustomers totalNumberOfCustomers: toltalCustomers  in: ACustomerBook
	^ (totalActiveCustomers = ACustomerBook numberOfActiveCustomers) 
	and: (totalSupendedCustomers = ACustomerBook numberOfSuspendedCustomers) 
	and: (toltalCustomers = ACustomerBook numberOfCustomers).! !

!CustomerBookTest methodsFor: 'repeated' stamp: 'A 9/27/2022 15:01:53'!
checkNumberActiveCustomers: totalActiveCustomers numberSupendedCustomers: totalSupendedCustomers totalNumberOfCustomers: toltalCustomers  in: ACustomerBook
	^ (totalActiveCustomers = ACustomerBook numberOfActiveCustomers) 
	and: (totalSupendedCustomers = ACustomerBook numberOfSuspendedCustomers) 
	and: (toltalCustomers = ACustomerBook numberOfCustomers).! !

!CustomerBookTest methodsFor: 'repeated' stamp: 'A 9/27/2022 14:26:23'!
createCustomerBookWith: aCustomer
	| customerBook |
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: aCustomer.
	^customerBook.! !

!CustomerBookTest methodsFor: 'repeated' stamp: 'A 9/27/2022 14:28:24'!
createCustomerBookWithSuspended: aCustomer
	| customerBook |
	
	customerBook := self createCustomerBookWith: aCustomer.
	customerBook suspendCustomerNamed: aCustomer.
	^customerBook.	 ! !

!CustomerBookTest methodsFor: 'repeated' stamp: 'A 9/27/2022 15:34:42'!
is: ACustomer theOnlyCustomerInCustomerBook: customerBook

	^[self assert: customerBook numberOfCustomers = 1.
	self assert: (customerBook includesCustomerNamed: ACustomer )].! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'MA 9/27/2022 21:28:25'!
isEmpty
	
	^self numberOfCustomers = 0! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'MA 9/27/2022 21:30:55'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'MA 9/27/2022 21:27:45'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'MA 9/27/2022 22:19:34'!
removeCustomerNamed: aName 
 	
	(self includesCustomerNamed: aName) ifFalse: [^ NotFound signal.].
	
	self removeCustomerNamed: aName from: active.
	self removeCustomerNamed: aName from: suspended.! !

!CustomerBook methodsFor: 'customer management' stamp: 'MA 9/27/2022 22:16:33'!
removeCustomerNamed: aName from: aCollection
 	(aCollection includes: aName) ifTrue: [aCollection remove: aName].
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
