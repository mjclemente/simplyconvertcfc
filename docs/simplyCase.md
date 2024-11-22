# `simplyCase.cfc` Reference

#### `companyUuid( required string company_uuid )`

Set the company's UUID to post to (if not posting to the company associated with the API key).

#### `company( required string company_uuid )`

Convenience method for calling `companyUuid()`.

#### `litigationId( required numeric litigation_id )`

Set the litigation ID belonging to the case.

#### `statusId( required numeric status_id )`

Set the status ID of the case.

#### `fname( required string fname )`

Set the client's first name.

#### `firstName( required string fname )`

Convenience method for calling `fname()`.

#### `mname( required string mname )`

Set the client's middle name.

#### `middleName( required string mname )`

Convenience method for calling `mname()`.

#### `lname( required string lname )`

Set the client's last name.

#### `lastName( required string lname )`

Convenience method for calling `lname()`.

#### `suffix( required string suffix )`

Set the client's name suffix.

#### `email( required string email )`

Set the client's email address.

#### `email2( required string email2 )`

Set the client's secondary email address.

#### `phone( required string phone )`

Set the client's phone number.

#### `phone2( required string phone2 )`

Set the client's secondary phone number.

#### `phone3( required string phone3 )`

Set the client's third phone number.

#### `street1( required string street1 )`

Set the client's street address, line 1.

#### `street2( required string street2 )`

Set the client's street address, line 2.

#### `city( required string city )`

Set the client's address city.

#### `state( required string state )`

Set the client's address state.

#### `zip( required string zip )`

Set the client's address zip code.

#### `ssn( required string ssn )`

Set the client's social security number.

#### `relation( required string relation )`

Set the client's relation to the injured party.

#### `maritalStatus( required string marital_status )`

Set the client's marital status.

#### `injuredFname( required string fname_injured )`

Set the injured party's first name.

#### `injuredFirstName( required string fname_injured )`

Convenience method for calling `injuredFname()`.

#### `injuredMname( required string mname_injured )`

Set the injured party's middle name.

#### `injuredMiddleName( required string mname_injured )`

Convenience method for calling `injuredMname()`.

#### `injuredLname( required string lname_injured )`

Set the injured party's last name.

#### `injuredLastName( required string lname_injured )`

Convenience method for calling `injuredLname()`.

#### `injuredSuffix( required string suffix_injured )`

Set the injured party's name suffix.

#### `injuredBirthday( required string birthday_injured )`

Set the injured party's birthday.

#### `deathDate( required string death_date )`

Set the injured party's death date.

#### `injuredDeathDate( required string death_date )`

Added for consistency with other methods.

#### `injuredEmail( required string email_injured )`

Set the injured party's email address.

#### `injuredPhone( required string phone_injured )`

Set the injured party's phone number.

#### `injuredStreet1( required string street1_address_injured )`

Set the injured party's street address, line 1.

#### `injuredStreet2( required string street2_address_injured )`

Set the injured party's street address, line 2.

#### `injuredCity( required string city_address_injured )`

Set the injured party's city.

#### `injuredState( required string state_address_injured )`

Set the injured party's state.

#### `stateInjured( required string state_injured )`

Set the state where the injury occurred.

#### `injuredZip( required string zip_address_injured )`

Set the injured party's zip code.

#### `injuredSsn( required string ssn_injured )`

Set the injured party's social security number.

#### `details( required string details )`

Set the details of the case.

#### `solTriggerDate( required string sol_trigger_date )`

Set the statute of limitations trigger date.

#### `procedureDate( required string procedure_date )`

Set the date of the procedure used for qualification, exact use varies by litigation.

#### `procedureFollowupDate( required string procedure_followup_date )`

Set the date of the follow-up procedure used for qualification, exact use varies by litigation.

#### `botLanguage( required string bot_language )`

Set the IETF BCP 47 language tag - defaults to "en-US".

#### `products( required any products )`

Set the products associated with the case. This is an array of product IDs associated with the case or comma separated string of product labels. If products are already set, this will overwrite them.

#### `addProduct( required numeric product )`

Appends a single product to the existing product array.

#### `product( required numeric product )`

Convenience method for calling `addProduct()`.

#### `conditions( required any conditions )`

Set the conditions associated with the case. This is an array of condition IDs associated with the case or comma separated string of condition labels. If conditions are already set, this will overwrite them.

#### `addCondition( required numeric condition )`

Appends a single condition to the existing condition array.

#### `condition( required numeric condition )`

Convenience method for calling `addCondition()`.

#### `addInformation( required numeric information )`

Appends a single "information" to the existing information array.

#### `addInfo( required numeric information )`

Convenience method for calling `addInformation()`.

#### `information( required numeric information )`

Convenience method for calling `addInformation()`.

#### `tags( required array tags )`

Set the tags associated with the case. This is an Array of tag UUIDs associated with the case. If tags are already set, this will overwrite them.

#### `addTag( required string tag )`

Appends a single tag to the existing tags array.

#### `tag( required string tag )`

Convenience method for calling `addTag()`.

#### `setLeadSource( required struct lead_source )`

Set the lead source associated with the case. If any lead source information is already set, this will overwrite it.

#### `leadSource( required any data, any value )`

Appends a single lead source property to the existing lead source struct. The parameter `data` facilitates two means of setting the lead source property. You can pass in a struct with a key/value pair, or you can use this to pass in the key, and provide the value as the second argument.

#### `meta( required any data, any value )`

Appends a single meta property to the existing meta struct. The parameter `data` facilitates two means of setting the meta property. You can pass in a struct with a key/value pair, or you can use this to pass in the key, and provide the value as the second argument.

#### `setExternalData( required struct external_data )`

Set the external data associated with the case. If any external data information is already set, this will overwrite it.

#### `externalData( required any data, any value )`

Appends a single external data property to the existing external data struct. The parameter `data` facilitates two means of setting the external data property. You can pass in a struct with a key/value pair, or you can use this to pass in the key, and provide the value as the second argument.

#### `build()`

Assembles the JSON to send to the API. Generally, you shouldn't need to call this directly.
