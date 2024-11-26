/**
 * SimplyConvertCFC
 * Copyright 2024  Matthew J. Clemente, John Berquist
 * Licensed under MIT (https://mit-license.org)
 */
component accessors="true" {

    property name="company_uuid" default="";
    property name="litigation_id" default="";
    property name="status_id" default="";
    property name="fname" default="";
    property name="mname" default="";
    property name="lname" default="";
    property name="suffix" default="";
    property name="email" default="";
    property name="email2" default="";
    property name="phone" default="";
    property name="phone2" default="";
    property name="phone3" default="";
    property name="street1" default="";
    property name="street2" default="";
    property name="city" default="";
    property name="state" default="";
    property name="zip" default="";
    property name="ssn" default="";
    property name="relation" default="";
    property name="marital_status" default="";
    property name="fname_injured" default="";
    property name="mname_injured" default="";
    property name="lname_injured" default="";
    property name="suffix_injured" default="";
    property name="birthday_injured" default="";
    property name="death_date" default="";
    property name="email_injured" default="";
    property name="phone_injured" default="";
    property name="street1_address_injured" default="";
    property name="street2_address_injured" default="";
    property name="city_address_injured" default="";
    property name="state_address_injured" default="";
    property name="state_injured" default="";
    property name="zip_address_injured" default="";
    property name="ssn_injured" default="";
    property name="details" default="";
    property name="sol_trigger_date" default="";
    property name="procedure_date" default="";
    property name="procedure_followup_date" default="";
    property name="bot_language" default="en-US";
    property name="products" type="array" default="";
    property name="conditions" type="array" default="";
    property name="information" type="array" default="";
    property name="tags" type="array" default="";
    property name="lead_source" type="struct" default="";
    property name="meta" type="struct" default="";
    property name="external_data" type="struct" default="";

    /**
     * @hint setters will be called on all arguments passed in
     */
    public any function init() {
        setProducts([]);
        setConditions([]);
        setInformation([]);
        setTags([]);
        setLead_source({});
        setMeta({});
        setExternal_data({});

        return this;
    }

    /**
     * @hint Set the company's UUID to post to (if not posting to the company associated with the API key)
     */
    public any function companyUuid(required string company_uuid) {
        setCompany_uuid(arguments.company_uuid);
        return this;
    }

    /**
     * @hint Convenience method for calling `companyUuid()`
     */
    public any function company(required string company_uuid) {
        return companyUuid(arguments.company_uuid);
    }

    /**
     * @hint Set the litigation ID belonging to the case.
     */
    public any function litigationId(required numeric litigation_id) {
        setLitigation_id(arguments.litigation_id);
        return this;
    }

    /**
     * @hint Set the status ID of the case.
     */
    public any function statusId(required numeric status_id) {
        setStatus_id(arguments.status_id);
        return this;
    }

    /**
     * @hint Set the client's first name.
     */
    public any function fname(required string fname) {
        setFname(arguments.fname);
        return this;
    }

    /**
     * @hint Convenience method for calling `fname()`
     */
    public any function firstName(required string fname) {
        return this.fname(arguments.fname);
    }

    /**
     * @hint Set the client's middle name
     */
    public any function mname(required string mname) {
        setMname(arguments.mname);
        return this;
    }

    /**
     * @hint Convenience method for calling `mname()`
     */
    public any function middleName(required string mname) {
        return this.mname(arguments.mname);
    }

    /**
     * @hint Set the client's last name
     */
    public any function lname(required string lname) {
        setLname(arguments.lname);
        return this;
    }

    /**
     * @hint Convenience method for calling `lname()`
     */
    public any function lastName(required string lname) {
        return this.lname(arguments.lname);
    }

    /**
     * @hint Set the client's name suffix
     */
    public any function suffix(required string suffix) {
        setSuffix(arguments.suffix);
        return this;
    }

    /**
     * @hint Set the client's email address
     */
    public any function email(required string email) {
        setEmail(arguments.email);
        return this;
    }

    /**
     * @hint Set the client's secondary email address
     */
    public any function email2(required string email2) {
        setEmail2(arguments.email2);
        return this;
    }

    /**
     * @hint Set the client's phone number
     */
    public any function phone(required string phone) {
        setPhone(arguments.phone);
        return this;
    }

    /**
     * @hint Set the client's secondary phone number
     */
    public any function phone2(required string phone2) {
        setPhone2(arguments.phone2);
        return this;
    }

    /**
     * @hint Set the client's third phone number
     */
    public any function phone3(required string phone3) {
        setPhone3(arguments.phone3);
        return this;
    }

    /**
     * @hint Set the client's street address, line 1
     */
    public any function street1(required string street1) {
        setStreet1(arguments.street1);
        return this;
    }

    /**
     * @hint Set the client's street address, line 2
     */
    public any function street2(required string street2) {
        setStreet2(arguments.street2);
        return this;
    }

    /**
     * @hint Set the client's address city
     */
    public any function city(required string city) {
        setCity(arguments.city);
        return this;
    }

    /**
     * @hint Set the client's address state
     */
    public any function state(required string state) {
        setState(arguments.state);
        return this;
    }

    /**
     * @hint Set the client's address zip code
     */
    public any function zip(required string zip) {
        setZip(arguments.zip);
        return this;
    }

    /**
     * @hint Set the client's social security number
     */
    public any function ssn(required string ssn) {
        setSsn(arguments.ssn);
        return this;
    }

    /**
     * @hint Set the client's relation to the injured party
     */
    public any function relation(required string relation) {
        setRelation(arguments.relation);
        return this;
    }

    /**
     * @hint Set the client's marital status
     */
    public any function maritalStatus(required string marital_status) {
        setMarital_status(arguments.marital_status);
        return this;
    }

    /**
     * @hint Set the injured party's first name
     */
    public any function injuredFname(required string fname_injured) {
        setFname_injured(arguments.fname_injured);
        return this;
    }

    /**
     * @hint Convenience method for calling `injuredFname()`
     */
    public any function injuredFirstName(required string fname_injured) {
        return injuredFname(arguments.fname_injured);
    }

    /**
     * @hint Set the injured party's middle name
     */
    public any function injuredMname(required string mname_injured) {
        setMname_injured(arguments.mname_injured);
        return this;
    }

    /**
     * @hint Convenience method for calling `injuredMname()`
     */
    public any function injuredMiddleName(required string mname_injured) {
        return injuredMname(arguments.mname_injured);
    }

    /**
     * @hint Set the injured party's last name
     */
    public any function injuredLname(required string lname_injured) {
        setLname_injured(arguments.lname_injured);
        return this;
    }

    /**
     * @hint Convenience method for calling `injuredLname()`
     */
    public any function injuredLastName(required string lname_injured) {
        return injuredLname(arguments.lname_injured);
    }

    /**
     * @hint Set the injured party's name suffix
     */
    public any function injuredSuffix(required string suffix_injured) {
        setSuffix_injured(arguments.suffix_injured);
        return this;
    }

    /**
     * @hint Set the injured party's birthday
     */
    public any function injuredBirthday(required string birthday_injured) {
        setBirthday_injured(arguments.birthday_injured);
        return this;
    }

    /**
     * @hint Set the injured party's death date
     */
    public any function deathDate(required string death_date) {
        setDeath_date(arguments.death_date);
        return this;
    }

    /**
     * @hint Added for consistency with other methods
     */
    public any function injuredDeathDate(required string death_date) {
        return deathDate(arguments.death_date);
    }

    /**
     * @hint Set the injured party's email address
     */
    public any function injuredEmail(required string email_injured) {
        setEmail_injured(arguments.email_injured);
        return this;
    }

    /**
     * @hint Set the injured party's phone number
     */
    public any function injuredPhone(required string phone_injured) {
        setPhone_injured(arguments.phone_injured);
        return this;
    }

    /**
     * Set the injured party's street address, line 1
     */
    public any function injuredStreet1(required string street1_address_injured) {
        setStreet1_address_injured(arguments.street1_address_injured);
        return this;
    }

    /**
     * Set the injured party's street address, line 2
     */
    public any function injuredStreet2(required string street2_address_injured) {
        setStreet2_address_injured(arguments.street2_address_injured);
        return this;
    }

    /**
     * Set the injured party's city
     */
    public any function injuredCity(required string city_address_injured) {
        setCity_address_injured(arguments.city_address_injured);
        return this;
    }


    /**
     * Set the injured party's state
     */
    public any function injuredState(required string state_address_injured) {
        setState_address_injured(arguments.state_address_injured);
        return this;
    }

    /**
     * Set the state where the injury occurred
     */
    public any function stateInjured(required string state_injured) {
        setState_injured(arguments.state_injured);
        return this;
    }

    /**
     * Set the injured party's zip code
     */
    public any function injuredZip(required string zip_address_injured) {
        setZip_address_injured(arguments.zip_address_injured);
        return this;
    }

    /**
     * Set the injured party's social security number
     */
    public any function injuredSsn(required string ssn_injured) {
        setSsn_injured(arguments.ssn_injured);
        return this;
    }

    /**
     * Set the details of the case
     */
    public any function details(required string details) {
        setDetails(arguments.details);
        return this;
    }

    /**
     * Set the statute of limitations trigger date
     */
    public any function solTriggerDate(required string sol_trigger_date) {
        setSol_trigger_date(arguments.sol_trigger_date);
        return this;
    }

    /**
     * Set the date of the procedure used for qualification, exact use varies by litigation.
     */
    public any function procedureDate(required string procedure_date) {
        setProcedure_date(arguments.procedure_date);
        return this;
    }

    /**
     * Set the date of the follow-up procedure used for qualification, exact use varies by litigation.
     */
    public any function procedureFollowupDate(required string procedure_followup_date) {
        setProcedure_followup_date(arguments.procedure_followup_date);
        return this;
    }

    /**
     * Set the IETF BCP 47 language tag - defaults to "en-US"
     */
    public any function botLanguage(required string bot_language) {
        setBot_language(arguments.bot_language);
        return this;
    }

    /**
     * Set the products associated with the case. This is an array of product IDs associated with the case or comma separated string of product labels. If products are already set, this will overwrite them.
     */
    public any function products(required any products) {
        if (isArray(arguments.products)) {
            setProducts(arguments.products);
        } else {
            setProducts(arguments.products.listToArray());
        }
        return this;
    }

    /**
     * @hint Appends a single product to the existing product array, or can append an array of items to the existing array
     */
    public any function addProduct(required any product) {
        if (isArray(arguments.product)) {
            variables.products.append(arguments.product, true);
        } else {
            variables.products.append(arguments.product);
        }
        return this;
    }

    /**
     * @hint Convenience method for calling `addProduct()`
     */
    public any function product(required any product) {
        return addProduct(arguments.product);
    }

    /**
     * Set the conditions associated with the case. This is an array of condition IDs associated with the case or comma separated string of condition labels. If conditions are already set, this will overwrite them.
     */
    public any function conditions(required any conditions) {
        if (isArray(arguments.conditions)) {
            setConditions(arguments.conditions);
        } else {
            setConditions(arguments.conditions.listToArray());
        }
        return this;
    }

    /**
     * @hint Appends a single condition to the existing condition array, or can append an array of items to the existing array
     */
    public any function addCondition(required any condition) {
        if (isArray(arguments.condition)) {
            variables.conditions.append(arguments.condition, true);
        } else {
            variables.conditions.append(arguments.condition);
        }
        return this;
    }

    /**
     * @hint Convenience method for calling `addCondition()`
     */
    public any function condition(required any condition) {
        return addCondition(arguments.condition);
    }

    /**
     * @hint Appends a single "information" to the existing information array, or can append an array of items to the existing array
     */
    public any function addInformation(required any information) {
        if (isArray(arguments.information)) {
            variables.information.append(arguments.information, true);
        } else {
            variables.information.append(arguments.information);
        }
        return this;
    }

    /**
     * Convenience method for calling `addInformation()`
     */
    public any function addInfo(required any information) {
        return addInformation(arguments.information);
    }

    /**
     * @hint Convenience method for calling `addInformation()`
     */
    public any function information(required any information) {
        return addInformation(arguments.information);
    }

    /**
     * Set the tags associated with the case. This is an Array of tag UUIDs associated with the case. If tags are already set, this will overwrite them.
     */
    public any function tags(required array tags) {
        setTags(arguments.tags);
        return this;
    }

    /**
     * @hint Appends a single tag to the existing tags array
     */
    public any function addTag(required string tag) {
        variables.tags.append(arguments.tag);
        return this;
    }

    /**
     * Convenience method for calling `addTag()`
     */
    public any function tag(required string tag) {
        return addTag(arguments.tag);
    }

    /**
     * Set the lead source associated with the case. If any lead source information is already set, this will overwrite it.
     */
    public any function setLeadSource(required struct lead_source) {
        setLead_source(arguments.lead_source);
        return this;
    }

    /**
     * @hint Appends a single lead source property to the existing lead source struct
     * @data facilitates two means of setting the lead source property. You can pass in a struct with a key/value pair, or you can use this to pass in the key, and provide the value as the second argument.
     */
    public any function leadSource(required any data, any value) {
        if (isStruct(arguments.data)) {
            variables.lead_source.append(arguments.data);
        } else {
            variables.lead_source[arguments.data] = arguments.value;
        }
        return this;
    }

    // no need for a setMeta method, as it's implicitly handled via the accessor

    /**
     * @hint Appends a single meta property to the existing meta struct
     * @data facilitates two means of setting the meta property. You can pass in a struct with a key/value pair, or you can use this to pass in the key, and provide the value as the second argument.
     */
    public any function meta(required any data, any value) {
        if (isStruct(arguments.data)) {
            variables.meta.append(arguments.data);
        } else {
            variables.meta[arguments.data] = arguments.value;
        }
        return this;
    }

    /**
     * Set the external data associated with the case. If any external data information is already set, this will overwrite it.
     */
    public any function setExternalData(required struct external_data) {
        setExternal_data(arguments.external_data);
        return this;
    }

    /**
     * @hint Appends a single external data property to the existing external data struct
     * @data facilitates two means of setting the external data property. You can pass in a struct with a key/value pair, or you can use this to pass in the key, and provide the value as the second argument.
     */
    public any function externalData(required any data, any value) {
        if (isStruct(arguments.data)) {
            variables.external_data.append(arguments.data);
        } else {
            variables.external_data[arguments.data] = arguments.value;
        }
        return this;
    }

    /**
     * @hint Assembles the JSON to send to the API. Generally, you shouldn't need to call this directly.
     */
    public string function build() {
        var body = '';
        var properties = getPropertyValues();
        var count = properties.len();

        properties.each(function(property, index) {
            var value = serializeJSON(property.value);
            body &= '"#property.key#": ' & value & '#index NEQ count ? ',' : ''#';
        });

        return '{' & body & '}';
    }

    /**
     * @hint converts the array of properties to an array of their keys/values, while filtering those that have not been set
     */
    private array function getPropertyValues() {
        var propertyValues = getProperties().map(function(item, index) {
            return {'key': item.name, 'value': getPropertyValue(item.name)};
        });

        return propertyValues.filter(function(item, index) {
            return hasValue(item.value);
        });
    }

    private array function getProperties() {
        var metaData = getMetadata(this);
        var properties = [];

        for (var prop in metaData.properties) {
            properties.append(prop);
        }

        return properties;
    }

    private any function getPropertyValue(string key) {
        var method = this['get#key#'];
        var value = method();
        return value;
    }

    private boolean function hasValue(any value) {
        if (isNull(value)) return false;
        if (isSimpleValue(value)) return len(value);
        if (isStruct(value)) return !value.isEmpty();
        if (isArray(value)) return value.len();

        return false;
    }

    public any function onMissingMethod(string missingMethodName, struct missingMethodArguments) {
        if (arguments.missingMethodName.left(11) == 'leadSource_') {
            var property = arguments.missingMethodName.right(arguments.missingMethodName.len() - 11);
            return this.leadSource(property, arguments.missingMethodArguments[1]);
        } else if (arguments.missingMethodName.left(5) == 'meta_') {
            var property = arguments.missingMethodName.right(arguments.missingMethodName.len() - 5);
            return this.meta(property, arguments.missingMethodArguments[1]);
        } else if (arguments.missingMethodName.left(13) == 'externalData_') {
            var property = arguments.missingMethodName.right(arguments.missingMethodName.len() - 13);
            return this.externalData(property, arguments.missingMethodArguments[1]);
        } else if (arguments.missingMethodName.left(11) == 'addProduct_') {
            return this.addProduct(arguments.missingMethodArguments[1]);
        } else if (arguments.missingMethodName.left(13) == 'addCondition_') {
            return this.addCondition(arguments.missingMethodArguments[1]);
        } else if (
            arguments.missingMethodName.left(15) == 'addInformation_' || arguments.missingMethodName.left(8) == 'addInfo_'
        ) {
            return this.addInformation(arguments.missingMethodArguments[1]);
        } else if (arguments.missingMethodName.left(7) == 'addTag_') {
            return this.addTag(arguments.missingMethodArguments[1]);
        } else {
            var message = 'no such method (' & arguments.missingMethodName & ') in ' & getMetadata(this).name & '; [' & structKeyList(
                this
            ) & ']';
            throw '#message#';
        }
    }

}
