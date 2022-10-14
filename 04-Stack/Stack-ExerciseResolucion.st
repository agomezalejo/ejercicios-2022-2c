!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: 'unlimitedStack limitedStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'testLimitedStack' stamp: 'A 10/14/2022 17:49:29'!
test01LimitedStackShouldBeEmptyWhenCreated
	self shouldBeEmpty: limitedStack.
! !

!OOStackTest methodsFor: 'testLimitedStack' stamp: 'A 10/13/2022 20:15:06'!
test02PushAddElementsToTheLimitedStack

	self pushAddElementsTo: limitedStack. ! !

!OOStackTest methodsFor: 'testLimitedStack' stamp: 'A 10/13/2022 20:15:29'!
test03PopRemovesElementsFromTheLimitedStack

	self popRemovesElementsFrom: limitedStack. ! !

!OOStackTest methodsFor: 'testLimitedStack' stamp: 'A 10/13/2022 20:16:37'!
test04PopReturnsLastPushedObjectInLimitedStack

	self popReturnsLastPushedObjectTo: limitedStack.! !

!OOStackTest methodsFor: 'testLimitedStack' stamp: 'A 10/13/2022 20:21:59'!
test05LimitedStackBehavesLIFO

	self stackBehavesLIFO: limitedStack. 
	! !

!OOStackTest methodsFor: 'testLimitedStack' stamp: 'A 10/13/2022 20:22:31'!
test06TopReturnsLastPushedObjectInLimitedStack

	self topReturnsLastPushedObjectTo: limitedStack. ! !

!OOStackTest methodsFor: 'testLimitedStack' stamp: 'A 10/13/2022 20:22:57'!
test07TopDoesNotRemoveObjectFromLimitedStack

	self topDoesNotRemoveObjectFrom: limitedStack. ! !

!OOStackTest methodsFor: 'testLimitedStack' stamp: 'A 10/13/2022 20:23:28'!
test08CanNotPopWhenThereAreNoObjectsInTheLimitedStack
	
	self canNotPopWhenThereAreNoObjectsIn: limitedStack. 
		! !

!OOStackTest methodsFor: 'testLimitedStack' stamp: 'A 10/14/2022 18:13:19'!
test09CanNotPopWhenThereAreNoObjectsInTheLimitedStackAfterEmptying
	
	self canNotPopWhenThereAreNoObjectsAfterEmptying: limitedStack.! !

!OOStackTest methodsFor: 'testLimitedStack' stamp: 'A 10/13/2022 20:25:03'!
test10CanNotTopWhenThereAreNoObjectsInTheLimitedStack

	self canNotTopWhenThereAreNoObjectsIn: limitedStack.! !

!OOStackTest methodsFor: 'testLimitedStack' stamp: 'A 10/14/2022 18:13:43'!
test11CanNotTopWhenThereAreNoObjectsInTheLimitedStackAfterEmptying
	
	self canNotTopWhenThereAreNoObjectsAfterEmptying: limitedStack.! !

!OOStackTest methodsFor: 'testLimitedStack' stamp: 'A 10/14/2022 18:10:10'!
test12CannotGoPastTheMaximumNumberOfItemsInTheLimitedStack

	limitedStack push: 'first'.
	limitedStack push: 'second'.
	limitedStack push: 'third'.

	self
		should: [ limitedStack push: 'fourth' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackFullErrorDescription equals: anError messageText ]
	
	! !

!OOStackTest methodsFor: 'testLimitedStack' stamp: 'A 10/14/2022 18:26:17'!
test13AfterFullStackCanBeEmptiedAndReused
	"In this test, a stack is first filled and emptied. Then all tested functionality is retested for a newly created stack"
	self fillLimitedStack. 
	self emptyLimitedStack. 

	self shouldBeEmpty: limitedStack.
	self pushAddElementsTo: limitedStack. 
	
	limitedStack pop.
	
	self popRemovesElementsFrom: limitedStack.
	self popReturnsLastPushedObjectTo: limitedStack.
	self stackBehavesLIFO: limitedStack. 
	self topReturnsLastPushedObjectTo: limitedStack. 
	
	limitedStack pop.
	
	self topDoesNotRemoveObjectFrom: limitedStack. 
	
	limitedStack pop.
	
	self canNotPopWhenThereAreNoObjectsIn: limitedStack. 
	self canNotTopWhenThereAreNoObjectsIn: limitedStack.
	self canNotPopWhenThereAreNoObjectsAfterEmptying: limitedStack.! !


