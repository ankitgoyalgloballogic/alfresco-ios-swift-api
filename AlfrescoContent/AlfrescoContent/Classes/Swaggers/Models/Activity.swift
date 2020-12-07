//
// Activity.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** Activities describe any past activity in a site, for example creating an item of content, commenting on a node, liking an item of content.  */

public struct Activity: Codable {

    /** The id of the person who performed the activity */
    public var postPersonId: String
    /** The unique id of the activity */
    public var _id: Int64
    /** The unique id of the site on which the activity was performed */
    public var siteId: String?
    /** The date time at which the activity was performed */
    public var postedAt: Date?
    /** The feed on which this activity was posted */
    public var feedPersonId: String
    /** An object summarizing the activity */
    public var activitySummary: [String:String]?
    /** The type of the activity posted */
    public var activityType: String

    public init(postPersonId: String, _id: Int64, siteId: String?, postedAt: Date?, feedPersonId: String, activitySummary: [String:String]?, activityType: String) {
        self.postPersonId = postPersonId
        self._id = _id
        self.siteId = siteId
        self.postedAt = postedAt
        self.feedPersonId = feedPersonId
        self.activitySummary = activitySummary
        self.activityType = activityType
    }

    public enum CodingKeys: String, CodingKey { 
        case postPersonId
        case _id = "id"
        case siteId
        case postedAt
        case feedPersonId
        case activitySummary
        case activityType
    }


}

