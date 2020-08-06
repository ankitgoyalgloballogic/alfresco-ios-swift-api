//
// NodeBodyLock.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct NodeBodyLock: Codable {

    public enum ModelType: String, Codable { 
        case allowOwnerChanges = "ALLOW_OWNER_CHANGES"
        case full = "FULL"
    }
    public enum Lifetime: String, Codable { 
        case persistent = "PERSISTENT"
        case ephemeral = "EPHEMERAL"
    }
    public var timeToExpire: Int?
    public var type: ModelType?
    public var lifetime: Lifetime?

    public init(timeToExpire: Int?, type: ModelType?, lifetime: Lifetime?) {
        self.timeToExpire = timeToExpire
        self.type = type
        self.lifetime = lifetime
    }


}
