//
//  Comic.swift
//  tmdb
//
//  Created by Daniel Lourenco Macedo on 27/02/20.
//  Copyright © 2020 Daniel Lourenco Macedo. All rights reserved.
//

import Foundation
class Comic: Codable {
    let id, digitalId: Int
    let title: String
    let issueNumber: Double
    let variantDescription: String
    let description: String?
    let modified: String
    let isbn: String
    let upc: String
    let diamondCode: String
    let ean, issn: String
    let format: String
    let pageCount: Int
    let textObjects: [TextObject]
    let resourceURI: String
    let urls: [Url]
    let series: SeriesSummary
    let variants: [ComicSummary]
    let collections: [ComicSummary]
    let collectedIssues: [ComicSummary]
    let dates: [ComicDate]
    let prices: [ComicPrice]
    let thumbnail: Thumbnail
    let images: [Thumbnail]
    let creators: CreatorList
    let characters: CharacterList
    let stories: StoryList
    let events: EventList
    
    enum CodingKeys: String, CodingKey {
        case id
        case digitalId
        case title, issueNumber, variantDescription
        case description
        case modified, isbn, upc, diamondCode, ean, issn, format, pageCount, textObjects, resourceURI, urls, series, variants, collections, collectedIssues, dates, prices, thumbnail, images, creators, characters, stories, events
    }
    
    init(id: Int, digitalId: Int, title: String, issueNumber: Double, variantDescription: String, description: String?, modified: String, isbn: String, upc: String, diamondCode: String, ean: String, issn: String, format: String, pageCount: Int, textObjects: [TextObject], resourceURI: String, urls: [Url], series: SeriesSummary, variants: [ComicSummary], collections: [ComicSummary], collectedIssues: [ComicSummary], dates: [ComicDate], prices: [ComicPrice], thumbnail: Thumbnail, images: [Thumbnail], creators: CreatorList, characters: CharacterList, stories: StoryList, events: EventList) {
        self.id = id
        self.digitalId = digitalId
        self.title = title
        self.issueNumber = issueNumber
        self.variantDescription = variantDescription
        self.description = description
        self.modified = modified
        self.isbn = isbn
        self.upc = upc
        self.diamondCode = diamondCode
        self.ean = ean
        self.issn = issn
        self.format = format
        self.pageCount = pageCount
        self.textObjects = textObjects
        self.resourceURI = resourceURI
        self.urls = urls
        self.series = series
        self.variants = variants
        self.collections = collections
        self.collectedIssues = collectedIssues
        self.dates = dates
        self.prices = prices
        self.thumbnail = thumbnail
        self.images = images
        self.creators = creators
        self.characters = characters
        self.stories = stories
        self.events = events
    }
}
