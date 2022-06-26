//
//  Item.swift
//  HackerNewsReader
//
//  Created by Rashad Philizaire on 6/24/22.
//

import Foundation
import UIKit

enum ItemType {
    case story(Story)
//    case comment(Comment)
//    case job(Job)
}

protocol Item {
    var id : Int {get set}
    var deleted : Bool {get set}
//    var type : ItemType? {get set}
    var by : User {get set}
    var creationTime : Date {get set}
    var itemText : String {get set}
    var dead : Bool {get set}
//    var parent : ItemType? {get set}
    var kids : [Comment] {get set}
    var url : String {get set}
    var score : Int {get set}
    var title : String {get set}
    var commentCount : Int {get set}
    
    // not included in API
    var storyImage : UIImage {get set}
    
}
