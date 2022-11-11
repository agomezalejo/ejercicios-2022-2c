!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio 2.0'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio 2.0'!

!PortfolioTest methodsFor: 'testing' stamp: 'A 11/11/2022 17:09:14'!
test01TheBeginningBalanceOfAPortfolioIsZero
	
	| portfolio |
	
	portfolio := Portfolio new.
	
	self assert: 0 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'testing' stamp: 'A 11/11/2022 17:12:32'!
test02APortfolioRecordsTheBalanceOfAnAccountThatComprisesIt
	
	| portfolio account |
	
	portfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account.
	
	portfolio addAccount: account.
	
	self assert: 100 * peso equals: portfolio balance.! !

!PortfolioTest methodsFor: 'testing' stamp: 'A 11/11/2022 17:14:11'!
test03TheBalanceOfThePortfolioIsThatOfTheAccountsThatComposeIt
	
	| portfolio account1 account2 |
	
	portfolio := Portfolio new.
	
	account1 := ReceptiveAccount new.
	
	account2:= ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account1.
	
	Deposit register: 200 * peso on: account2.
	
	portfolio addAccount: account1.
	
	portfolio addAccount: account2.
	
	self assert: 300 * peso equals: portfolio balance.! !

!PortfolioTest methodsFor: 'testing' stamp: 'A 11/11/2022 17:17:07'!
test04APortfolioDoesNotRecordTheDepositOfAnAccountThatIsNotPartOfIt
	
	| portfolio  account aDeposit|
	
	account := ReceptiveAccount new.
	
	aDeposit := Deposit register: 100 * peso on: account.
	
	portfolio := Portfolio new.
	
	self deny: (portfolio hasRegistered: aDeposit).! !

!PortfolioTest methodsFor: 'testing' stamp: 'A 11/11/2022 17:18:11'!
test05APortfolioRecordsTheDepositOfAnAccountThatComposesIt
	
	| portfolio  account aDeposit|
	
	account := ReceptiveAccount new.
	
	aDeposit := Deposit register: 100 * peso on: account.
	
	portfolio := Portfolio new.
	
	portfolio addAccount: account .
	
	self assert: (portfolio hasRegistered: aDeposit).! !

!PortfolioTest methodsFor: 'testing' stamp: 'A 11/11/2022 17:19:44'!
test06PortfolioDoesNotRecordtransactions
	
	| portfolio |
	
	portfolio := Portfolio new.
	
	self assert: OrderedCollection new equals: portfolio transactions.! !

!PortfolioTest methodsFor: 'testing' stamp: 'A 11/11/2022 17:21:58'!
test07PortfolioReturnsTheTransactionsOfTheAccountsThatCompriseIt
	
	| portfolio account1 account2 transactionList|
	
	portfolio := Portfolio new.
	
	account1 := ReceptiveAccount new.
	
	account2:= ReceptiveAccount new.
	
	transactionList := OrderedCollection new.
	
	transactionList add: (Deposit register: 100 * peso on: account1).
	
	transactionList add: (Deposit register: 200 * peso on: account2).
	
	portfolio addAccount: account1.
	
	portfolio addAccount: account2.
	
	self assert: transactionList equals: portfolio transactions.! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio 2.0'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio 2.0'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'A 11/11/2022 17:04:25'!
test08ATransferDeductsTheBalanceOfTheOriginAccountAndIncreasesThatOfTheDestinationAccount

	| accountOrigin accountDestiny |
	
	accountOrigin := ReceptiveAccount new.
	accountDestiny := ReceptiveAccount new.
	Deposit register: 100 * peso on: accountOrigin.
	Transference register: 50 * peso from: accountOrigin to: accountDestiny.
		
	self assert: 50 * peso equals: accountOrigin balance.
	self assert: 50 * peso equals: accountDestiny balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'A 11/11/2022 17:06:23'!
