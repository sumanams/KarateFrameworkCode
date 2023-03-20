Feature: Testing

Scenario: Testing
 * def idsToDelete =
    """
      [
        101,
        102,
        103
      ]
   """
   * def deleteTestDataFun =
    """
      function(x) {
        print(x);
      }
    """
    * karate.forEach(idsToDelete, deleteTestDataFun)
    
    @T1
Scenario: T2
	Given def cat = 
  """
  {
    name: 'Billie',
    kittens: [
      { id: 23, name: 'Bob' },
      { id: 42, name: 'Wild' }
    ]
  }
  """
# normal 'equality' match. note the wildcard '*' in the JsonPath (returns an array)
Then match cat.kittens[*].id contains any [23]



Scenario: recurse nested json
  * def original = { a: 1, b: 2, c: 3, d: { a: 1, b: 2 } }
  * def expected = { a: 1, c: 3, d: { b: 2 } }
  * match original contains deep expected