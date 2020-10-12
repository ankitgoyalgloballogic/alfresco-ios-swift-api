//
// RequestHighlight.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** Request that highlight fragments to be added to result set rows The properties reflect SOLR highlighting parameters.  */

public struct RequestHighlight: Codable {

    /** The string used to mark the start of a highlight in a fragment. */
    public var _prefix: String?
    /** The string used to mark the end of a highlight in a fragment. */
    public var _postfix: String?
    /** The maximum number of distinct highlight snippets to return for each highlight field. */
    public var snippetCount: Int?
    /** The character length of each snippet. */
    public var fragmentSize: Int?
    /** The number of characters to be considered for highlighting. Matches after this count will not be shown. */
    public var maxAnalyzedChars: Int?
    /** If fragments over lap they can be  merged into one larger fragment */
    public var mergeContiguous: Bool?
    /** Should phrases be identified. */
    public var usePhraseHighlighter: Bool?
    /** The fields to highlight and field specific configuration properties for each field */
    public var fields: [RequestHighlightFields]?

    public init(_prefix: String?, _postfix: String?, snippetCount: Int?, fragmentSize: Int?, maxAnalyzedChars: Int?, mergeContiguous: Bool?, usePhraseHighlighter: Bool?, fields: [RequestHighlightFields]?) {
        self._prefix = _prefix
        self._postfix = _postfix
        self.snippetCount = snippetCount
        self.fragmentSize = fragmentSize
        self.maxAnalyzedChars = maxAnalyzedChars
        self.mergeContiguous = mergeContiguous
        self.usePhraseHighlighter = usePhraseHighlighter
        self.fields = fields
    }

    public enum CodingKeys: String, CodingKey { 
        case _prefix = "prefix"
        case _postfix = "postfix"
        case snippetCount
        case fragmentSize
        case maxAnalyzedChars
        case mergeContiguous
        case usePhraseHighlighter
        case fields
    }


}
