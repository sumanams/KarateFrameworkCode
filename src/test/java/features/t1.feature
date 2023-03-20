Feature: T1 : Caller

@s1
Scenario: Read variable from different feature file
	* def res = call read('t2.feature')
	* print res.name
	
@s2
Scenario: Read var from different scenario
	//* call read('./@s1')
	* print res
