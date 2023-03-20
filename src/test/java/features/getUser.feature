Feature: 
Experiment with the user details

Background:
Given url 'https://reqres.in/'

Scenario: Get user details
Given path '/api/users'
And params {"page" : 2}
When method get
Then status 200
And print response

* def dataSchema =
"""
	{
      "id": '#number',
      "email": '#string',
      "first_name": '#string',
      "last_name": '#string',
      "avatar": '#string'
    }
"""

* def supSchema = 
"""
{
    "url": '#string',
    "text": '#ignore'
  }
"""
* def mainSchema =
"""
{
  "page": 2,
  "per_page": '#? _ == $.page * 3',
  "total": 12,
  "total_pages": '#? _ == $.page',
  "data": '#[] #(dataSchema)',
  "support": '#(supSchema)'
}
"""
  
* match response ==  mainSchema
#* match response.page == '#? _ == $.total_pages'
* print karate.lowerCase(response.support.text)
* match response.data[*].id !contains [2]
#* match $.data == '#[$.per_page]'
* assert response.data.length > 0
* if (response.page > 0) karate.fail("Failed")
	