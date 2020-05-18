//
// GenericMetric.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** A metric used in faceting */

public struct GenericMetric: Codable {

    /** The type of metric, e.g. count */
    public var type: String?
    /** The metric value, e.g. {\&quot;count\&quot;: 34}  */
    public var value: JSONValue?

    public init(type: String?, value: JSONValue?) {
        self.type = type
        self.value = value
    }


}

