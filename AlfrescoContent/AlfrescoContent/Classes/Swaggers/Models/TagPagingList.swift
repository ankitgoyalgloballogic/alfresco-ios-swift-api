//
// TagPagingList.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct TagPagingList: Codable {

    public var pagination: Pagination
    public var entries: [TagEntry]

    public init(pagination: Pagination, entries: [TagEntry]) {
        self.pagination = pagination
        self.entries = entries
    }


}
