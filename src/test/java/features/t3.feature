Feature:

Scenario:
	Given url 'https://abcd.com'
	And path 'a','b'
	And params {"k1":"v1", "k2":"v2"}
	Then method get
	* print response
	