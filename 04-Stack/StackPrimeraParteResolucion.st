!classDefinition: #StackTest category: 'StackPrimeraParte'!
TestCase subclass: #StackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!StackTest methodsFor: 'basic operations' stamp: 'A 10/9/2022 07:35:01'!
test02ElementCanBeAdded
	| stack elementToAdd addedElement |
	
	stack := Stack newEmpy.
	elementToAdd := #firstElement.
	
	addedElement := stack push: elementToAdd.
	
	self assert: (addedElement = elementToAdd)! !

!StackTest methodsFor: 'basic operations' stamp: 'A 10/9/2022 07:45:49'!
test03ElementCanBeRemoved
	| stack elementToAdd removedElement |
	
	stack := Stack newEmpy.
	elementToAdd := #firstElement.
	
	stack push: elementToAdd.
	
	removedElement := stack pop.
	
	self assert: (removedElement = elementToAdd).! !

!StackTest methodsFor: 'basic operations' stamp: 'A 10/9/2022 07:51:55'!
test04PopReturnsTheLastElement
	| stack removedElement elementToAdd |
	
	stack := Stack newEmpy.
	elementToAdd := #firstElement.
	
	stack push: elementToAdd.
	
	removedElement := stack pop.
	
	self assert: (removedElement = elementToAdd).! !


!StackTest methodsFor: 'status' stamp: 'A 10/9/2022 07:11:15'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := Stack newEmpy.
	
	self assert: stack isEmpty! !


!StackTest methodsFor: 'behavior' stamp: 'A 10/9/2022 07:51:07'!
test05LastInFirstOut
	| stack removedElement firstElementToAdd lastElementToAdd secondRemovedElement |
	
	stack := Stack newEmpy.
	firstElementToAdd := #firstElement.
	lastElementToAdd := #lastElement.
	
	stack push: firstElementToAdd.
	stack push: lastElementToAdd.
	
	removedElement := stack pop.
	secondRemovedElement := stack pop.
	
	self assert: (removedElement = lastElementToAdd).
	self assert: (secondRemovedElement = firstElementToAdd).! !

!StackTest methodsFor: 'behavior' stamp: 'A 10/9/2022 08:13:42'!
test06GetLastElementWithoutRemovingIt
	| stack removedElement firstElementToAdd lastElementToAdd elementTop |
	
	stack := Stack newEmpy.
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

!Stack methodsFor: 'basic operations' stamp: 'A 10/9/2022 07:30:37'!
push: Element 
	^elements addFirst: Element.
	! !


!Stack methodsFor: 'accessing' stamp: 'A 10/9/2022 07:25:21'!
isEmpty
	^elements isEmpty.! !

!Stack methodsFor: 'accessing' stamp: 'A 10/9/2022 08:12:51'!
lastElement
	^elements at: 1.! !


!Stack methodsFor: 'initialization' stamp: 'A 10/9/2022 08:15:27'!
initializeEmpy
	elements := OrderedCollection new.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Stack class' category: 'StackPrimeraParte'!
Stack class
	instanceVariableNames: ''!

!Stack class methodsFor: 'instance creation' stamp: 'A 10/9/2022 07:10:45'!
newEmpy
	^self new initializeEmpy! !
