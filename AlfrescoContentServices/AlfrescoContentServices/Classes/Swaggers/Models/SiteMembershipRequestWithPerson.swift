//
// SiteMembershipRequestWithPerson.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct SiteMembershipRequestWithPerson: Codable {

    public var _id: String
    public var createdAt: Date
    public var site: Site
    public var person: Person
    public var message: String?

    public init(_id: String, createdAt: Date, site: Site, person: Person, message: String?) {
        self._id = _id
        self.createdAt = createdAt
        self.site = site
        self.person = person
        self.message = message
    }

    public enum CodingKeys: String, CodingKey { 
        case _id = "id"
        case createdAt
        case site
        case person
        case message
    }


}