!OOStackTest methodsFor: 'setUp' stamp: 'A 10/13/2022 19:47:22'!
setUp
	
	unlimitedStack := 	OOUnlimitedStack new.
	limitedStack  := OOLimitedStack withMaxCapacity: 3.! !


!OOStackTest methodsFor: 'testUnlimitedStack' stamp: 'A 10/14/2022 17:49:29'!
test01UnlimitedStackShouldBeEmptyWhenCreated
	self shouldBeEmpty: unlimitedStack .
! !

!OOStackTest methodsFor: 'testUnlimitedStack' stamp: 'A 10/13/2022 20:11:56'!
test02PushAddElementsToTheUnlimitedStack

	self pushAddElementsTo: unlimitedStack. ! !

!OOStackTest methodsFor: 'testUnlimitedStack' stamp: 'A 10/13/2022 20:12:06'!
test03PopRemovesElementsFromTheUnlimitedStack

	self popRemovesElementsFrom: unlimitedStack. ! !

!OOStackTest methodsFor: 'testUnlimitedStack' stamp: 'A 10/13/2022 20:08:33'!
test04PopReturnsLastPushedObject

	self popReturnsLastPushedObjectTo: unlimitedStack.! !

!OOStackTest methodsFor: 'testUnlimitedStack' stamp: 'A 10/13/2022 20:12:26'!
test05UnlimitedStackBehavesLIFO

	self stackBehavesLIFO: unlimitedStack. 
	! !

!OOStackTest methodsFor: 'testUnlimitedStack' stamp: 'A 10/13/2022 20:09:30'!
test06TopReturnsLastPushedObject

	self topReturnsLastPushedObjectTo: unlimitedStack. 
	! !

!OOStackTest methodsFor: 'testUnlimitedStack' stamp: 'A 10/13/2022 20:12:36'!
test07TopDoesNotRemoveObjectFromUnlimitedStack

	self topDoesNotRemoveObjectFrom: unlimitedStack. 
	! !

!OOStackTest methodsFor: 'testUnlimitedStack' stamp: 'A 10/13/2022 20:23:38'!
test08CanNotPopWhenThereAreNoObjectsInTheUnlimitedStack
	
	self canNotPopWhenThereAreNoObjectsIn: unlimitedStack. 
		! !

!OOStackTest methodsFor: 'testUnlimitedStack' stamp: 'A 10/13/2022 20:24:04'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheUnlimitedStackHadObjects
	
	self canNotPopWhenThereAreNoObjectsAfterEmptying: unlimitedStack.! !

!OOStackTest methodsFor: 'testUnlimitedStack' stamp: 'A 10/13/2022 20:13:02'!
test10CanNotTopWhenThereAreNoObjectsInTheUnlimitedStack

	self canNotTopWhenThereAreNoObjectsIn: unlimitedStack. 
		
! !

!OOStackTest methodsFor: 'testUnlimitedStack' stamp: 'A 10/14/2022 18:16:19'!
test11CanNotTopWhenThereAreNoObjectsInTheUnimitedStackAfterEmptying
	
	self canNotTopWhenThereAreNoObjectsAfterEmptying: unlimitedStack.
! !


