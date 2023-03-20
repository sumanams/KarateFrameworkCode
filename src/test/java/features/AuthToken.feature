Feature: GET API feature

  Scenario: get user details
    #* print tokenID
    * def myToken = call read('AuthToken.feature@getToken')
    Given header Authorization = 'Bearer '+ tokenID
    Given url baseUrl+'/public/v1/users'
    #And path '25'
    When method GET
    Then status 200
    * print response.data
    * def dataSchema =
      """
      {
      "id": '#number',
      "name": '#string',
      "email": '#ignore',
      "gender": '#regex(fem|m)ale',
      "status": '#string'
      }
      """
    * match each response.data == '#(dataSchema)'
    * print response.data.length

@getToken @ignore
 Scenario: Get the token
 	* def token = tokenID
