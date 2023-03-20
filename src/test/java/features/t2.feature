Feature: T2

Scenario:
	* def name = 'sumana'
	* def javaUtil = Java.type('utilities.javaUtils')
	* def util = new javaUtil()
	* def myString = util.printString("sumana")
	* print myString