test09ATransferRegistersItsValue

	| accountOrigin accountDestiny aTransference|
	
	accountOrigin := ReceptiveAccount new.
	accountDestiny := ReceptiveAccount new.
	Deposit register: 100 * peso on: accountOrigin.
	aTransference := Transference register: 50 * peso from: accountOrigin to: accountDestiny.
		
	self assert: 50* peso equals: aTransference value.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'A 11/11/2022 17:07:58'!
test10TheLegsOfTheTransferKnowTheirCounterpart

	| accountOrigin accountDestiny aTransference aWithdrawLeg aDepositLeg |
	
	accountOrigin := ReceptiveAccount new.
	accountDestiny := ReceptiveAccount new.
	Deposit register: 100 * peso on: accountOrigin.
	aTransference := Transference register: 50 * peso from: accountOrigin to: accountDestiny.
	aWithdrawLeg := aTransference withDrawLeg.
	aDepositLeg := aTransference depositLeg. 
	
	self assert:(aWithdrawLeg counterPart ) equals: (aDepositLeg).
	self assert:(aDepositLeg counterPart ) equals: (aWithdrawLeg).! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio 2.0'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio 2.0'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'TA 11/10/2022 18:44:04'!
valueForBalance: totalBalance

	self  subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio 2.0'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio 2.0'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio 2.0'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

!Deposit methodsFor: 'value' stamp: 'TA 11/10/2022 18:44:30'!
valueForBalance: totalBalance
	
	^ totalBalance + self value.! !


!Deposit methodsFor: 'accessing' stamp: 'A 11/11/2022 15:45:54'!
getCounterLegFrom: aTransfer
	^ aTransfer withDrawLeg.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio 2.0'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferenceTransaction category: 'ServiciosFinancieros-Ejercicio 2.0'!
AccountTransaction subclass: #TransferenceTransaction
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio 2.0'!

!TransferenceTransaction methodsFor: 'initialization' stamp: 'A 11/11/2022 16:32:20'!
initializeOf: aTransfer

	transfer := aTransfer.! !


!TransferenceTransaction methodsFor: 'accessing' stamp: 'A 11/11/2022 16:32:31'!
counterPart

	self subclassResponsibility.! !

!TransferenceTransaction methodsFor: 'accessing' stamp: 'A 11/11/2022 16:32:55'!
value

	^transfer value! !

!TransferenceTransaction methodsFor: 'accessing' stamp: 'A 11/11/2022 16:38:30'!
valueForBalance: aBalance

	^self subclassResponsibility. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferenceTransaction class' category: 'ServiciosFinancieros-Ejercicio 2.0'!
TransferenceTransaction class
	instanceVariableNames: ''!

!TransferenceTransaction class methodsFor: 'as yet unclassified' stamp: 'A 11/11/2022 16:31:25'!
of: aTransfer inAccount: anAccount
	| transferLeg |
	
	transferLeg := self new initializeOf: aTransfer.
	anAccount register: transferLeg.
		
	^transferLeg! !


!classDefinition: #TransferenceDepositLeg category: 'ServiciosFinancieros-Ejercicio 2.0'!
TransferenceTransaction subclass: #TransferenceDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio 2.0'!

!TransferenceDepositLeg methodsFor: 'accessing' stamp: 'A 11/11/2022 16:36:19'!
counterPart

	^transfer withDrawLeg. ! !

!TransferenceDepositLeg methodsFor: 'accessing' stamp: 'A 11/11/2022 16:38:01'!
valueForBalance: aBalance

	^aBalance + self value! !


!classDefinition: #TransferenceWithdrawLeg category: 'ServiciosFinancieros-Ejercicio 2.0'!
TransferenceTransaction subclass: #TransferenceWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio 2.0'!

!TransferenceWithdrawLeg methodsFor: 'accessing' stamp: 'A 11/11/2022 16:36:39'!
counterPart

	^transfer depositLeg. ! !

