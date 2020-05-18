//
// PersonPagingList.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct PersonPagingList: Codable {

    public var pagination: Pagination?
    public var entries: [PersonEntry]?

    public init(pagination: Pagination?, entries: [PersonEntry]?) {
        self.pagination = pagination
        self.entries = entries
    }


}

