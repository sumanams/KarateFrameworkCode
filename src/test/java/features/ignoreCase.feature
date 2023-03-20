Feature: Case insensitive matching

  Scenario: string matching
    * def test =
      """
      {
      "sourceType": "Error",
      "id": "123456",
      "type": "searchuser",
      "total": 0,
      "value": [
      	{
	        "details": "this is the user search case",
	        "source": {
	          "sourceType": "Error",
	          "id": "77200203043",
	          "issue": [
	            {
	              "severity": "high",
	              "code": "678",
	              "message": {
	                "text": "No matching User details found"
	              },
	              "errorCode": "ERROR401"
	            }
	          ]
	        },
	        "user": {
	          "status": "active"
	        }
	      }
      ]
      }
      """
      * def schema = read('../../../../src/test/resources/payload/egSchema.json')
      * print schema
      * match test.total == 0 
      * def status = 'active'
      * match test.value[*].user.status == '#(status)'
   # * match test == schema
      #"""
      #{
      #"sourceType": "Error",
      #"id": "#present",
      #"type": "searchuser",
      #"total": 0,
      #"value": [
      #{
        #"details": "#present",
        #"source": {
          #"sourceType": "Error",
          #"id": "#ignore",
          #"issue": [
            #{
              #"severity": "high",
              #"code": "678",
              #"message": {
                #"text": "No matching User details found"
              #},
              #"errorCode": "ERROR401"
            #}
          #]
        #},
        #"user": {
          #"status": "active"
        #}
      #}
      #]
      #}
      #"""
