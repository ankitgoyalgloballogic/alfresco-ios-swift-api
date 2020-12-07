//
// ResultNode.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct ResultNode: Codable {

    public var _id: String
    /** The name must not contain spaces or the following special characters: * \&quot; &lt; &gt; \\ / ? : and |. The character . must not be used at the end of the name.  */
    public var name: String
    public var nodeType: String
    public var isFolder: Bool
    public var isFile: Bool
    public var isLocked: Bool?
    public var modifiedAt: Date
    public var modifiedByUser: UserInfo
    public var createdAt: Date
    public var createdByUser: UserInfo
    public var parentId: String?
    public var isLink: Bool?
    public var isFavorite: Bool?
    public var content: ContentInfo?
    public var aspectNames: [String]?
    public var properties: JSONValue?
    public var allowableOperations: [String]?
    public var path: PathInfo?
    public var permissions: PermissionsInfo?
    public var definition: Definition?
    public var search: SearchEntry?
    public var archivedByUser: UserInfo?
    public var archivedAt: Date?
    public var versionLabel: String?
    public var versionComment: String?

    public init(_id: String, name: String, nodeType: String, isFolder: Bool, isFile: Bool, isLocked: Bool?, modifiedAt: Date, modifiedByUser: UserInfo, createdAt: Date, createdByUser: UserInfo, parentId: String?, isLink: Bool?, isFavorite: Bool?, content: ContentInfo?, aspectNames: [String]?, properties: JSONValue?, allowableOperations: [String]?, path: PathInfo?, permissions: PermissionsInfo?, definition: Definition?, search: SearchEntry?, archivedByUser: UserInfo?, archivedAt: Date?, versionLabel: String?, versionComment: String?) {
        self._id = _id
        self.name = name
        self.nodeType = nodeType
        self.isFolder = isFolder
        self.isFile = isFile
        self.isLocked = isLocked
        self.modifiedAt = modifiedAt
        self.modifiedByUser = modifiedByUser
        self.createdAt = createdAt
        self.createdByUser = createdByUser
        self.parentId = parentId
        self.isLink = isLink
        self.isFavorite = isFavorite
        self.content = content
        self.aspectNames = aspectNames
        self.properties = properties
        self.allowableOperations = allowableOperations
        self.path = path
        self.permissions = permissions
        self.definition = definition
        self.search = search
        self.archivedByUser = archivedByUser
        self.archivedAt = archivedAt
        self.versionLabel = versionLabel
        self.versionComment = versionComment
    }

    public enum CodingKeys: String, CodingKey { 
        case _id = "id"
        case name
        case nodeType
        case isFolder
        case isFile
        case isLocked
        case modifiedAt
        case modifiedByUser
        case createdAt
        case createdByUser
        case parentId
        case isLink
        case isFavorite
        case content
        case aspectNames
        case properties
        case allowableOperations
        case path
        case permissions
        case definition
        case search
        case archivedByUser
        case archivedAt
        case versionLabel
        case versionComment
    }


}

