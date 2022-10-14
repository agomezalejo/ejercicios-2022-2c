!classDefinition: #StackTest category: 'StackPrimeraParte'!
TestCase subclass: #StackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!StackTest methodsFor: 'basic operations' stamp: 'A 10/10/2022 14:50:43'!
test02ElementCanBeAdded
	| stack elementToAdd addedElement |
	
	stack := Stack new.
	elementToAdd := #firstElement.
	
	addedElement := stack push: elementToAdd.
	
	self assert: (addedElement = elementToAdd)! !

!StackTest methodsFor: 'basic operations' stamp: 'A 10/10/2022 14:50:47'!
test03ElementCanBeRemoved
	| stack elementToAdd removedElement |
	
	stack := Stack new.
	elementToAdd := #firstElement.
	
	stack push: elementToAdd.
	
	removedElement := stack pop.
	
	self assert: (removedElement = elementToAdd).! !

!StackTest methodsFor: 'basic operations' stamp: 'A 10/10/2022 14:50:50'!
test04PopReturnsTheLastElement
	| stack removedElement elementToAdd |
	
	stack := Stack new.
	elementToAdd := #firstElement.
	
	stack push: elementToAdd.
	
	removedElement := stack pop.
	
	self assert: (removedElement = elementToAdd).! !


!StackTest methodsFor: 'status' stamp: 'A 10/10/2022 14:50:35'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := Stack new.
	
	self assert: stack isEmpty! !


!StackTest methodsFor: 'behavior' stamp: 'A 10/10/2022 14:50:57'!
test05LastInFirstOut
	| stack removedElement firstElementToAdd lastElementToAdd secondRemovedElement |
	
	stack := Stack new.
	firstElementToAdd := #firstElement.
	lastElementToAdd := #lastElement.
	
	stack push: firstElementToAdd.
	stack push: lastElementToAdd.
	
	removedElement := stack pop.
	secondRemovedElement := stack pop.
	
	self assert: (removedElement = lastElementToAdd).
	self assert: (secondRemovedElement = firstElementToAdd).! !

!StackTest methodsFor: 'behavior' stamp: 'A 10/10/2022 14:51:02'!
test06GetLastElementWithoutRemovingIt
	| stack removedElement firstElementToAdd lastElementToAdd elementTop |
	
	stack := Stack new.
	firstElementToAdd := #firstElement.
	lastElementToAdd := #lastElement.
	
	stack push: firstElementToAdd.
	stack push: lastElementToAdd.
	
	elementTop := stack lastElement.
	self assert: (elementTop = lastElementToAdd).
	
	removedElement := stack pop.
	
	self assert: (lastElementToAdd = removedElement).! !


!classDefinition: #Stack category: 'StackPrimeraParte'!
Object subclass: #Stack
	instanceVariableNames: 'elements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!Stack methodsFor: 'basic operations' stamp: 'A 10/9/2022 07:40:52'!
pop
	^elements removeFirst.! !

!Stack methodsFor: 'basic operations' stamp: 'A 10/10/2022 14:56:30'!
push: element 
	^elements addFirst: element.
	! !


!Stack methodsFor: 'accessing' stamp: 'A 10/9/2022 07:25:21'!
isEmpty
	^elements isEmpty.! !

!Stack methodsFor: 'accessing' stamp: 'A 10/9/2022 08:12:51'!
lastElement
	^elements at: 1.! !


!Stack methodsFor: 'initialization' stamp: 'A 10/10/2022 14:49:59'!
initialize
	elements := OrderedCollection new.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Stack class' category: 'StackPrimeraParte'!
Stack class
	instanceVariableNames: ''!

!Stack class methodsFor: 'instance creation' stamp: 'A 10/10/2022 14:49:59'!
newEmpy
	^self new initialize! !
