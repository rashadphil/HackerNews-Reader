//
//  Story.swift
//  HackerNewsReader
//
//  Created by Rashad Philizaire on 6/24/22.
//

import Foundation
import UIKit
import SwiftyJSON

class Story {
    var deleted: Bool
    var by: User
    var creationTime: Date
    var itemText: String
    var dead: Bool
    var kids: [Comment]
    var url: String
    var score: Int
    var title: String
    var commentCount: Int
    var storyImage: UIImage
    var id: Int
    
    init() {
        self.deleted = false
        self.by = User()
        self.creationTime = Date()
        self.itemText = ""
        self.dead = false
        self.kids = []
        self.url = "untools.co"
        self.score = 855
        self.title = "Tools for Better Thinking and Other Stuff"
        self.commentCount = 72
        self.storyImage = UIImage(systemName: "heart.fill")!
        self.id = 0
    }
    
    init(book: JSON) {
        print(book)
        self.deleted = false
        self.by = User()
        self.creationTime = Date()
        self.itemText = book["text"].string ?? ""
        self.dead = false
        self.kids = []
        self.url = book["url"].string ?? ""
        self.score = book["score"].int ?? 0
        self.title = book["title"].string ?? ""
        self.commentCount = book["descendants"].int ?? 0
        self.storyImage = UIImage(systemName: "heart.fill")!
        self.id = book["id"].int ?? 0
        
    }
    
    
    static func storiesWithIdArray (idArray: [Int]) -> [Story] {
        var stories : [Story] = []
        for id in idArray {
            APIManager.sharedManager.getItemById(itemId: id, onSuccess: {json in
                let story = Story(book: json)
                stories.append(story)
                print(stories.count)
                
            }, onFailure: {error in
                
            })
        }
        print(stories.count)
        return stories
    }
    
    
//    init() {
//        self.deleted = false
//        self.by = User()
//        self.creationTime = Date()
//        self.itemText = ""
//        self.dead = false
//        self.kids = []
//        self.url = ""
//        self.score = 0
//        self.title = ""
//        self.commentCount = 0
//        self.storyImage = UIImage()
//        self.id = 0
//    }
    
}
