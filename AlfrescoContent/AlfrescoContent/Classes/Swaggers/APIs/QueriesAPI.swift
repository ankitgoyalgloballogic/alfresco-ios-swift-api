//
// QueriesAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class QueriesAPI {
    /**
     Find nodes
     
     - parameter term: (query) The term to search for. 
     - parameter rootNodeId: (query) The id of the node to start the search from.  Supports the aliases -my-, -root- and -shared-.  (optional)
     - parameter skipCount: (query) The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0.  (optional, default to 0)
     - parameter maxItems: (query) The maximum number of items to return in the list. If not supplied then the default value is 100.  (optional, default to 100)
     - parameter nodeType: (query) Restrict the returned results to only those of the given node type and its sub-types  (optional)
     - parameter include: (query) Returns additional information about the node. The following optional fields can be requested: * allowableOperations * aspectNames * isLink * isFavorite * isLocked * path * properties  (optional)
     - parameter orderBy: (query) A string to control the order of the entities returned in a list. You can use the **orderBy** parameter to sort the list by one or more fields.  Each field has a default sort order, which is normally ascending order. Read the API method implementation notes above to check if any fields used in this method have a descending default search order.  To sort the entities in a specific order, you can use the **ASC** and **DESC** keywords for any field.  (optional)
     - parameter fields: (query) A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func findNodes(term: String, rootNodeId: String? = nil, skipCount: Int? = nil, maxItems: Int? = nil, nodeType: String? = nil, include: [String]? = nil, orderBy: [String]? = nil, fields: [String]? = nil, completion: @escaping ((_ data: NodePaging?,_ error: Error?) -> Void)) {
        findNodesWithRequestBuilder(term: term, rootNodeId: rootNodeId, skipCount: skipCount, maxItems: maxItems, nodeType: nodeType, include: include, orderBy: orderBy, fields: fields).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Find nodes
     - GET /alfresco/versions/1/queries/nodes
     - **Note:** this endpoint is available in Alfresco 5.2 and newer versions.  Gets a list of nodes that match the given search criteria.  The search term is used to look for nodes that match against name, title, description, full text content or tags.  The search term: - must contain a minimum of 3 alphanumeric characters - allows \"quoted term\" - can optionally use '*' for wildcard matching  By default, file and folder types will be searched unless a specific type is provided as a query parameter.  By default, the search will be across the repository unless a specific root node id is provided to start the search from.  You can sort the result list using the **orderBy** parameter. You can specify one or more of the following fields in the **orderBy** parameter: * name * modifiedAt * createdAt 
     - BASIC:
       - type: basic
       - name: basicAuth
     - examples: [{contentType=application/json, example={
  "list" : {
    "entries" : [ {
      "entry" : {
        "isLink" : true,
        "isFile" : true,
        "createdByUser" : {
          "displayName" : "displayName",
          "id" : "id"
        },
        "modifiedAt" : "2000-01-23T04:56:07.000+00:00",
        "nodeType" : "nodeType",
        "parentId" : "parentId",
        "content" : {
          "sizeInBytes" : 0,
          "mimeTypeName" : "mimeTypeName",
          "mimeTypeGroup" : "mimeTypeGroup",
          "mimeType" : "mimeType",
          "encoding" : "encoding"
        },
        "aspectNames" : [ "aspectNames", "aspectNames" ],
        "createdAt" : "2000-01-23T04:56:07.000+00:00",
        "path" : {
          "elements" : [ {
            "aspectNames" : [ "aspectNames", "aspectNames" ],
            "name" : "name",
            "id" : "id",
            "nodeType" : "nodeType"
          }, {
            "aspectNames" : [ "aspectNames", "aspectNames" ],
            "name" : "name",
            "id" : "id",
            "nodeType" : "nodeType"
          } ],
          "name" : "name",
          "isComplete" : true
        },
        "isFolder" : true,
        "permissions" : {
          "isInheritanceEnabled" : true,
          "settable" : [ "settable", "settable" ],
          "locallySet" : [ {
            "authorityId" : "authorityId",
            "name" : "name",
            "accessStatus" : "ALLOWED"
          }, {
            "authorityId" : "authorityId",
            "name" : "name",
            "accessStatus" : "ALLOWED"
          } ],
          "inherited" : [ {
            "authorityId" : "authorityId",
            "name" : "name",
            "accessStatus" : "ALLOWED"
          }, {
            "authorityId" : "authorityId",
            "name" : "name",
            "accessStatus" : "ALLOWED"
          } ]
        },
        "isLocked" : false,
        "modifiedByUser" : {
          "displayName" : "displayName",
          "id" : "id"
        },
        "name" : "name",
        "definition" : {
          "properties" : [ {
            "isProtected" : true,
            "defaultValue" : "defaultValue",
            "dataType" : "dataType",
            "isMultiValued" : true,
            "description" : "description",
            "isMandatoryEnforced" : true,
            "id" : "id",
            "title" : "title",
            "constraints" : [ {
              "description" : "description",
              "id" : "id",
              "type" : "type",
              "title" : "title",
              "parameters" : {
                "key" : "{}"
              }
            }, {
              "description" : "description",
              "id" : "id",
              "type" : "type",
              "title" : "title",
              "parameters" : {
                "key" : "{}"
              }
            } ],
            "isMandatory" : true
          }, {
            "isProtected" : true,
            "defaultValue" : "defaultValue",
            "dataType" : "dataType",
            "isMultiValued" : true,
            "description" : "description",
            "isMandatoryEnforced" : true,
            "id" : "id",
            "title" : "title",
            "constraints" : [ {
              "description" : "description",
              "id" : "id",
              "type" : "type",
              "title" : "title",
              "parameters" : {
                "key" : "{}"
              }
            }, {
              "description" : "description",
              "id" : "id",
              "type" : "type",
              "title" : "title",
              "parameters" : {
                "key" : "{}"
              }
            } ],
            "isMandatory" : true
          } ]
        },
        "id" : "id",
        "properties" : "{}",
        "allowableOperations" : [ "allowableOperations", "allowableOperations" ],
        "isFavorite" : true
      }
    }, {
      "entry" : {
        "isLink" : true,
        "isFile" : true,
        "createdByUser" : {
          "displayName" : "displayName",
          "id" : "id"
        },
        "modifiedAt" : "2000-01-23T04:56:07.000+00:00",
        "nodeType" : "nodeType",
        "parentId" : "parentId",
        "content" : {
          "sizeInBytes" : 0,
          "mimeTypeName" : "mimeTypeName",
          "mimeTypeGroup" : "mimeTypeGroup",
          "mimeType" : "mimeType",
          "encoding" : "encoding"
        },
        "aspectNames" : [ "aspectNames", "aspectNames" ],
        "createdAt" : "2000-01-23T04:56:07.000+00:00",
        "path" : {
          "elements" : [ {
            "aspectNames" : [ "aspectNames", "aspectNames" ],
            "name" : "name",
            "id" : "id",
            "nodeType" : "nodeType"
          }, {
            "aspectNames" : [ "aspectNames", "aspectNames" ],
            "name" : "name",
            "id" : "id",
            "nodeType" : "nodeType"
          } ],
          "name" : "name",
          "isComplete" : true
        },
        "isFolder" : true,
        "permissions" : {
          "isInheritanceEnabled" : true,
          "settable" : [ "settable", "settable" ],
          "locallySet" : [ {
            "authorityId" : "authorityId",
            "name" : "name",
            "accessStatus" : "ALLOWED"
          }, {
            "authorityId" : "authorityId",
            "name" : "name",
            "accessStatus" : "ALLOWED"
          } ],
          "inherited" : [ {
            "authorityId" : "authorityId",
            "name" : "name",
            "accessStatus" : "ALLOWED"
          }, {
            "authorityId" : "authorityId",
            "name" : "name",
            "accessStatus" : "ALLOWED"
          } ]
        },
        "isLocked" : false,
        "modifiedByUser" : {
          "displayName" : "displayName",
          "id" : "id"
        },
        "name" : "name",
        "definition" : {
          "properties" : [ {
            "isProtected" : true,
            "defaultValue" : "defaultValue",
            "dataType" : "dataType",
            "isMultiValued" : true,
            "description" : "description",
            "isMandatoryEnforced" : true,
            "id" : "id",
            "title" : "title",
            "constraints" : [ {
              "description" : "description",
              "id" : "id",
              "type" : "type",
              "title" : "title",
              "parameters" : {
                "key" : "{}"
              }
            }, {
              "description" : "description",
              "id" : "id",
              "type" : "type",
              "title" : "title",
              "parameters" : {
                "key" : "{}"
              }
            } ],
            "isMandatory" : true
          }, {
            "isProtected" : true,
            "defaultValue" : "defaultValue",
            "dataType" : "dataType",
            "isMultiValued" : true,
            "description" : "description",
            "isMandatoryEnforced" : true,
            "id" : "id",
            "title" : "title",
            "constraints" : [ {
              "description" : "description",
              "id" : "id",
              "type" : "type",
              "title" : "title",
              "parameters" : {
                "key" : "{}"
              }
            }, {
              "description" : "description",
              "id" : "id",
              "type" : "type",
              "title" : "title",
              "parameters" : {
                "key" : "{}"
              }
            } ],
            "isMandatory" : true
          } ]
        },
        "id" : "id",
        "properties" : "{}",
        "allowableOperations" : [ "allowableOperations", "allowableOperations" ],
        "isFavorite" : true
      }
    } ],
    "pagination" : {
      "maxItems" : 5,
      "hasMoreItems" : true,
      "totalItems" : 6,
      "count" : 0,
      "skipCount" : 1
    },
    "source" : {
      "isLink" : true,
      "isFile" : true,
      "createdByUser" : {
        "displayName" : "displayName",
        "id" : "id"
      },
      "modifiedAt" : "2000-01-23T04:56:07.000+00:00",
      "nodeType" : "nodeType",
      "parentId" : "parentId",
      "content" : {
        "sizeInBytes" : 0,
        "mimeTypeName" : "mimeTypeName",
        "mimeTypeGroup" : "mimeTypeGroup",
        "mimeType" : "mimeType",
        "encoding" : "encoding"
      },
      "aspectNames" : [ "aspectNames", "aspectNames" ],
      "createdAt" : "2000-01-23T04:56:07.000+00:00",
      "path" : {
        "elements" : [ {
          "aspectNames" : [ "aspectNames", "aspectNames" ],
          "name" : "name",
          "id" : "id",
          "nodeType" : "nodeType"
        }, {
          "aspectNames" : [ "aspectNames", "aspectNames" ],
          "name" : "name",
          "id" : "id",
          "nodeType" : "nodeType"
        } ],
        "name" : "name",
        "isComplete" : true
      },
      "isFolder" : true,
      "permissions" : {
        "isInheritanceEnabled" : true,
        "settable" : [ "settable", "settable" ],
        "locallySet" : [ {
          "authorityId" : "authorityId",
          "name" : "name",
          "accessStatus" : "ALLOWED"
        }, {
          "authorityId" : "authorityId",
          "name" : "name",
          "accessStatus" : "ALLOWED"
        } ],
        "inherited" : [ {
          "authorityId" : "authorityId",
          "name" : "name",
          "accessStatus" : "ALLOWED"
        }, {
          "authorityId" : "authorityId",
          "name" : "name",
          "accessStatus" : "ALLOWED"
        } ]
      },
      "isLocked" : false,
      "modifiedByUser" : {
        "displayName" : "displayName",
        "id" : "id"
      },
      "name" : "name",
      "definition" : {
        "properties" : [ {
          "isProtected" : true,
          "defaultValue" : "defaultValue",
          "dataType" : "dataType",
          "isMultiValued" : true,
          "description" : "description",
          "isMandatoryEnforced" : true,
          "id" : "id",
          "title" : "title",
          "constraints" : [ {
            "description" : "description",
            "id" : "id",
            "type" : "type",
            "title" : "title",
            "parameters" : {
              "key" : "{}"
            }
          }, {
            "description" : "description",
            "id" : "id",
            "type" : "type",
            "title" : "title",
            "parameters" : {
              "key" : "{}"
            }
          } ],
          "isMandatory" : true
        }, {
          "isProtected" : true,
          "defaultValue" : "defaultValue",
          "dataType" : "dataType",
          "isMultiValued" : true,
          "description" : "description",
          "isMandatoryEnforced" : true,
          "id" : "id",
          "title" : "title",
          "constraints" : [ {
            "description" : "description",
            "id" : "id",
            "type" : "type",
            "title" : "title",
            "parameters" : {
              "key" : "{}"
            }
          }, {
            "description" : "description",
            "id" : "id",
            "type" : "type",
            "title" : "title",
            "parameters" : {
              "key" : "{}"
            }
          } ],
          "isMandatory" : true
        } ]
      },
      "id" : "id",
      "properties" : "{}",
      "allowableOperations" : [ "allowableOperations", "allowableOperations" ],
      "isFavorite" : true
    }
  }
}}]
     
     - parameter term: (query) The term to search for. 
     - parameter rootNodeId: (query) The id of the node to start the search from.  Supports the aliases -my-, -root- and -shared-.  (optional)
     - parameter skipCount: (query) The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0.  (optional, default to 0)
     - parameter maxItems: (query) The maximum number of items to return in the list. If not supplied then the default value is 100.  (optional, default to 100)
     - parameter nodeType: (query) Restrict the returned results to only those of the given node type and its sub-types  (optional)
     - parameter include: (query) Returns additional information about the node. The following optional fields can be requested: * allowableOperations * aspectNames * isLink * isFavorite * isLocked * path * properties  (optional)
     - parameter orderBy: (query) A string to control the order of the entities returned in a list. You can use the **orderBy** parameter to sort the list by one or more fields.  Each field has a default sort order, which is normally ascending order. Read the API method implementation notes above to check if any fields used in this method have a descending default search order.  To sort the entities in a specific order, you can use the **ASC** and **DESC** keywords for any field.  (optional)
     - parameter fields: (query) A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  (optional)

     - returns: RequestBuilder<NodePaging> 
     */
    open class func findNodesWithRequestBuilder(term: String, rootNodeId: String? = nil, skipCount: Int? = nil, maxItems: Int? = nil, nodeType: String? = nil, include: [String]? = nil, orderBy: [String]? = nil, fields: [String]? = nil) -> RequestBuilder<NodePaging> {
        let path = "/alfresco/versions/1/queries/nodes"
        let URLString = AlfrescoContentAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "term": term, 
            "rootNodeId": rootNodeId, 
            "skipCount": skipCount?.encodeToJSON(), 
            "maxItems": maxItems?.encodeToJSON(), 
            "nodeType": nodeType, 
            "include": include, 
            "orderBy": orderBy, 
            "fields": fields
        ])

        let requestBuilder: RequestBuilder<NodePaging>.Type = AlfrescoContentAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Find people
     
     - parameter term: (query) The term to search for.  
     - parameter skipCount: (query) The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0.  (optional, default to 0)
     - parameter maxItems: (query) The maximum number of items to return in the list. If not supplied then the default value is 100.  (optional, default to 100)
     - parameter fields: (query) A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  (optional)
     - parameter orderBy: (query) A string to control the order of the entities returned in a list. You can use the **orderBy** parameter to sort the list by one or more fields.  Each field has a default sort order, which is normally ascending order. Read the API method implementation notes above to check if any fields used in this method have a descending default search order.  To sort the entities in a specific order, you can use the **ASC** and **DESC** keywords for any field.  (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func findPeople(term: String, skipCount: Int? = nil, maxItems: Int? = nil, fields: [String]? = nil, orderBy: [String]? = nil, completion: @escaping ((_ data: PersonPaging?,_ error: Error?) -> Void)) {
        findPeopleWithRequestBuilder(term: term, skipCount: skipCount, maxItems: maxItems, fields: fields, orderBy: orderBy).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Find people
     - GET /alfresco/versions/1/queries/people
     - **Note:** this endpoint is available in Alfresco 5.2 and newer versions.  Gets a list of people that match the given search criteria.  The search term is used to look for matches against person id, firstname and lastname.  The search term: - must contain a minimum of 2 alphanumeric characters - can optionally use '*' for wildcard matching within the term  You can sort the result list using the **orderBy** parameter. You can specify one or more of the following fields in the **orderBy** parameter: * id * firstName * lastName 
     - BASIC:
       - type: basic
       - name: basicAuth
     - examples: [{contentType=application/json, example={
  "list" : {
    "entries" : [ {
      "entry" : {
        "googleId" : "googleId",
        "lastName" : "lastName",
        "userStatus" : "userStatus",
        "capabilities" : {
          "isMutable" : true,
          "isGuest" : true,
          "isAdmin" : true
        },
        "displayName" : "displayName",
        "jobTitle" : "jobTitle",
        "statusUpdatedAt" : "2000-01-23T04:56:07.000+00:00",
        "mobile" : "mobile",
        "emailNotificationsEnabled" : true,
        "description" : "description",
        "telephone" : "telephone",
        "enabled" : true,
        "aspectNames" : [ "aspectNames", "aspectNames" ],
        "firstName" : "firstName",
        "skypeId" : "skypeId",
        "avatarId" : "avatarId",
        "instantMessageId" : "instantMessageId",
        "location" : "location",
        "company" : {
          "address3" : "address3",
          "address2" : "address2",
          "address1" : "address1",
          "organization" : "organization",
          "postcode" : "postcode",
          "telephone" : "telephone",
          "fax" : "fax",
          "email" : "email"
        },
        "id" : "id",
        "email" : "email",
        "properties" : "{}"
      }
    }, {
      "entry" : {
        "googleId" : "googleId",
        "lastName" : "lastName",
        "userStatus" : "userStatus",
        "capabilities" : {
          "isMutable" : true,
          "isGuest" : true,
          "isAdmin" : true
        },
        "displayName" : "displayName",
        "jobTitle" : "jobTitle",
        "statusUpdatedAt" : "2000-01-23T04:56:07.000+00:00",
        "mobile" : "mobile",
        "emailNotificationsEnabled" : true,
        "description" : "description",
        "telephone" : "telephone",
        "enabled" : true,
        "aspectNames" : [ "aspectNames", "aspectNames" ],
        "firstName" : "firstName",
        "skypeId" : "skypeId",
        "avatarId" : "avatarId",
        "instantMessageId" : "instantMessageId",
        "location" : "location",
        "company" : {
          "address3" : "address3",
          "address2" : "address2",
          "address1" : "address1",
          "organization" : "organization",
          "postcode" : "postcode",
          "telephone" : "telephone",
          "fax" : "fax",
          "email" : "email"
        },
        "id" : "id",
        "email" : "email",
        "properties" : "{}"
      }
    } ],
    "pagination" : {
      "maxItems" : 5,
      "hasMoreItems" : true,
      "totalItems" : 6,
      "count" : 0,
      "skipCount" : 1
    }
  }
}}]
     
     - parameter term: (query) The term to search for.  
     - parameter skipCount: (query) The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0.  (optional, default to 0)
     - parameter maxItems: (query) The maximum number of items to return in the list. If not supplied then the default value is 100.  (optional, default to 100)
     - parameter fields: (query) A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  (optional)
     - parameter orderBy: (query) A string to control the order of the entities returned in a list. You can use the **orderBy** parameter to sort the list by one or more fields.  Each field has a default sort order, which is normally ascending order. Read the API method implementation notes above to check if any fields used in this method have a descending default search order.  To sort the entities in a specific order, you can use the **ASC** and **DESC** keywords for any field.  (optional)

     - returns: RequestBuilder<PersonPaging> 
     */
    open class func findPeopleWithRequestBuilder(term: String, skipCount: Int? = nil, maxItems: Int? = nil, fields: [String]? = nil, orderBy: [String]? = nil) -> RequestBuilder<PersonPaging> {
        let path = "/alfresco/versions/1/queries/people"
        let URLString = AlfrescoContentAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "term": term, 
            "skipCount": skipCount?.encodeToJSON(), 
            "maxItems": maxItems?.encodeToJSON(), 
            "fields": fields, 
            "orderBy": orderBy
        ])

        let requestBuilder: RequestBuilder<PersonPaging>.Type = AlfrescoContentAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Find sites
     
     - parameter term: (query) The term to search for. 
     - parameter skipCount: (query) The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0.  (optional, default to 0)
     - parameter maxItems: (query) The maximum number of items to return in the list. If not supplied then the default value is 100.  (optional, default to 100)
     - parameter orderBy: (query) A string to control the order of the entities returned in a list. You can use the **orderBy** parameter to sort the list by one or more fields.  Each field has a default sort order, which is normally ascending order. Read the API method implementation notes above to check if any fields used in this method have a descending default search order.  To sort the entities in a specific order, you can use the **ASC** and **DESC** keywords for any field.  (optional)
     - parameter fields: (query) A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func findSites(term: String, skipCount: Int? = nil, maxItems: Int? = nil, orderBy: [String]? = nil, fields: [String]? = nil, completion: @escaping ((_ data: SitePaging?,_ error: Error?) -> Void)) {
        findSitesWithRequestBuilder(term: term, skipCount: skipCount, maxItems: maxItems, orderBy: orderBy, fields: fields).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Find sites
     - GET /alfresco/versions/1/queries/sites
     - **Note:** this endpoint is available in Alfresco 5.2 and newer versions.  Gets a list of sites that match the given search criteria.  The search term is used to look for sites that match against site id, title or description.  The search term: - must contain a minimum of 2 alphanumeric characters - can optionally use '*' for wildcard matching within the term  The default sort order for the returned list is for sites to be sorted by ascending id. You can override the default by using the **orderBy** parameter. You can specify one or more of the following fields in the **orderBy** parameter: * id * title * description 
     - BASIC:
       - type: basic
       - name: basicAuth
     - examples: [{contentType=application/json, example={
  "list" : {
    "entries" : [ {
      "entry" : {
        "role" : "SiteConsumer",
        "visibility" : "PRIVATE",
        "guid" : "guid",
        "description" : "description",
        "id" : "id",
        "preset" : "preset",
        "title" : "title"
      }
    }, {
      "entry" : {
        "role" : "SiteConsumer",
        "visibility" : "PRIVATE",
        "guid" : "guid",
        "description" : "description",
        "id" : "id",
        "preset" : "preset",
        "title" : "title"
      }
    } ],
    "pagination" : {
      "maxItems" : 5,
      "hasMoreItems" : true,
      "totalItems" : 6,
      "count" : 0,
      "skipCount" : 1
    }
  }
}}]
     
     - parameter term: (query) The term to search for. 
     - parameter skipCount: (query) The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0.  (optional, default to 0)
     - parameter maxItems: (query) The maximum number of items to return in the list. If not supplied then the default value is 100.  (optional, default to 100)
     - parameter orderBy: (query) A string to control the order of the entities returned in a list. You can use the **orderBy** parameter to sort the list by one or more fields.  Each field has a default sort order, which is normally ascending order. Read the API method implementation notes above to check if any fields used in this method have a descending default search order.  To sort the entities in a specific order, you can use the **ASC** and **DESC** keywords for any field.  (optional)
     - parameter fields: (query) A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  (optional)

     - returns: RequestBuilder<SitePaging> 
     */
    open class func findSitesWithRequestBuilder(term: String, skipCount: Int? = nil, maxItems: Int? = nil, orderBy: [String]? = nil, fields: [String]? = nil) -> RequestBuilder<SitePaging> {
        let path = "/alfresco/versions/1/queries/sites"
        let URLString = AlfrescoContentAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "term": term, 
            "skipCount": skipCount?.encodeToJSON(), 
            "maxItems": maxItems?.encodeToJSON(), 
            "orderBy": orderBy, 
            "fields": fields
        ])

        let requestBuilder: RequestBuilder<SitePaging>.Type = AlfrescoContentAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    
    /**
     Get Advance search configurations
     - parameter completion: SearchConfigModel is the output of the API for success and error: Returns error if there is any
     */
    
    open class func loadAdvanceSearchConfigurations(withCallback completion: @escaping ((_ data: SearchConfigModel?,_ error: Error?) -> Void)) {
        self.findAdvanceSearchConfigurationPath().execute { response, error in
            completion(response?.body, error)
        }
    }
    
    /**
     - GET Advance search configurations API call
        This API is used to fetch configurations from the server. This is GET request
     */
    class func findAdvanceSearchConfigurationPath() -> RequestBuilder<SearchConfigModel> {
        let URLString = "https://mobileapps.envalfresco.com/adf/app-config.json"
        let parameters: [String:Any]? = nil
        let requestBuilder: RequestBuilder<SearchConfigModel>.Type = AlfrescoContentAPI.requestBuilderFactory.getBuilder()
        return requestBuilder.init(method: "GET", URLString: URLString, parameters: parameters, isBody: false)
    }
}

