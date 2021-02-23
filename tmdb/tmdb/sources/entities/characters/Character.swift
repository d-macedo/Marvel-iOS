//
//  Character.swift
//  tmdb
//
//  Created by Daniel Lourenco Macedo on 05/02/20.
//  Copyright © 2020 Daniel Lourenco Macedo. All rights reserved.
//
import Foundation
class Character: Codable {
    let id: Int
    let name, description: String
    let modified: String
    let thumbnail: Thumbnail
    let resourceURI: String
    let comics: ComicList
    let series: SeriesList
    let stories: StoryList
    let events: EventList
    let urls: [Url]
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case description
        case modified, thumbnail, resourceURI, comics, series, stories, events, urls
    }
    
    init(id: Int, name: String, description: String, modified: String, thumbnail: Thumbnail, resourceURI: String, comics: ComicList, series: SeriesList, stories: StoryList, events: EventList, urls: [Url]) {
        self.id = id
        self.name = name
        self.description = description
        self.modified = modified
        self.thumbnail = thumbnail
        self.resourceURI = resourceURI
        self.comics = comics
        self.series = series
        self.stories = stories
        self.events = events
        self.urls = urls
    }
}