!TransferenceWithdrawLeg methodsFor: 'accessing' stamp: 'A 11/11/2022 16:38:13'!
valueForBalance: aBalance

	^aBalance - self value! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio 2.0'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio 2.0'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'TA 11/7/2022 17:03:25'!
value

	^ value! !

!Withdraw methodsFor: 'value' stamp: 'TA 11/10/2022 18:44:48'!
valueForBalance: totalBalance
	^totalBalance - self value.! !


!Withdraw methodsFor: 'accessing' stamp: 'A 11/11/2022 15:46:16'!
getCounterLegFrom: aTransfer
	^ aTransfer depositLeg.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio 2.0'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #BankAccount category: 'ServiciosFinancieros-Ejercicio 2.0'!
Object subclass: #BankAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio 2.0'!

!BankAccount methodsFor: 'main protocol' stamp: 'TA 11/8/2022 21:18:12'!
balance
	self subclassResponsibility ! !

!BankAccount methodsFor: 'main protocol' stamp: 'TA 11/8/2022 21:18:44'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!BankAccount methodsFor: 'main protocol' stamp: 'TA 11/8/2022 21:18:25'!
transactions
	
	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio 2.0'!
BankAccount subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio 2.0'!

!Portfolio methodsFor: 'value' stamp: 'TA 11/8/2022 20:40:16'!
balance
	^ accounts sum: [:aAccount | aAccount balance ] ifEmpty: [^0].! !


!Portfolio methodsFor: 'adding' stamp: 'TA 11/8/2022 20:39:09'!
addAccount: aReceptiveAccount 
	accounts add: aReceptiveAccount .! !


!Portfolio methodsFor: 'initialization' stamp: 'TA 11/8/2022 20:38:39'!
initialize

	accounts := OrderedCollection new.! !


!Portfolio methodsFor: 'verification' stamp: 'TA 11/8/2022 20:51:33'!
hasRegistered: aTransaction 
	accounts do: [:anAccount| (anAccount hasRegistered: aTransaction) ifTrue: [^true] ].
	^false! !


!Portfolio methodsFor: 'enumarating' stamp: 'TA 11/8/2022 21:04:17'!
transactions
	
	| transactionList |
	
	transactionList := OrderedCollection new.
	
	accounts do: [:anAccount | transactionList addAllLast: (anAccount transactions) ].
	
	^ transactionList ! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio 2.0'!
BankAccount subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio 2.0'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'TA 11/10/2022 18:44:56'!
balance

	|  totalBalance |
	
	totalBalance := 0.
	
	transactions do: [ :aTransaction | 
		totalBalance := aTransaction valueForBalance: totalBalance
	].
	
	^ totalBalance ! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio 2.0'!
Object subclass: #Transference
	instanceVariableNames: 'depositLeg withdrawLeg transferValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio 2.0'!

!Transference methodsFor: 'value' stamp: 'A 11/11/2022 15:38:24'!
value
	
	^ transferValue.! !


!Transference methodsFor: 'intialization' stamp: 'A 11/11/2022 16:40:01'!
initializeFrom: originAccount to: destinyAccount for: aValue
	
	withdrawLeg := TransferenceWithdrawLeg of: self inAccount: originAccount.
	depositLeg := TransferenceDepositLeg of: self inAccount: destinyAccount.
	transferValue := aValue.
	! !


!Transference methodsFor: 'tranfer legs' stamp: 'A 11/11/2022 15:46:23'!
depositLeg
	^depositLeg. ! !

!Transference methodsFor: 'tranfer legs' stamp: 'A 11/11/2022 15:45:54'!
withDrawLeg
	^withdrawLeg. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio 2.0'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'instance creation' stamp: 'A 11/11/2022 16:43:48'!
register: aValue from: originAccount to: destinyAccount 
	
	^(self new initializeFrom: originAccount to: destinyAccount for: aValue)! !
