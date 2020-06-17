//
// RequestDefaults.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** Common query defaults */

public struct RequestDefaults: Codable {

    public enum DefaultFTSOperator: String, Codable { 
        case and = "AND"
        case or = "OR"
    }
    public enum DefaultFTSFieldOperator: String, Codable { 
        case and = "AND"
        case or = "OR"
    }
    /** A list of query fields/properties used to expand TEXT: queries. The default is cm:content. You could include all content properties using d:content or list all individual content properties or types. As more terms are included the query size, complexity, memory impact and query time will increase.  */
    public var textAttributes: [String]?
    /** The default way to combine query parts when AND or OR is not explicitly stated - includes ! - + one two three (one two three)  */
    public var defaultFTSOperator: DefaultFTSOperator?
    /** The default way to combine query parts in field query groups when AND or OR is not explicitly stated - includes ! - + FIELD:(one two three)  */
    public var defaultFTSFieldOperator: DefaultFTSFieldOperator?
    /** The default name space to use if one is not provided */
    public var namespace: String?
    public var defaultFieldName: String?

    public init(textAttributes: [String]?, defaultFTSOperator: DefaultFTSOperator?, defaultFTSFieldOperator: DefaultFTSFieldOperator?, namespace: String?, defaultFieldName: String?) {
        self.textAttributes = textAttributes
        self.defaultFTSOperator = defaultFTSOperator
        self.defaultFTSFieldOperator = defaultFTSFieldOperator
        self.namespace = namespace
        self.defaultFieldName = defaultFieldName
    }


}