!OOStackTest methodsFor: 'private' stamp: 'A 10/13/2022 20:05:21'!
canNotPopWhenThereAreNoObjectsAfterEmptying: aStack
	
	aStack push: 'something'.
	aStack pop.
	
	self
		should: [ aStack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'private' stamp: 'A 10/13/2022 20:02:03'!
canNotPopWhenThereAreNoObjectsIn: aStack
	
	self
		should: [ aStack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'private' stamp: 'A 10/14/2022 18:14:30'!
canNotTopWhenThereAreNoObjectsAfterEmptying: aStack
	
	aStack push: 'something'.
	aStack pop.
	
	self
		should: [ aStack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'private' stamp: 'A 10/13/2022 20:05:55'!
canNotTopWhenThereAreNoObjectsIn: aStack
	
	self
		should: [ aStack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'private' stamp: 'A 10/14/2022 18:22:31'!
emptyLimitedStack
	limitedStack pop.
	limitedStack pop.
	limitedStack pop.! !

!OOStackTest methodsFor: 'private' stamp: 'A 10/14/2022 18:22:12'!
fillLimitedStack
	limitedStack push: 'first'.
	limitedStack push: 'second'.
	limitedStack push: 'third'.! !

!OOStackTest methodsFor: 'private' stamp: 'A 10/13/2022 19:57:21'!
popRemovesElementsFrom: aStack

	aStack push: 'something'.
	
	aStack pop.
	
	self assert: aStack isEmpty! !

!OOStackTest methodsFor: 'private' stamp: 'A 10/13/2022 19:57:02'!
popReturnsLastPushedObjectTo: aStack

	| pushedObject |
	pushedObject := 'something'.
	
	aStack push: pushedObject.
	
	self assert: pushedObject equals: aStack pop! !

!OOStackTest methodsFor: 'private' stamp: 'A 10/13/2022 19:57:35'!
pushAddElementsTo: aStack

	aStack push: 'something'.
	
	self deny: aStack isEmpty! !

!OOStackTest methodsFor: 'private' stamp: 'A 10/14/2022 17:49:28'!
shouldBeEmpty: aStack

	self assert: aStack isEmpty! !

!OOStackTest methodsFor: 'private' stamp: 'A 10/13/2022 19:59:57'!
stackBehavesLIFO: aStack

	| firstPushedObject secondPushedObject |
	
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	aStack push: firstPushedObject.
	aStack push: secondPushedObject.
	
	self assert: secondPushedObject equals: aStack pop.
	self assert: firstPushedObject equals: aStack pop.
	self assert: aStack isEmpty 
	! !

!OOStackTest methodsFor: 'private' stamp: 'A 10/13/2022 20:01:38'!
topDoesNotRemoveObjectFrom: aStack

	| pushedObject |
	
	pushedObject := 'something'.
	
	aStack push: pushedObject.
	
	self assert: 1 equals: aStack size.
	aStack top.
	self assert: 1 equals: aStack size.
	! !

!OOStackTest methodsFor: 'private' stamp: 'A 10/13/2022 20:00:34'!
topReturnsLastPushedObjectTo: aStack

	| pushedObject |

	pushedObject := 'something'.
	
	aStack push: pushedObject.
	
	self assert: pushedObject equals: aStack top.
	! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'unlimitedStackEmpty sentenceFinderByPrefixWithStackEmpty unlimitedStackWithExamplesSentences sentenceFinderByPrefixWithExamplesSentences sentence1 sentence2 sentence3 sentence4'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'setUp' stamp: 'A 10/14/2022 15:00:58'!
setUp
	sentence1 := 'winter is coming'.
	sentence2 := 'winning is everything'.
	sentence3 := 'Winter is here'.
	sentence4 := 'The winds of Winter'.

	unlimitedStackEmpty :=  OOUnlimitedStack new.
	sentenceFinderByPrefixWithStackEmpty := SentenceFinderByPrefix new.
	sentenceFinderByPrefixWithStackEmpty assignStack: unlimitedStackEmpty.
	
	unlimitedStackWithExamplesSentences :=  OOUnlimitedStack new.
	unlimitedStackWithExamplesSentences push: sentence1.
	unlimitedStackWithExamplesSentences push: sentence2.
	unlimitedStackWithExamplesSentences push: sentence3.
	unlimitedStackWithExamplesSentences push: sentence4.
	
	sentenceFinderByPrefixWithExamplesSentences := SentenceFinderByPrefix new.
	sentenceFinderByPrefixWithExamplesSentences assignStack: unlimitedStackWithExamplesSentences.! !


!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'A 10/14/2022 14:55:26'!
test01InAnEmptyStackThereAreNoMatches
	| dev |
	
	dev := sentenceFinderByPrefixWithStackEmpty find: 'nomatch'.
	
	self assert: (dev size = 0).
! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'A 10/14/2022 14:55:39'!
test02IfThereAreNoMatchesNothingsIsReturned
	| dev |
	
	dev := sentenceFinderByPrefixWithExamplesSentences find: 'nomatch'.
	
	self assert: (dev size = 0).
! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'A 10/14/2022 14:56:02'!
test03IfThereAreMatchesTheyAreReturned
	| dev |
	
	dev := sentenceFinderByPrefixWithExamplesSentences find: 'Wint'.
	
	self assert: (dev size = 1 & dev includes: 'Winter is here').
! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'A 10/14/2022 15:20:58'!
test04TheStackAtTheEndOfTheOperationWasNotModified
	
	sentenceFinderByPrefixWithExamplesSentences find: 'Wint'.
	
	self assert: (unlimitedStackWithExamplesSentences size = 4).
	self assert: (unlimitedStackWithExamplesSentences pop = sentence4).
	self assert: (unlimitedStackWithExamplesSentences pop = sentence3).
	self assert: (unlimitedStackWithExamplesSentences pop = sentence2 ).
	self assert: (unlimitedStackWithExamplesSentences pop = sentence1 ).! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'A 10/14/2022 15:15:29'!
test05ThePrefixCannotBeEmpty
	
	self
		should: [ sentenceFinderByPrefixWithExamplesSentences find: ''. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: SentenceFinderByPrefix emptyPrefixErrorDescription equals: anError messageText ]! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'A 10/14/2022 15:17:17'!
test06ThePrefixCouldNotIncludeSpaces
	
	self
		should: [ sentenceFinderByPrefixWithExamplesSentences find: 'The w'. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: SentenceFinderByPrefix prefixIncludesSpacesErrorDescription equals: anError messageText ]! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'top size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'accessing' stamp: 'A 10/12/2022 00:10:13'!
isEmpty
	^size = 0. ! !

!OOStack methodsFor: 'accessing' stamp: 'A 10/12/2022 00:07:33'!
size
	^size.! !

!OOStack methodsFor: 'accessing' stamp: 'A 10/12/2022 02:19:33'!
top
	^top getTopElementOf: self.! !


!OOStack methodsFor: 'basic operations' stamp: 'A 10/13/2022 21:36:12'!
pop
	| aux |
	aux := top getTopElementOf: self.
	top setElement: nil in: self.
	top := top next.
	size := size - 1.
	^aux.! !

!OOStack methodsFor: 'basic operations' stamp: 'A 10/13/2022 18:38:42'!
push: element
	self subclassResponsibility. 
	! !


!OOStack methodsFor: 'private' stamp: 'A 10/10/2022 15:19:36'!
throwErrorStackEmptyError
	self error: self class stackEmptyErrorDescription.! !

!OOStack methodsFor: 'private' stamp: 'A 10/13/2022 20:35:49'!
throwErrorStackFullError
	self error: self class stackFullErrorDescription .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !

!OOStack class methodsFor: 'error descriptions' stamp: 'A 10/13/2022 18:26:21'!
stackFullErrorDescription
	
	^ 'Stack is full'! !


!classDefinition: #OOLimitedStack category: 'Stack-Exercise'!
OOStack subclass: #OOLimitedStack
	instanceVariableNames: 'base'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOLimitedStack methodsFor: 'basic operations' stamp: 'A 10/13/2022 21:27:13'!
push: element
	| aux |
	aux := top.
	top := aux previousElementIn: self. 
	top setElement: element in: self.
	size := size + 1. ! !


!OOLimitedStack methodsFor: 'initialization' stamp: 'A 10/13/2022 19:50:23'!
initializeStackWithMaxCapacity: aNumberMaxOfElements
	| aux maximumElement |
	base := Base new.
	aux := base.
	1 to: aNumberMaxOfElements do: [ :i |
			| elementEmpy | 
			elementEmpy := Element new.
			aux previous: elementEmpy.
			elementEmpy next: aux.
			aux := elementEmpy. 
	].
	maximumElement := MaximumElement new.
	aux previous: maximumElement.
	maximumElement next: aux.
	top := base.
	size := 0.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOLimitedStack class' category: 'Stack-Exercise'!
OOLimitedStack class
	instanceVariableNames: ''!

!OOLimitedStack class methodsFor: 'instance creation' stamp: 'A 10/13/2022 19:04:12'!
withMaxCapacity: aMaxCapacity
	^self new initializeStackWithMaxCapacity: aMaxCapacity. ! !


!classDefinition: #OOUnlimitedStack category: 'Stack-Exercise'!
OOStack subclass: #OOUnlimitedStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOUnlimitedStack methodsFor: 'basic operations' stamp: 'A 10/13/2022 18:35:53'!
push: element
	| aux |
	aux := top.
	top := (Element newWith: element) next: aux.
	size := size + 1. ! !


!OOUnlimitedStack methodsFor: 'initialization' stamp: 'A 10/13/2022 18:41:01'!
initialize
	top := Base new.
	size := 0.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'searches' stamp: 'A 10/14/2022 14:26:42'!
find: aPrefix
	| sentencesWithPrefix stackAux |
	self evaluatePrefix: aPrefix.
	stackAux := OOUnlimitedStack new.
	sentencesWithPrefix := self pushElementsFrom: stack to: stackAux andSelect: [:sentence | sentence beginsWith: aPrefix].
	self pushElementsFrom: stackAux to: stack.
	^sentencesWithPrefix. ! !


!SentenceFinderByPrefix methodsFor: 'assignments' stamp: 'A 10/13/2022 15:19:48'!
assignStack: aStack
	stack := aStack.! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'A 10/14/2022 15:22:44'!
evaluatePrefix: aPrefix
	(aPrefix includesSubString: ' ') ifTrue: [self throwPrefixIncludesSpacesError].
	(aPrefix = '') ifTrue: [self throwPrefixCannotBeEmptyError].! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'A 10/14/2022 14:25:44'!
pushElementsFrom: aStack to: otherStack
	[aStack isEmpty] whileFalse: [ | sentence |
			sentence := aStack pop.
			otherStack push: sentence.
 	].
! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'A 10/14/2022 14:21:03'!
pushElementsFrom: aStack to: otherStack andSelect: aBlock
	| sentencesWithPrefix |
	sentencesWithPrefix := OrderedCollection new.
	[aStack isEmpty] whileFalse: [ | sentence |
			sentence := aStack pop.
			(aBlock value: sentence) ifTrue: [ | copySentence |
				copySentence := sentence , ''.
				sentencesWithPrefix 	add: copySentence.
			].
			otherStack push: sentence.
 	].
	^sentencesWithPrefix. ! !


!SentenceFinderByPrefix methodsFor: 'errors' stamp: 'A 10/14/2022 15:22:44'!
throwPrefixCannotBeEmptyError
	self error: self class emptyPrefixErrorDescription ! !

!SentenceFinderByPrefix methodsFor: 'errors' stamp: 'A 10/14/2022 15:15:00'!
throwPrefixIncludesSpacesError
	self error: self class prefixIncludesSpacesErrorDescription ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'errors' stamp: 'A 10/14/2022 15:14:35'!
emptyPrefixErrorDescription
	^'An empty prefix was sent'! !

!SentenceFinderByPrefix class methodsFor: 'errors' stamp: 'A 10/14/2022 15:13:54'!
prefixIncludesSpacesErrorDescription
	^'The prefix cannot contain empty spaces.'! !


!classDefinition: #Top category: 'Stack-Exercise'!
Object subclass: #Top
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #Base category: 'Stack-Exercise'!
Top subclass: #Base
	instanceVariableNames: 'previous'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Base methodsFor: 'assignments' stamp: 'A 10/13/2022 19:17:45'!
previous: aElement
	previous := aElement.! !


!Base methodsFor: 'accessing' stamp: 'A 10/12/2022 02:17:23'!
getTopElementOf: aStack
	aStack throwErrorStackEmptyError.! !

!Base methodsFor: 'accessing' stamp: 'A 10/13/2022 19:23:04'!
previousElementIn: aStack
	^previous. ! !


!classDefinition: #Element category: 'Stack-Exercise'!
Top subclass: #Element
	instanceVariableNames: 'element next previous'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Element methodsFor: 'accessing' stamp: 'A 10/12/2022 02:18:29'!
getTopElementOf: aStack
	^element.! !

!Element methodsFor: 'accessing' stamp: 'A 10/12/2022 00:21:47'!
next
	^next
	! !

!Element methodsFor: 'accessing' stamp: 'A 10/13/2022 19:21:45'!
previousElementIn: aStack
	^previous! !


!Element methodsFor: 'assignaments' stamp: 'A 10/12/2022 00:33:34'!
initializeWith: anElement
	element := anElement.! !

!Element methodsFor: 'assignaments' stamp: 'A 10/12/2022 00:11:38'!
newWith: anElement
	element := anElement.! !

!Element methodsFor: 'assignaments' stamp: 'A 10/12/2022 00:21:38'!
next: anElement
	next := anElement.! !

!Element methodsFor: 'assignaments' stamp: 'A 10/13/2022 19:18:42'!
previous: aElement
	previous := aElement.! !

!Element methodsFor: 'assignaments' stamp: 'A 10/13/2022 21:28:10'!
setElement: anElement in: aStack
	element := anElement.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Element class' category: 'Stack-Exercise'!
Element class
	instanceVariableNames: ''!

!Element class methodsFor: 'as yet unclassified' stamp: 'A 10/12/2022 00:35:08'!
newWith: anElement
	^self new initializeWith: anElement.! !


!classDefinition: #MaximumElement category: 'Stack-Exercise'!
Top subclass: #MaximumElement
	instanceVariableNames: 'next'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!MaximumElement methodsFor: 'assignments' stamp: 'A 10/13/2022 19:28:03'!
next: anElement
	next := anElement.! !


!MaximumElement methodsFor: 'accessing' stamp: 'A 10/13/2022 19:20:30'!
previousElementIn: aStack
	aStack throwErrorStackFullError. ! !

!MaximumElement methodsFor: 'accessing' stamp: 'A 10/13/2022 21:28:34'!
setElement: anElement in: aStack
	aStack throwErrorStackFullError.! !
