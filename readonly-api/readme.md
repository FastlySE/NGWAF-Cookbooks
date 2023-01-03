<h1>Controlling the type of access to an API endpoint</h1>

API’s are a valuable resource to allow application developers to expose features and functionality, but they can be abused because they provide access to corporate data. Its important to only allow the type of access to an API that was intended, and restrict unexpected uses of the published API. 

This rule will highlight how it is possible to restrict the type of HTTP Method used when accessing an API

<b>Benefits</b>
Tight controls over how an external entity can use an API. If you intended for an API to only provide access to data and not allow it to be used to change the data, then restricting the HTTP Method used to access it provides a greater level of security.

<b>Detail (Ingredients)</b>

Create a customer request rule
Specify the PATH of the API (for eg. /v2/api/inventory)
Specific the method allowed. This can be an single method, or multiple methods 
