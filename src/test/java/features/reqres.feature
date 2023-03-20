Feature: Trying out APIs from reqres.com

Background:
* url 'https://reqres.in/'

Scenario: Create a new user
* path '/api/users'
* def reqBody =
"""
{
    "name": "morpheus",
    "job": "leader"
}
"""
* request reqBody
When method POST
Then status 201
* def id = response.id
* call read('reqres.feature@getUser') 


@getUser @ignore
Scenario: Check if the user was created successfully
#* def userid = 123
#* print userid
#* def myVar = '/api/users/' + userid
#* print myVar
* path '/api/users/', id
When method GET
Then status 200
* print response

@ignore
Scenario: Delete the user
* path '/api/users/2'
When method DELETE
Then status 204

